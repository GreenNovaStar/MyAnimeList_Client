import 'package:android_app/data/model/data.dart';
import 'package:android_app/data/model/media_kind.dart';
import 'package:android_app/data/model/month.dart';
import 'package:android_app/data/model/ranking_type.dart';
import 'package:android_app/providers/browse_provider.dart';
import 'package:android_app/providers/home_provider.dart';
import 'package:android_app/providers/media_mode_provider.dart';
import 'package:android_app/ui/components/anime_list_row.dart';
import 'package:android_app/ui/components/anime_rail.dart';
import 'package:android_app/ui/components/featured_tile.dart';
import 'package:android_app/ui/components/nova/nova_empty_state.dart';
import 'package:android_app/ui/components/nova/nova_section_header.dart';
import 'package:android_app/ui/components/nova/nova_skeleton.dart';
import 'package:android_app/ui/screens/browse_screen.dart';
import 'package:android_app/ui/screens/media_detail_screen.dart';
import 'package:android_app/ui/screens/seasonal_screen.dart';
import 'package:android_app/utils/helpers/seasonal_helper.dart';
import 'package:android_app/utils/constants/size.dart';
import 'package:android_app/utils/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// One home rail resolved for this build: its title, fetch state, the
/// provider to invalidate on retry, the extracted items when loaded, and the
/// browse source its "See all" expands into.
typedef _Rail = ({
  String title,
  AsyncValue<dynamic> async,
  ProviderOrFamily provider,
  List<Data> items,
  BrowseSource source,
});

/// Scrollable home feed shared by guest and signed-in views, switched between
/// anime and manga mode by [mediaModeProvider]. Each rail is backed by its own
/// provider, so rails load, fail, and retry independently: a failed rail shows
/// an inline retry row while the others render normally. Only when every core
/// rail fails does the full-screen error state (with a single retry-all
/// button) appear. The first rail gets the featured treatment (hero tile +
/// rows); anime mode adds a Suggestions rail when signed in.
class HomeBody extends ConsumerWidget {
  const HomeBody({super.key});

  /// The manga home's ranking rails, in display order (first is featured).
  static const List<(BrowseSource, MangaRankingType)> _mangaRails = [
    (BrowseSource.topManga, MangaRankingType.all),
    (BrowseSource.popularManga, MangaRankingType.bypopularity),
    (BrowseSource.novels, MangaRankingType.novels),
    (BrowseSource.manhwa, MangaRankingType.manhwa),
  ];

  _Rail _resolve<T>(
    WidgetRef ref,
    BrowseSource source,
    AutoDisposeFutureProvider<T> provider,
    List<Data> Function(T value) items,
  ) {
    final async = ref.watch(provider);
    return (
      title: source.title,
      async: async,
      provider: provider,
      items: async.hasValue ? items(async.requireValue) : const [],
      source: source,
    );
  }

  /// This mode's rails in display order. Watches every rail provider, so the
  /// body rebuilds as each one resolves.
  List<_Rail> _rails(WidgetRef ref, MediaKind mode) {
    return switch (mode) {
      MediaKind.anime => [
        _resolve(
          ref,
          BrowseSource.trendingAnime,
          trendingAnimeProvider,
          (v) => v.data,
        ),
        _resolve(
          ref,
          BrowseSource.currentSeason,
          currentSeasonAnimeProvider,
          (v) => v.data,
        ),
        _resolve(
          ref,
          BrowseSource.nextSeason,
          nextSeasonAnimeProvider,
          (v) => v.data,
        ),
        _resolve(
          ref,
          BrowseSource.popularAnime,
          popularAnimeProvider,
          (v) => v.data,
        ),
        // Personalization: empty for guests, and a failure shows the same
        // inline retry as any other rail.
        _resolve(
          ref,
          BrowseSource.suggestions,
          animeSuggestionsProvider,
          (v) => v?.data ?? const [],
        ),
      ],
      MediaKind.manga => [
        for (final (source, type) in _mangaRails)
          _resolve(ref, source, mangaRankingProvider(type), (v) => v.data),
      ],
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(mediaModeProvider);
    final rails = _rails(ref, mode);
    // Suggestions is personalization on top; the rest must all fail before
    // the whole screen does.
    final core = mode == MediaKind.anime ? rails.sublist(0, 4) : rails;

    void refreshAll() {
      for (final rail in rails) {
        ref.invalidate(rail.provider);
      }
    }

    // First load: all core rails still fetching.
    if (core.every((r) => r.async.isLoading)) {
      return const SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: NovaSize.spaceSm),
            NovaRailSkeleton(),
            NovaRailSkeleton(),
            NovaRailSkeleton(),
            NovaRailSkeleton(),
            SizedBox(height: NovaSize.spaceMd),
          ],
        ),
      );
    }

    // Total failure (e.g. no connectivity): one full-screen retry for all.
    if (core.every((r) => r.async.hasError)) {
      final medium = mode == MediaKind.anime ? 'anime' : 'manga';
      return RefreshIndicator(
        onRefresh: () async => refreshAll(),
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: NovaEmptyState(
                icon: Icons.cloud_off_rounded,
                message:
                    "Couldn't load $medium.\nCheck your connection and try again.",
                actionLabel: 'Retry',
                onAction: refreshAll,
              ),
            ),
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async => refreshAll(),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: NovaSize.spaceSm),

            ..._featuredSection(context, ref, mode, rails.first),

            const SizedBox(height: NovaSize.spaceMd),

            for (final rail in rails.skip(1))
              ..._railSection(context, ref, mode, rail),

            const SizedBox(height: NovaSize.spaceMd),
          ],
        ),
      ),
    );
  }

  /// The first rail is bespoke (featured tile + rows), so it gets its own
  /// builder; loading/error states match the generic rails.
  List<Widget> _featuredSection(
    BuildContext context,
    WidgetRef ref,
    MediaKind mode,
    _Rail rail,
  ) {
    if (rail.async.isLoading) return const [NovaRailSkeleton()];
    if (rail.async.hasError) {
      return [_RailError(title: rail.title, provider: rail.provider)];
    }
    final items = rail.items;
    if (items.isEmpty) return const [];
    return [
      NovaSectionHeader(
        title: rail.title,
        trailing: TextButton(
          onPressed: () => _openBrowse(context, rail.source),
          child: const Text('See all'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: NovaSize.spaceSm),
        child: FeaturedTile(
          data: items.first,
          onTap: () => _showDetail(context, mode, items.first),
        ),
      ),
      const SizedBox(height: NovaSize.spaceSm),
      ...items
          .skip(1)
          .take(4)
          .map(
            (d) => Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: NovaSize.spaceSm,
                vertical: NovaSize.spaceXs,
              ),
              child: AnimeListRow(
                data: d,
                onTap: () => _showDetail(context, mode, d),
              ),
            ),
          ),
    ];
  }

  /// One horizontal rail: skeleton while loading, inline retry on error,
  /// nothing when empty, the rail + spacing otherwise.
  List<Widget> _railSection(
    BuildContext context,
    WidgetRef ref,
    MediaKind mode,
    _Rail rail,
  ) {
    if (rail.async.isLoading) return const [NovaRailSkeleton()];
    if (rail.async.hasError) {
      return [_RailError(title: rail.title, provider: rail.provider)];
    }
    if (rail.items.isEmpty) return const [];
    return [
      AnimeRail(
        title: rail.title,
        items: rail.items,
        onTap: (d) => _showDetail(context, mode, d),
        onSeeAll: () => _openBrowse(context, rail.source),
      ),
      const SizedBox(height: NovaSize.spaceMd),
    ];
  }

  void _openBrowse(BuildContext context, BrowseSource source) {
    // The seasonal rails open the season browser (year/season picker) instead
    // of a plain list; it starts on the rail's season.
    final Widget screen = switch (source) {
      BrowseSource.currentSeason => const SeasonalScreen(),
      BrowseSource.nextSeason => _nextSeasonScreen(),
      _ => BrowseScreen(source: source),
    };
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  SeasonalScreen _nextSeasonScreen() {
    final now = DateTime.now();
    final (season, year) = getNextSeason(
      Month.fromDateTime(now).season,
      now.year,
    );
    return SeasonalScreen(initialYear: year, initialSeason: season);
  }

  void _showDetail(BuildContext context, MediaKind mode, Data data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MediaDetailScreen(data: data, kind: mode),
      ),
    );
  }
}

/// Inline failure state for a single rail: the section header stays (so the
/// user knows what's missing) over a compact message + retry button that
/// refetches only this rail.
class _RailError extends ConsumerWidget {
  final String title;
  final ProviderOrFamily provider;

  const _RailError({required this.title, required this.provider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NovaSectionHeader(title: title),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: NovaSize.spaceMd),
          child: Row(
            children: [
              Icon(
                Icons.cloud_off_rounded,
                size: 20,
                color: scheme.onSurfaceVariant,
              ),
              const SizedBox(width: NovaSize.spaceSm),
              Expanded(
                child: Text(
                  "Couldn't load this section.",
                  style: NovaType.body.copyWith(color: scheme.onSurfaceVariant),
                ),
              ),
              TextButton(
                onPressed: () => ref.invalidate(provider),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
        const SizedBox(height: NovaSize.spaceMd),
      ],
    );
  }
}
