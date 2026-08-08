import 'dart:convert';
import 'dart:typed_data';

import 'package:android_app/data/api/myanimelist/guest_client.dart';
import 'package:android_app/providers/client_provider.dart';
import 'package:android_app/providers/seasonal_provider.dart';
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
    'season': {'year': 2024, 'season': 'spring'},
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

  test('targets the year/season path and pages through it', () async {
    final adapter = _PagedAdapter({
      0: _page(ids: [1, 2], hasNext: true),
      2: _page(ids: [3]),
    });
    final container = _container(adapter);
    final provider = seasonalProvider((year: 2024, season: 'spring'));
    // Keep the autoDispose provider alive across the await gaps.
    final sub = container.listen(provider, (_, _) {});
    addTearDown(sub.close);

    await container.read(provider.future);
    await container.read(provider.notifier).loadMore();

    final state = container.read(provider).requireValue;
    expect(state.items.map((d) => d.node.id), [1, 2, 3]);
    expect(state.hasMore, isFalse);
    expect(
      adapter.requests.every((r) => r.path == '/anime/season/2024/spring'),
      isTrue,
    );
    expect(adapter.requests.last.queryParameters['offset'], 2);
  });

  test('distinct seasons are independent cached instances', () async {
    final adapter = _PagedAdapter({
      0: _page(ids: [1]),
    });
    final container = _container(adapter);

    await container.read(
      seasonalProvider((year: 2024, season: 'spring')).future,
    );
    await container.read(seasonalProvider((year: 2023, season: 'fall')).future);

    expect(adapter.requests, hasLength(2));
    expect(adapter.requests[0].path, '/anime/season/2024/spring');
    expect(adapter.requests[1].path, '/anime/season/2023/fall');
  });
}
