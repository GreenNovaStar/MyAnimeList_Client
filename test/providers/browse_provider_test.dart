import 'dart:convert';
import 'dart:typed_data';

import 'package:android_app/data/api/myanimelist/guest_client.dart';
import 'package:android_app/providers/browse_provider.dart';
import 'package:android_app/providers/client_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

/// Replays one canned page per request, keyed by the offset query param.
class _PagedAdapter implements HttpClientAdapter {
  final Map<int, Map<String, dynamic>> pages;
  final List<RequestOptions> requests = [];

  _PagedAdapter(this.pages);

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    final offset = options.queryParameters['offset'] as int? ?? 0;
    return ResponseBody.fromString(
      jsonEncode(pages[offset]!),
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

Map<String, dynamic> _page({required List<int> ids, bool hasNext = false}) {
  return {
    'data': [
      for (final id in ids)
        {
          'node': {'id': id, 'title': 'title $id'},
        },
    ],
    'paging': {if (hasNext) 'next': 'https://next'},
  };
}

ProviderContainer _container(_PagedAdapter adapter) {
  final client = MALGuestClient();
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

  test('anime ranking source pages through /anime/ranking', () async {
    final adapter = _PagedAdapter({
      0: _page(ids: [1, 2], hasNext: true),
      2: _page(ids: [3]),
    });
    final container = _container(adapter);
    final provider = browseProvider(BrowseSource.popularAnime);
    // Keep the autoDispose provider alive across the await gaps.
    final sub = container.listen(provider, (_, _) {});
    addTearDown(sub.close);

    await container.read(provider.future);
    await container.read(provider.notifier).loadMore();

    final state = container.read(provider).requireValue;
    expect(state.items.map((d) => d.node.id), [1, 2, 3]);
    expect(state.hasMore, isFalse);
    expect(adapter.requests, hasLength(2));
    expect(adapter.requests.every((r) => r.path == '/anime/ranking'), isTrue);
    expect(
      adapter.requests.first.queryParameters['ranking_type'],
      'bypopularity',
    );
    expect(adapter.requests.last.queryParameters['offset'], 2);
  });

  test('manga source targets /manga/ranking with its type', () async {
    final adapter = _PagedAdapter({
      0: _page(ids: [7]),
    });
    final container = _container(adapter);

    final state = await container.read(
      browseProvider(BrowseSource.manhwa).future,
    );

    expect(state.items.single.node.id, 7);
    final request = adapter.requests.single;
    expect(request.path, '/manga/ranking');
    expect(request.queryParameters['ranking_type'], 'manhwa');
  });

  test('suggestions source returns empty for guests', () async {
    final adapter = _PagedAdapter({});
    final container = _container(adapter);

    final state = await container.read(
      browseProvider(BrowseSource.suggestions).future,
    );

    expect(state.items, isEmpty);
    expect(state.hasMore, isFalse);
    expect(adapter.requests, isEmpty); // no request fired
  });
}
