import 'dart:convert';
import 'dart:typed_data';

import 'package:android_app/data/api/myanimelist/guest_client.dart';
import 'package:android_app/data/model/media_kind.dart';
import 'package:android_app/providers/client_provider.dart';
import 'package:android_app/providers/search_provider.dart';
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

/// Search works for guests too — use the guest client to prove it.
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

  test('anime search targets /anime with the query', () async {
    final adapter = _PagedAdapter({
      0: _page(ids: [1], hasNext: true),
    });
    final container = _container(adapter);

    final state = await container.read(
      searchProvider((kind: MediaKind.anime, query: 'bebop')).future,
    );

    expect(state.items.single.node.id, 1);
    expect(state.hasMore, isTrue);
    final request = adapter.requests.single;
    expect(request.path, '/anime');
    expect(request.queryParameters['q'], 'bebop');
    // Guest client authenticates via the client-id header.
    expect(request.headers['X-MAL-CLIENT-ID'], 'test-client-id');
  });

  test('manga search targets /manga', () async {
    final adapter = _PagedAdapter({
      0: _page(ids: [2]),
    });
    final container = _container(adapter);

    await container.read(
      searchProvider((kind: MediaKind.manga, query: 'berserk')).future,
    );

    expect(adapter.requests.single.path, '/manga');
    expect(adapter.requests.single.queryParameters['q'], 'berserk');
  });

  test('loadMore appends the next page at the right offset', () async {
    final adapter = _PagedAdapter({
      0: _page(ids: [1, 2], hasNext: true),
      2: _page(ids: [3]),
    });
    final container = _container(adapter);
    final provider = searchProvider((kind: MediaKind.anime, query: 'one'));
    final sub = container.listen(provider, (_, _) {});
    addTearDown(sub.close);

    await container.read(provider.future);
    await container.read(provider.notifier).loadMore();

    final state = container.read(provider).requireValue;
    expect(state.items.map((d) => d.node.id), [1, 2, 3]);
    expect(state.hasMore, isFalse);
    expect(adapter.requests.last.queryParameters['offset'], 2);
  });

  test('distinct queries are independent cached instances', () async {
    final adapter = _PagedAdapter({
      0: _page(ids: [1]),
    });
    final container = _container(adapter);

    await container.read(
      searchProvider((kind: MediaKind.anime, query: 'naruto')).future,
    );
    await container.read(
      searchProvider((kind: MediaKind.anime, query: 'bleach')).future,
    );

    expect(adapter.requests, hasLength(2));
    expect(adapter.requests[0].queryParameters['q'], 'naruto');
    expect(adapter.requests[1].queryParameters['q'], 'bleach');
  });
}
