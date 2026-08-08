import 'package:android_app/data/api/myanimelist/user_client.dart';
import 'package:android_app/data/model/data.dart';
import 'package:android_app/data/model/media_kind.dart';
import 'package:android_app/data/model/my_list_status.dart';
import 'package:android_app/providers/client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const int _pageSize = 50;

/// Family key for one list view: which media type, filtered to which wire
/// status value (null = all statuses), ordered by which wire sort value.
/// A record so equality is structural.
typedef MyListKey = ({MediaKind kind, String? status, String sort});

/// One page-accumulating view of the user's anime or manga list. [items]
/// grows as pages load; [hasMore] mirrors the API's paging.next.
class MyListState {
  final List<Data> items;
  final bool hasMore;

  const MyListState({required this.items, required this.hasMore});
}

/// The user's anime/manga list for a given status filter, sorted by last
/// update.
final myListProvider = AsyncNotifierProvider.autoDispose
    .family<MyListNotifier, MyListState, MyListKey>(MyListNotifier.new);

class MyListNotifier
    extends AutoDisposeFamilyAsyncNotifier<MyListState, MyListKey> {
  bool _loadingMore = false;

  @override
  Future<MyListState> build(MyListKey arg) => _fetchPage(offset: 0);

  Future<MyListState> _fetchPage({required int offset}) async {
    final client = ref.read(malClientProvider);
    if (client is! MALUserClient) {
      // Guests have no list; the screen is only reachable when signed in.
      return const MyListState(items: [], hasMore: false);
    }
    final page = switch (arg.kind) {
      MediaKind.anime => await client.getUserAnimeList(
        status: arg.status,
        sort: arg.sort,
        limit: _pageSize,
        offset: offset,
      ),
      MediaKind.manga => await client.getUserMangaList(
        status: arg.status,
        sort: arg.sort,
        limit: _pageSize,
        offset: offset,
      ),
    };
    // offset 0 is a fresh load/refresh — don't append onto stale state
    // (Riverpod keeps the previous value during a rebuild).
    final previous = offset == 0 ? const <Data>[] : state.valueOrNull!.items;
    return MyListState(
      items: [...previous, ...page.data],
      hasMore: page.paging.next != null,
    );
  }

  /// Replaces one entry's list status in place (after a quick edit or +1),
  /// keeping loaded pages and scroll position. Pass null to remove the entry
  /// (deleted from list). No-op when the list isn't loaded.
  void patchEntry(int id, MyListStatus? status) {
    final current = state.valueOrNull;
    if (current == null) return;
    final items = status == null
        ? current.items.where((d) => d.node.id != id).toList()
        : [
            for (final d in current.items)
              d.node.id == id ? d.copyWith(listStatus: status) : d,
          ];
    state = AsyncData(MyListState(items: items, hasMore: current.hasMore));
  }

  /// Appends the next page. No-op while a page is already in flight or when
  /// the list is exhausted; errors surface via the provider's error state.
  Future<void> loadMore() async {
    final current = state.valueOrNull;
    if (current == null || !current.hasMore || _loadingMore) return;
    _loadingMore = true;
    try {
      state = AsyncData(await _fetchPage(offset: current.items.length));
    } catch (e, st) {
      state = AsyncError(e, st);
    } finally {
      _loadingMore = false;
    }
  }
}
