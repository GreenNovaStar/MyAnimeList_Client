import 'package:android_app/data/api/myanimelist/user_client.dart';
import 'package:android_app/data/model/data.dart';
import 'package:android_app/data/model/media_kind.dart';
import 'package:android_app/data/model/ranking_type.dart';
import 'package:android_app/providers/client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const int _pageSize = 50;

/// Every home rail a "See all" can expand into a full paginated list. Carries
/// the display title and which media type its items open as. (The home body
/// routes the two seasonal sources to the season browser screen instead of
/// [BrowseScreen], so their provider cases below are effectively fallbacks.)
enum BrowseSource {
  trendingAnime('Trending', MediaKind.anime),
  currentSeason('This Season', MediaKind.anime),
  nextSeason('Next Season', MediaKind.anime),
  popularAnime('Popular', MediaKind.anime),
  suggestions('Suggestions', MediaKind.anime),
  topManga('Top Manga', MediaKind.manga),
  popularManga('Popular', MediaKind.manga),
  novels('Novels', MediaKind.manga),
  manhwa('Manhwa', MediaKind.manga);

  final String title;
  final MediaKind kind;
  const BrowseSource(this.title, this.kind);
}

/// One page-accumulating browse list. Same shape as the search and my-list
/// states: [items] grows as pages load; [hasMore] mirrors the API's
/// paging.next.
class BrowseState {
  final List<Data> items;
  final bool hasMore;

  const BrowseState({required this.items, required this.hasMore});
}

/// The full paginated list behind one home rail.
final browseProvider = AsyncNotifierProvider.autoDispose
    .family<BrowseNotifier, BrowseState, BrowseSource>(BrowseNotifier.new);

class BrowseNotifier
    extends AutoDisposeFamilyAsyncNotifier<BrowseState, BrowseSource> {
  bool _loadingMore = false;

  @override
  Future<BrowseState> build(BrowseSource arg) => _fetchPage(offset: 0);

  Future<BrowseState> _fetchPage({required int offset}) async {
    final client = ref.read(malClientProvider);
    final (data, hasMore) = await switch (arg) {
      BrowseSource.trendingAnime =>
        client
            .getAnimeRanking(
              AnimeRankingType.trend,
              limit: _pageSize,
              offset: offset,
            )
            .then((r) => (r.data, r.paging.next != null)),
      BrowseSource.popularAnime =>
        client
            .getAnimeRanking(
              AnimeRankingType.bypopularity,
              limit: _pageSize,
              offset: offset,
            )
            .then((r) => (r.data, r.paging.next != null)),
      BrowseSource.currentSeason =>
        client
            .getCurrentSeasonAnimes(limit: _pageSize, offset: offset)
            .then((r) => (r.data, r.paging.next != null)),
      BrowseSource.nextSeason =>
        client
            .getNextSeasonAnimes(limit: _pageSize, offset: offset)
            .then((r) => (r.data, r.paging.next != null)),
      // Only reachable signed in (the rail is hidden for guests), but degrade
      // to empty rather than crash if a guest ever lands here.
      BrowseSource.suggestions =>
        client is MALUserClient
            ? client
                  .getAnimeSuggestions(limit: _pageSize, offset: offset)
                  .then((r) => (r.data, r.paging.next != null))
            : Future.value((const <Data>[], false)),
      BrowseSource.topManga => _manga(MangaRankingType.all, offset),
      BrowseSource.popularManga => _manga(
        MangaRankingType.bypopularity,
        offset,
      ),
      BrowseSource.novels => _manga(MangaRankingType.novels, offset),
      BrowseSource.manhwa => _manga(MangaRankingType.manhwa, offset),
    };
    // offset 0 is a fresh load/refresh — don't append onto stale state.
    final previous = offset == 0 ? const <Data>[] : state.valueOrNull!.items;
    return BrowseState(items: [...previous, ...data], hasMore: hasMore);
  }

  Future<(List<Data>, bool)> _manga(MangaRankingType type, int offset) {
    final client = ref.read(malClientProvider);
    return client
        .getMangaRanking(type, limit: _pageSize, offset: offset)
        .then((r) => (r.data, r.paging.next != null));
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
