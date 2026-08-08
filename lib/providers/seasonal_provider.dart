import 'package:android_app/data/model/data.dart';
import 'package:android_app/providers/client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const int _pageSize = 50;

/// Family key for one season's list. A record so equality is structural.
typedef SeasonKey = ({int year, String season});

/// One page-accumulating seasonal list. Same shape as the other paged states:
/// [items] grows as pages load; [hasMore] mirrors the API's paging.next.
class SeasonalState {
  final List<Data> items;
  final bool hasMore;

  const SeasonalState({required this.items, required this.hasMore});
}

/// All anime airing in one season, sorted by list-users (most popular first).
final seasonalProvider = AsyncNotifierProvider.autoDispose
    .family<SeasonalNotifier, SeasonalState, SeasonKey>(SeasonalNotifier.new);

class SeasonalNotifier
    extends AutoDisposeFamilyAsyncNotifier<SeasonalState, SeasonKey> {
  bool _loadingMore = false;

  @override
  Future<SeasonalState> build(SeasonKey arg) => _fetchPage(offset: 0);

  Future<SeasonalState> _fetchPage({required int offset}) async {
    final client = ref.read(malClientProvider);
    final page = await client.getSeasonalAnime(
      arg.year.toString(),
      arg.season,
      limit: _pageSize,
      offset: offset,
    );
    // offset 0 is a fresh load/refresh — don't append onto stale state.
    final previous = offset == 0 ? const <Data>[] : state.valueOrNull!.items;
    return SeasonalState(
      items: [...previous, ...page.data],
      hasMore: page.paging.next != null,
    );
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
