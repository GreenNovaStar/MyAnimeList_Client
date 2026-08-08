import 'dart:convert';
import 'dart:typed_data';

import 'package:android_app/data/model/list_status_type.dart';
import 'package:android_app/data/model/media_kind.dart';
import 'package:android_app/data/model/my_list_status.dart';
import 'package:android_app/data/model/token.dart';
import 'package:android_app/data/api/myanimelist/user_client.dart';
import 'package:android_app/providers/client_provider.dart';
import 'package:android_app/providers/my_list_provider.dart';
import 'package:dio/dio.dart';
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

const MyListKey _allAnime = (
  kind: MediaKind.anime,
  status: null,
  sort: 'list_updated_at',
);

void main() {
  test('loads the first page and reports hasMore from paging.next', () async {
    final adapter = _PagedAdapter({
      0: _page(ids: [1, 2], hasNext: true),
    });
    final container = _container(adapter);

    final state = await container.read(myListProvider(_allAnime).future);

    expect(state.items.map((d) => d.node.id), [1, 2]);
    expect(state.hasMore, isTrue);
    expect(adapter.requests.single.path, '/users/@me/animelist');
  });

  test('loadMore appends the next page and flips hasMore', () async {
    final adapter = _PagedAdapter({
      0: _page(ids: [1, 2], hasNext: true),
      2: _page(ids: [3]),
    });
    final container = _container(adapter);
    final provider = myListProvider(_allAnime);
    // Keep the autoDispose provider alive across the await gaps.
    final sub = container.listen(provider, (_, _) {});
    addTearDown(sub.close);

    await container.read(provider.future);
    await container.read(provider.notifier).loadMore();

    final state = container.read(provider).requireValue;
    expect(state.items.map((d) => d.node.id), [1, 2, 3]);
    expect(state.hasMore, isFalse);
    // Second request asked for the next slice.
    expect(adapter.requests.last.queryParameters['offset'], 2);
  });

  test('loadMore is a no-op when the list is exhausted', () async {
    final adapter = _PagedAdapter({
      0: _page(ids: [1]),
    });
    final container = _container(adapter);
    final provider = myListProvider(_allAnime);
    final sub = container.listen(provider, (_, _) {});
    addTearDown(sub.close);

    await container.read(provider.future);
    await container.read(provider.notifier).loadMore();

    expect(adapter.requests, hasLength(1));
  });

  test('passes the status filter on the wire', () async {
    final adapter = _PagedAdapter({
      0: _page(ids: [1]),
    });
    final container = _container(adapter);

    await container.read(
      myListProvider((
        kind: MediaKind.anime,
        status: AnimeListStatus.watching.value,
        sort: ListSort.listScore.value,
      )).future,
    );

    expect(adapter.requests.single.queryParameters['status'], 'watching');
    expect(adapter.requests.single.queryParameters['sort'], 'list_score');
  });

  test('manga kind targets the mangalist endpoint', () async {
    final adapter = _PagedAdapter({
      0: _page(ids: [7]),
    });
    final container = _container(adapter);

    final state = await container.read(
      myListProvider((
        kind: MediaKind.manga,
        status: MangaListStatus.reading.value,
        sort: ListSort.listUpdatedAt.value,
      )).future,
    );

    expect(state.items.single.node.id, 7);
    final request = adapter.requests.single;
    expect(request.path, '/users/@me/mangalist');
    expect(request.queryParameters['status'], 'reading');
  });

  test('patchEntry replaces one entry\'s status in place', () async {
    final adapter = _PagedAdapter({
      0: _page(ids: [1, 2], hasNext: true),
    });
    final container = _container(adapter);
    final provider = myListProvider(_allAnime);
    final sub = container.listen(provider, (_, _) {});
    addTearDown(sub.close);

    await container.read(provider.future);
    container
        .read(provider.notifier)
        .patchEntry(2, const MyListStatus(status: 'watching', score: 8));

    final state = container.read(provider).requireValue;
    expect(state.items.map((d) => d.node.id), [1, 2]); // order kept
    expect(state.items[0].listStatus, isNull); // untouched
    expect(state.items[1].listStatus?.score, 8);
    expect(state.hasMore, isTrue); // paging state kept
    expect(adapter.requests, hasLength(1)); // no refetch
  });

  test('patchEntry with null removes the entry (deleted from list)', () async {
    final adapter = _PagedAdapter({
      0: _page(ids: [1, 2]),
    });
    final container = _container(adapter);
    final provider = myListProvider(_allAnime);
    final sub = container.listen(provider, (_, _) {});
    addTearDown(sub.close);

    await container.read(provider.future);
    container.read(provider.notifier).patchEntry(1, null);

    final state = container.read(provider).requireValue;
    expect(state.items.map((d) => d.node.id), [2]);
  });

  test('anime and manga families are independent instances', () async {
    final adapter = _PagedAdapter({
      0: _page(ids: [1]),
    });
    final container = _container(adapter);

    await container.read(myListProvider(_allAnime).future);
    await container.read(
      myListProvider((
        kind: MediaKind.manga,
        status: null,
        sort: 'list_updated_at',
      )).future,
    );

    expect(adapter.requests, hasLength(2));
    expect(adapter.requests[0].path, '/users/@me/animelist');
    expect(adapter.requests[1].path, '/users/@me/mangalist');
  });
}
