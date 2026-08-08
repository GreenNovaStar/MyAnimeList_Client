import 'dart:convert';
import 'dart:typed_data';

import 'package:android_app/data/api/myanimelist/base_client.dart';
import 'package:android_app/data/api/myanimelist/user_client.dart';
import 'package:android_app/data/exceptions/app_exception.dart';
import 'package:android_app/data/model/ranking_type.dart';
import 'package:android_app/data/model/token.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

/// Fake HTTP layer: records every request and replays a canned handler,
/// so client tests exercise the real Dio pipeline (query building, JSON
/// decoding, status-code errors) without the network.
class _FakeAdapter implements HttpClientAdapter {
  final ResponseBody Function(RequestOptions options) handler;
  final List<RequestOptions> requests = [];

  _FakeAdapter(this.handler);

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    return handler(options);
  }

  @override
  void close({bool force = false}) {}
}

ResponseBody _json(Map<String, dynamic> body, {int status = 200}) {
  return ResponseBody.fromString(
    jsonEncode(body),
    status,
    headers: {
      Headers.contentTypeHeader: [Headers.jsonContentType],
    },
  );
}

MALUserClient _client(_FakeAdapter adapter) {
  final client = MALUserClient(
    token: const OAuthToken(
      tokenType: 'Bearer',
      expiresIn: 100,
      accessToken: 'test-token',
      refreshToken: 'r',
    ),
  );
  client.dio.httpClientAdapter = adapter;
  return client;
}

void main() {
  group('getAndParse', () {
    test('GETs the path with auth header and parses the body', () async {
      final adapter = _FakeAdapter(
        (options) =>
            _json({'id': 1, 'title': 'Cowboy Bebop', 'num_episodes': 26}),
      );
      final client = _client(adapter);

      final details = await client.getAnimeDetails(1);

      expect(details.title, 'Cowboy Bebop');
      expect(details.numEpisodes, 26);
      final request = adapter.requests.single;
      expect(request.path, '/anime/1');
      expect(request.headers['Authorization'], 'Bearer test-token');
      expect(
        request.queryParameters['fields'],
        MALBaseClient.animeDetailFields,
      );
    });

    test('maps HTTP errors through mapDioException with context', () async {
      final adapter = _FakeAdapter((options) => _json({}, status: 404));
      final client = _client(adapter);

      expect(
        () => client.getAnimeDetails(999),
        throwsA(
          isA<NovaNotFoundException>().having(
            (e) => e.message,
            'message',
            contains('999'),
          ),
        ),
      );
    });

    test('maps 401 to NovaAuthException', () async {
      final adapter = _FakeAdapter((options) => _json({}, status: 401));
      final client = _client(adapter);

      expect(
        () => client.getMyUserProfile(),
        throwsA(isA<NovaAuthException>()),
      );
    });
  });

  group('list endpoints', () {
    test('getAnimeRanking sends ranking_type and fields', () async {
      final adapter = _FakeAdapter(
        (options) => _json({'data': [], 'paging': {}}),
      );
      final client = _client(adapter);

      await client.getAnimeRanking(AnimeRankingType.trend);

      final request = adapter.requests.single;
      expect(request.path, '/anime/ranking');
      expect(request.queryParameters['ranking_type'], 'trend');
      expect(request.queryParameters['fields'], MALBaseClient.listFields);
    });

    test('getSeasonalAnime targets the year/season path', () async {
      final adapter = _FakeAdapter(
        (options) => _json({
          'data': [],
          'paging': {},
          'season': {'year': 2026, 'season': 'summer'},
        }),
      );
      final client = _client(adapter);

      final seasonal = await client.getSeasonalAnime('2026', 'summer');

      expect(seasonal.season.year, 2026);
      expect(adapter.requests.single.path, '/anime/season/2026/summer');
    });

    test('getUserAnimeList omits status when null', () async {
      final adapter = _FakeAdapter(
        (options) => _json({'data': [], 'paging': {}}),
      );
      final client = _client(adapter);

      await client.getUserAnimeList();

      final query = adapter.requests.single.queryParameters;
      expect(query.containsKey('status'), isFalse);
      expect(query['sort'], 'list_updated_at');
    });

    test('searchAnime forwards the query and paging params', () async {
      final adapter = _FakeAdapter(
        (options) => _json({'data': [], 'paging': {}}),
      );
      final client = _client(adapter);

      await client.searchAnime('bebop', limit: 5, offset: 10);

      final request = adapter.requests.single;
      expect(request.path, '/anime');
      expect(request.queryParameters['q'], 'bebop');
      expect(request.queryParameters['limit'], 5);
      expect(request.queryParameters['offset'], 10);
    });
  });

  group('list mutations', () {
    test('updateMyAnimeListStatus PATCHes a form body without nulls', () async {
      final adapter = _FakeAdapter(
        (options) => _json({'status': 'watching', 'score': 8}),
      );
      final client = _client(adapter);

      final result = await client.updateMyAnimeListStatus(
        42,
        status: 'watching',
        score: 8,
        isRewatching: false,
      );

      expect(result.status, 'watching');
      final request = adapter.requests.single;
      expect(request.method, 'PATCH');
      expect(request.path, '/anime/42/my_list_status');
      expect(request.contentType, contains('x-www-form-urlencoded'));
      final body = request.data as Map<String, dynamic>;
      expect(body['status'], 'watching');
      expect(body['score'], 8);
      // Booleans are stringified for the form encoding; nulls are dropped.
      expect(body['is_rewatching'], 'false');
      expect(body.containsKey('comments'), isFalse);
      // Auth header survives the form-options override.
      expect(request.headers['Authorization'], 'Bearer test-token');
    });

    test('deleteMyAnimeListStatus DELETEs the list entry', () async {
      final adapter = _FakeAdapter((options) => _json({}));
      final client = _client(adapter);

      await client.deleteMyAnimeListStatus(42);

      final request = adapter.requests.single;
      expect(request.method, 'DELETE');
      expect(request.path, '/anime/42/my_list_status');
    });
  });
}
