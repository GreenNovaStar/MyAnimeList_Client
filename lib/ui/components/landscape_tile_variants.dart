import 'package:android_app/data/model/data.dart';
import 'package:android_app/ui/components/status_badge.dart';
import 'package:android_app/ui/components/nova/nova_card.dart';
import 'package:android_app/ui/components/nova/nova_meta_row.dart';
import 'package:android_app/ui/components/nova/nova_poster_image.dart';
import 'package:android_app/ui/components/nova/nova_rank_chip.dart';
import 'package:android_app/ui/components/nova/nova_score.dart';
import 'package:android_app/utils/constants/size.dart';
import 'package:android_app/utils/constants/typography.dart';
import 'package:android_app/utils/extension_methods/node_extension.dart';
import 'package:android_app/utils/formatters/episode_label.dart';
import 'package:android_app/utils/formatters/media_type_label.dart';
import 'package:flutter/material.dart';

// ---------------------------------------------------------------------------
// PROTOTYPE (kept for comparison): candidate grid card "F" — a fixed-width
// card with the poster on top and a caption below. Compared against the
// poster-overlay square AnimeTile before one is chosen for the grid screen;
// the loser (and this file) then gets deleted.
// ---------------------------------------------------------------------------

/// Candidate grid card: fixed width, poster on top (16:9) + caption below.
class GridCardF extends StatelessWidget {
  final Data data;
  final VoidCallback? onTap;
  const GridCardF({super.key, required this.data, this.onTap});

  @override
  Widget build(BuildContext context) {
    final onSurface = Theme.of(context).colorScheme.onSurface;
    final node = data.node;
    return SizedBox(
      width: 200,
      child: NovaCard(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  NovaPosterImage(url: node.posterUrl),
                  if (data.ranking != null)
                    Positioned(
                      top: NovaSize.spaceSm,
                      left: NovaSize.spaceSm,
                      child: NovaRankChip(rank: data.ranking!.rank),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(NovaSize.spaceMd),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    node.title ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: NovaType.title.copyWith(color: onSurface),
                  ),
                  const SizedBox(height: NovaSize.spaceXs),
                  Row(
                    children: [
                      NovaScore(score: node.mean),
                      const SizedBox(width: NovaSize.spaceSm),
                      Expanded(
                        child: NovaMetaRow(
                          items: [
                            mediaTypeLabel(node.mediaType),
                            episodeCountLabel(node.numEpisodes),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: NovaSize.spaceSm),
                  StatusBadge(listStatus: data.listStatus),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
