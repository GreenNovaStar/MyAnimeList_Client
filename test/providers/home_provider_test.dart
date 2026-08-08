import 'dart:convert';
import 'dart:typed_data';

import 'package:android_app/data/api/myanimelist/guest_client.dart';
import 'package:android_app/data/api/myanimelist/user_client.dart';
import 'package:android_app/data/exceptions/app_exception.dart';
import 'package:android_app/data/model/ranking_type.dart';
import 'package:android_app/data/model/token.dart';
import 'package:android_app/providers/client_provider.dart';
import 'package:android_app/providers/home_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

/// Routes each request to a per-path handler; unlisted paths return 200 with
/// a minimal valid body for the endpoint shape.
class _RoutedAdapter implements HttpClientAdapter {
  /// Path substring -> HTTP status. Missing entries succeed.
  final Map<String, int> failures;
  final List<RequestOptions> requests = [];

  _RoutedAdapter({this.failures = const {}});

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    final failure = failures.entries
        .where((e) => options.path.contains(e.key))
        .firstOrNull;
    final status = failure?.value ?? 200;
    final body = options.path.contains('/season/')
        ? {
            'data': [
              {
                'node': {'id': 1, 'title': 'seasonal'},
              },
            ],
            'paging': {},
            'season': {'year': 2026, 'season': 'summer'},
          }
        : {
            'data': [
              {
                'node': {'id': 2, 'title': 'ranked'},
              },
            ],
            'paging': {},
          };
    return ResponseBody.fromString(
      jsonEncode(status == 200 ? body : {}),
      status,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

ProviderContainer _guestContainer(_RoutedAdapter adapter) {
  final client = MALGuestClient();
  client.dio.httpClientAdapter = adapter;
  final container = ProviderContainer(
    overrides: [malClientProvider.overrideWithValue(client)],
  );
  addTearDown(container.dispose);
  return container;
}

ProviderContainer _userContainer(_RoutedAdapter adapter) {
  final client = MALUserClient(
    token: const OAuthToken(
      tokenType: 'Bearer',
      expiresIn: 100,
      accessToken: 'a',
      refreshToken: 'r',
    ),
  );
  client.dio.httpClientAdapter = adapter;
  final container = ProviderContainer(
    overrides: [malClientProvider.overrideWithValue(client)],
  );
  addTearDown(container.dispose);
  return container;
}

void main() {
  setUpAll(() {
    dotenv.loadFromString(envString: 'CLIENT_ID=test-client-id');
  });

  test('all rails load when every fetch succeeds', () async {
    final container = _guestContainer(_RoutedAdapter());

    final trending = await container.read(trendingAnimeProvider.future);
    final current = await container.read(currentSeasonAnimeProvider.future);
    final next = await container.read(nextSeasonAnimeProvider.future);
    final popular = await container.read(popularAnimeProvider.future);
    final suggestions = await container.read(animeSuggestionsProvider.future);

    expect(trending.data, isNotEmpty);
    expect(current.data, isNotEmpty);
    expect(next.data, isNotEmpty);
    expect(popular.data, isNotEmpty);
    expect(suggestions, isNull); // guest
  });

  test('a failing rail errors alone; other rails are unaffected', () async {
    final container = _guestContainer(
      _RoutedAdapter(failures: {'/season/': 500}),
    );

    expect(
      () => container.read(currentSeasonAnimeProvider.future),
      throwsA(isA<NovaServerException>()),
    );
    // Independent providers: rankings still load fine.
    final trending = await container.read(trendingAnimeProvider.future);
    expect(trending.data, isNotEmpty);
  });

  test('suggestions failure is isolated for signed-in users', () async {
    final container = _userContainer(
      _RoutedAdapter(failures: {'/suggestions': 500}),
    );

    expect(
      () => container.read(animeSuggestionsProvider.future),
      throwsA(isA<NovaServerException>()),
    );
    final popular = await container.read(popularAnimeProvider.future);
    expect(popular.data, isNotEmpty);
  });

  test('manga ranking rails target /manga/ranking per ranking type', () async {
    final adapter = _RoutedAdapter();
    final container = _guestContainer(adapter);

    final top = await container.read(
      mangaRankingProvider(MangaRankingType.all).future,
    );
    await container.read(
      mangaRankingProvider(MangaRankingType.bypopularity).future,
    );

    expect(top.data, isNotEmpty);
    expect(adapter.requests, hasLength(2));
    expect(adapter.requests.every((r) => r.path == '/manga/ranking'), isTrue);
    expect(
      adapter.requests.map((r) => r.queryParameters['ranking_type']),
      containsAll(['all', 'bypopularity']),
    );
  });

  test('invalidating one rail refetches only that rail', () async {
    final adapter = _RoutedAdapter();
    final container = _guestContainer(adapter);
    // Keep providers alive so invalidate triggers a refetch we can observe.
    final subs = [
      container.listen(trendingAnimeProvider, (_, _) {}),
      container.listen(currentSeasonAnimeProvider, (_, _) {}),
    ];
    for (final sub in subs) {
      addTearDown(sub.close);
    }

    await container.read(trendingAnimeProvider.future);
    await container.read(currentSeasonAnimeProvider.future);
    final requestsBefore = adapter.requests.length;

    container.invalidate(trendingAnimeProvider);
    await container.read(trendingAnimeProvider.future);

    expect(adapter.requests.length, requestsBefore + 1);
    expect(adapter.requests.last.path, '/anime/ranking');
  });
}
