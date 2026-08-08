import 'package:android_app/data/model/data.dart';
import 'package:android_app/data/model/media_kind.dart';
import 'package:android_app/providers/client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const int _pageSize = 20;

/// Family key for one search: which media type, for which query. A record so
/// equality is structural (each distinct query gets its own cached instance).
typedef SearchKey = ({MediaKind kind, String query});

/// One page-accumulating search result set. Same shape as the list screens:
/// [items] grows as pages load; [hasMore] mirrors the API's paging.next.
class SearchState {
  final List<Data> items;
  final bool hasMore;

  const SearchState({required this.items, required this.hasMore});
}

/// Search results for a query. Works for guests and signed-in users alike
/// (signed-in responses additionally carry list_status on each row).
final searchProvider = AsyncNotifierProvider.autoDispose
    .family<SearchNotifier, SearchState, SearchKey>(SearchNotifier.new);

class SearchNotifier
    extends AutoDisposeFamilyAsyncNotifier<SearchState, SearchKey> {
  bool _loadingMore = false;

  @override
  Future<SearchState> build(SearchKey arg) => _fetchPage(offset: 0);

  Future<SearchState> _fetchPage({required int offset}) async {
    final client = ref.read(malClientProvider);
    final page = switch (arg.kind) {
      MediaKind.anime => await client.searchAnime(
        arg.query,
        limit: _pageSize,
        offset: offset,
      ),
      MediaKind.manga => await client.searchManga(
        arg.query,
        limit: _pageSize,
        offset: offset,
      ),
    };
    final previous = offset == 0 ? const <Data>[] : state.valueOrNull!.items;
    return SearchState(
      items: [...previous, ...page.data],
      hasMore: page.paging.next != null,
    );
  }

  /// Appends the next page. No-op while a page is already in flight or when
  /// the results are exhausted.
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
