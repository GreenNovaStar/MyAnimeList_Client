import 'package:android_app/data/model/data.dart';
import 'package:android_app/providers/title_language_provider.dart';
import 'package:android_app/ui/components/nova/nova_poster_image.dart';
import 'package:android_app/ui/components/nova/nova_rank_chip.dart';
import 'package:android_app/ui/components/nova/nova_score.dart';
import 'package:android_app/ui/components/status_badge.dart';
import 'package:android_app/ui/components/trending_icon.dart';
import 'package:android_app/ui/components/nova/nova_card.dart';
import 'package:android_app/ui/components/nova/nova_scrim.dart';
import 'package:android_app/utils/constants/color.dart';
import 'package:android_app/utils/constants/size.dart';
import 'package:android_app/utils/constants/typography.dart';
import 'package:android_app/utils/extension_methods/node_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Poster-first tile shapes. Both render the same overlay stack (art + scrim +
/// rank/trend + status/title); they differ only in footprint:
/// - [portrait]: tall rail tile (default 150×250).
/// - [square]: 1:1 grid cell.
enum TileShape { portrait, square }

class AnimeTile extends ConsumerWidget {
  final Data animeData;
  final TileShape shape;
  final VoidCallback? onPressed;
  final double width;
  final double height;

  const AnimeTile({
    super.key,
    required this.animeData,
    this.onPressed,
    this.shape = TileShape.portrait,
    this.width = NovaSize.railTileWidth,
    this.height = NovaSize.railTileHeight,
  });

  /// A square (grid) tile of the given [extent] on each side.
  const AnimeTile.square({
    super.key,
    required this.animeData,
    this.onPressed,
    double extent = NovaSize.squareTileExtent,
  }) : shape = TileShape.square,
       width = extent,
       height = extent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preferEnglish = ref.watch(preferEnglishTitlesProvider);
    return Padding(
      padding: const EdgeInsets.all(NovaSize.spaceXs),
      child: SizedBox(
        width: width,
        height: height,
        child: NovaCard(onTap: onPressed, child: _overlayStack(preferEnglish)),
      ),
    );
  }

  /// The shared poster + scrim + overlays, used by every shape.
  Widget _overlayStack(bool preferEnglish) {
    // Narrow tiles show a compact status marker; wider tiles get a labeled pill.
    final bool compact = width < NovaSize.pillWidthThreshold;

    return Stack(
      fit: StackFit.expand,
      children: [
        // Poster art.
        NovaPosterImage(url: animeData.node.posterUrl),

        // Bottom gradient scrim so overlay text stays legible.
        const NovaScrim(),

        // Rank (top-left).
        if (animeData.ranking != null)
          Positioned(
            top: NovaSize.spaceSm,
            left: NovaSize.spaceSm,
            child: NovaRankChip(rank: animeData.ranking!.rank),
          ),

        // Rank trend arrow (top-right).
        if (animeData.ranking != null)
          Positioned(
            top: NovaSize.spaceSm,
            right: NovaSize.spaceSm,
            child: TrendingIcon(ranking: animeData.ranking!),
          ),

        // Status badge + title overlaid on the scrim (bottom).
        Positioned(
          left: NovaSize.spaceSm,
          right: NovaSize.spaceSm,
          bottom: NovaSize.spaceSm,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StatusBadge(listStatus: animeData.listStatus, compact: compact),
              if (animeData.listStatus != null)
                const SizedBox(height: NovaSize.spaceXs),
              NovaScore(score: animeData.node.mean),
              if (animeData.node.mean != null)
                const SizedBox(height: NovaSize.spaceXs),
              Text(
                animeData.node.displayTitle(preferEnglish: preferEnglish),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: NovaType.title.copyWith(color: NovaColors.onScrim),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
