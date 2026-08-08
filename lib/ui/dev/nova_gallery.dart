import 'package:android_app/data/model/data.dart';
import 'package:android_app/data/model/main_picture.dart';
import 'package:android_app/data/model/my_list_status.dart';
import 'package:android_app/data/model/node.dart';
import 'package:android_app/data/model/ranking.dart';
import 'package:android_app/ui/components/anime_list_row.dart';
import 'package:android_app/ui/components/anime_rail.dart';
import 'package:android_app/ui/components/anime_tile.dart';
import 'package:android_app/ui/components/featured_tile.dart';
import 'package:android_app/ui/components/landscape_tile_variants.dart';
import 'package:android_app/ui/components/nova/nova_avatar.dart';
import 'package:android_app/ui/components/nova/nova_card.dart';
import 'package:android_app/ui/components/nova/nova_chip.dart';
import 'package:android_app/ui/components/nova/nova_empty_state.dart';
import 'package:android_app/ui/components/nova/nova_meta_row.dart';
import 'package:android_app/ui/components/nova/nova_pill.dart';
import 'package:android_app/ui/components/nova/nova_scaffold.dart';
import 'package:android_app/ui/components/nova/nova_score.dart';
import 'package:android_app/ui/components/nova/nova_section_header.dart';
import 'package:android_app/ui/components/nova/nova_skeleton.dart';
import 'package:android_app/ui/screens/landing_page.dart';
import 'package:android_app/ui/theme/nova_theme.dart';
import 'package:android_app/utils/constants/color.dart';
import 'package:android_app/utils/constants/size.dart';
import 'package:android_app/utils/constants/typography.dart';
import 'package:flutter/material.dart';

/// A dev-only gallery that renders every Nova token and component in one place,
/// with a light/dark toggle. Used to eyeball the design system while building
/// it (hot reload is unreliable over the WSL adb bridge, so a persistent
/// screen is more practical than restart-per-tweak).
///
/// Not part of the product flow — reachable only when wired as a temporary
/// home in main.dart. Remove/gate before release.
class NovaGallery extends StatefulWidget {
  const NovaGallery({super.key});

  @override
  State<NovaGallery> createState() => _NovaGalleryState();
}

class _NovaGalleryState extends State<NovaGallery> {
  Brightness _brightness = Brightness.light;

  void _toggle() {
    setState(() {
      _brightness = _brightness == Brightness.light
          ? Brightness.dark
          : Brightness.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Override the ambient theme so the toggle works regardless of system mode.
    final ThemeData theme = _brightness == Brightness.light
        ? NovaTheme.light()
        : NovaTheme.dark();

    return Theme(
      data: theme,
      child: Builder(
        builder: (context) => NovaScaffold(
          title: 'Nova Gallery',
          actions: [
            IconButton(
              tooltip: 'Toggle light/dark',
              icon: Icon(
                _brightness == Brightness.light
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined,
              ),
              onPressed: _toggle,
            ),
          ],
          body: ColoredBox(
            color: theme.colorScheme.surface,
            child: ListView(
              padding: const EdgeInsets.only(bottom: NovaSize.spaceLg),
              children: [
                const _LandingPageDemo(),
                const _ColorTokens(),
                const _TypeTokens(),
                const _Pills(),
                const _Chips(),
                const _ScoreAndMeta(),
                const _Avatars(),
                const _Cards(),
                const _Skeletons(),
                const _EmptyStates(),
                const _Tiles(),
                const _Rail(),
                const _LandscapeVariants(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// --- Sample data -----------------------------------------------------------

const String _samplePoster =
    'https://cdn.myanimelist.net/images/anime/1015/138006l.jpg';

Data _sampleData({String? status, int? rank, int? prevRank}) {
  return Data(
    node: Node(
      id: 1,
      title: 'Attack on Titan',
      mainPicture: const Picture(large: _samplePoster, medium: _samplePoster),
      mean: 8.72,
      mediaType: 'tv',
      numEpisodes: 25,
    ),
    ranking: rank != null ? Ranking(rank: rank, previousRank: prevRank) : null,
    listStatus: status != null ? MyListStatus(status: status) : null,
  );
}

// --- Section scaffold ------------------------------------------------------

class _Section extends StatelessWidget {
  final String title;
  final Widget child;
  const _Section({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NovaSectionHeader(title: title),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            NovaSize.spaceMd,
            0,
            NovaSize.spaceMd,
            NovaSize.spaceMd,
          ),
          child: child,
        ),
      ],
    );
  }
}

// --- Token sections --------------------------------------------------------

class _ColorTokens extends StatelessWidget {
  const _ColorTokens();

  @override
  Widget build(BuildContext context) {
    final swatches = <(String, Color)>[
      ('watching', NovaColors.watching),
      ('completed', NovaColors.completed),
      ('onHold', NovaColors.onHold),
      ('dropped', NovaColors.dropped),
      ('planToWatch', NovaColors.planToWatch),
      ('seed', NovaColors.seed),
      ('scrimChip', NovaColors.scrimChip),
    ];
    return _Section(
      title: 'Colors',
      child: Wrap(
        spacing: NovaSize.spaceSm,
        runSpacing: NovaSize.spaceSm,
        children: [
          for (final (name, color) in swatches)
            Column(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(NovaSize.radiusBadge),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outlineVariant,
                    ),
                  ),
                ),
                const SizedBox(height: NovaSize.spaceXs),
                Text(name, style: NovaType.caption),
              ],
            ),
        ],
      ),
    );
  }
}

class _TypeTokens extends StatelessWidget {
  const _TypeTokens();

  @override
  Widget build(BuildContext context) {
    final onSurface = Theme.of(context).colorScheme.onSurface;
    final styles = <(String, TextStyle)>[
      ('display', NovaType.display),
      ('headline', NovaType.headline),
      ('title', NovaType.title),
      ('body', NovaType.body),
      ('label', NovaType.label),
      ('caption', NovaType.caption),
      ('badge', NovaType.badge),
    ];
    return _Section(
      title: 'Typography',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final (name, style) in styles)
            Padding(
              padding: const EdgeInsets.only(bottom: NovaSize.spaceSm),
              child: Text(
                '$name — The quick brown fox',
                style: style.copyWith(color: onSurface),
              ),
            ),
        ],
      ),
    );
  }
}

// --- Primitive sections ----------------------------------------------------

class _Pills extends StatelessWidget {
  const _Pills();

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'NovaPill',
      child: Wrap(
        spacing: NovaSize.spaceSm,
        runSpacing: NovaSize.spaceSm,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: const [
          NovaPill(
            color: NovaColors.watching,
            icon: Icons.play_circle_rounded,
            label: 'Watching',
          ),
          NovaPill(
            color: NovaColors.completed,
            icon: Icons.check_circle_rounded,
            label: 'Completed',
          ),
          NovaPill.marker(
            color: NovaColors.dropped,
            icon: Icons.cancel_rounded,
          ),
          NovaPill.marker(
            color: NovaColors.planToWatch,
            icon: Icons.bookmark_add_rounded,
          ),
        ],
      ),
    );
  }
}

class _Chips extends StatelessWidget {
  const _Chips();

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'NovaChip',
      child: Wrap(
        spacing: NovaSize.spaceSm,
        runSpacing: NovaSize.spaceSm,
        children: const [
          NovaChip(label: 'Action'),
          NovaChip(label: 'Fantasy', icon: Icons.auto_awesome),
          NovaChip.outlined(label: 'Drama'),
          NovaChip.outlined(label: 'Shounen', icon: Icons.bolt),
        ],
      ),
    );
  }
}

class _ScoreAndMeta extends StatelessWidget {
  const _ScoreAndMeta();

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'NovaScore + NovaMetaRow',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          NovaScore(score: 8.72),
          SizedBox(height: NovaSize.spaceSm),
          NovaMetaRow(items: ['TV', '25 ep', '2013', 'Finished']),
          SizedBox(height: NovaSize.spaceXs),
          // Nulls/empties dropped automatically:
          NovaMetaRow(items: ['Movie', null, '', '2020']),
        ],
      ),
    );
  }
}

class _Avatars extends StatelessWidget {
  const _Avatars();

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'NovaAvatar',
      child: Row(
        children: const [
          NovaAvatar(name: 'Brian Yip', radius: 28),
          SizedBox(width: NovaSize.spaceMd),
          NovaAvatar(name: 'Levi', radius: 28),
          SizedBox(width: NovaSize.spaceMd),
          NovaAvatar(radius: 28), // icon fallback
        ],
      ),
    );
  }
}

class _Cards extends StatelessWidget {
  const _Cards();

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'NovaCard',
      child: NovaCard(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(NovaSize.spaceMd),
          child: Text(
            'Tappable elevated card (ripple on tap)',
            style: NovaType.body.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}

class _Skeletons extends StatelessWidget {
  const _Skeletons();

  @override
  Widget build(BuildContext context) {
    return const _Section(
      title: 'NovaSkeleton / NovaRailSkeleton',
      child: SizedBox(
        height: NovaSize.railHeight + 40,
        child: NovaRailSkeleton(),
      ),
    );
  }
}

class _EmptyStates extends StatelessWidget {
  const _EmptyStates();

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'NovaEmptyState',
      child: SizedBox(
        height: 220,
        child: NovaEmptyState(
          icon: Icons.cloud_off_rounded,
          message: "Couldn't load anime.\nCheck your connection and try again.",
          actionLabel: 'Retry',
          onAction: () {},
        ),
      ),
    );
  }
}

class _Tiles extends StatelessWidget {
  const _Tiles();

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'AnimeTile (portrait) — status shown via embedded StatusBadge',
      child: SizedBox(
        height: NovaSize.railTileHeight + NovaSize.spaceSm,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            AnimeTile(
              animeData: _sampleData(rank: 1, prevRank: 3),
              onPressed: () {},
            ),
            AnimeTile(
              animeData: _sampleData(status: 'watching', rank: 2, prevRank: 2),
              onPressed: () {},
            ),
            AnimeTile(
              animeData: _sampleData(status: 'completed', rank: 5, prevRank: 1),
              onPressed: () {},
            ),
            AnimeTile(
              animeData: _sampleData(status: 'dropped'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

/// The chosen tile directions, promoted to real widgets:
/// AnimeListRow (landscape workhorse) + FeaturedTile (hero), plus the two grid
/// candidates still being compared — square AnimeTile vs GridCardF.
class _LandscapeVariants extends StatelessWidget {
  const _LandscapeVariants();

  @override
  Widget build(BuildContext context) {
    final sample = _sampleData(status: 'watching', rank: 3, prevRank: 5);

    Widget labelled(String label, Widget child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: NovaSize.spaceXs),
            child: Text(label, style: NovaType.label),
          ),
          child,
          const SizedBox(height: NovaSize.spaceLg),
        ],
      );
    }

    return _Section(
      title: 'Chosen tiles + grid comparison',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          labelled(
            'Landscape · AnimeListRow (search / my-list)',
            AnimeListRow(data: sample, onTap: () {}),
          ),
          labelled(
            'Featured · FeaturedTile (hero slot)',
            FeaturedTile(data: sample, onTap: () {}),
          ),
          labelled(
            'Grid candidate 1 · square AnimeTile',
            Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                children: [
                  AnimeTile.square(animeData: sample, onPressed: () {}),
                  AnimeTile.square(
                    animeData: _sampleData(
                      status: 'completed',
                      rank: 1,
                      prevRank: 1,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          labelled(
            'Grid candidate 2 · GridCardF (caption below)',
            Align(
              alignment: Alignment.centerLeft,
              child: GridCardF(data: sample, onTap: () {}),
            ),
          ),
        ],
      ),
    );
  }
}

class _Rail extends StatelessWidget {
  const _Rail();

  @override
  Widget build(BuildContext context) {
    return AnimeRail(
      title: 'AnimeRail',
      items: [
        _sampleData(rank: 1, prevRank: 4),
        _sampleData(status: 'watching', rank: 2, prevRank: 2),
        _sampleData(status: 'plan_to_watch', rank: 3, prevRank: 1),
        _sampleData(rank: 4, prevRank: 6),
      ],
      onTap: (_) {},
    );
  }
}

class _LandingPageDemo extends StatelessWidget {
  const _LandingPageDemo();

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'Landing Page',
      child: FilledButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const LandingPage()),
          );
        },
        icon: const Icon(Icons.open_in_new),
        label: const Text("View landing page"),
      ),
    );
  }
}
