import 'package:android_app/data/model/data.dart';
import 'package:android_app/providers/title_language_provider.dart';
import 'package:android_app/ui/components/status_badge.dart';
import 'package:android_app/ui/components/trending_icon.dart';
import 'package:android_app/ui/components/nova/nova_card.dart';
import 'package:android_app/ui/components/nova/nova_meta_row.dart';
import 'package:android_app/ui/components/nova/nova_poster_image.dart';
import 'package:android_app/ui/components/nova/nova_rank_chip.dart';
import 'package:android_app/ui/components/nova/nova_score.dart';
import 'package:android_app/utils/constants/color.dart';
import 'package:android_app/utils/constants/size.dart';
import 'package:android_app/utils/constants/typography.dart';
import 'package:android_app/utils/extension_methods/node_extension.dart';
import 'package:android_app/utils/formatters/episode_label.dart';
import 'package:android_app/utils/formatters/media_type_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A large, poster-forward "hero" card for a single spotlight slot (e.g.
/// "Continue watching", "Anime of the season"). Full-bleed art with a
/// left-to-right scrim and all info (rank, score, title, status, metadata)
/// layered on top. Tall by default so a good portion of the portrait poster
/// shows. Not for lists — use [AnimeListRow] there.
class FeaturedTile extends ConsumerWidget {
  final Data data;
  final VoidCallback? onTap;
  final double height;

  const FeaturedTile({
    super.key,
    required this.data,
    this.onTap,
    this.height = 200,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final node = data.node;
    final preferEnglish = ref.watch(preferEnglishTitlesProvider);

    return SizedBox(
      height: height,
      child: NovaCard(
        onTap: onTap,
        child: Stack(
          fit: StackFit.expand,
          children: [
            NovaPosterImage(url: node.posterUrl),
            // Left-to-right scrim keeps the text side legible.
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xE6000000), Colors.transparent],
                ),
              ),
            ),
            // Rank chip + title, top-left. Trend arrow top-right.
            Positioned(
              left: NovaSize.spaceMd,
              top: NovaSize.spaceMd,
              right: NovaSize.spaceMd,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (data.ranking != null) ...[
                          NovaRankChip(rank: data.ranking!.rank),
                          const SizedBox(height: NovaSize.spaceSm),
                        ],
                        Text(
                          node.displayTitle(preferEnglish: preferEnglish),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: NovaType.display.copyWith(
                            color: NovaColors.onScrim,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (data.ranking != null) ...[
                    const SizedBox(width: NovaSize.spaceSm),
                    TrendingIcon(ranking: data.ranking!),
                  ],
                ],
              ),
            ),
            // Metadata bottom-left, full status pill bottom-right.
            Positioned(
              left: NovaSize.spaceMd,
              right: NovaSize.spaceMd,
              bottom: NovaSize.spaceMd,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        NovaScore(score: node.mean, onScrim: true),
                        if (node.mean != null)
                          const SizedBox(width: NovaSize.spaceMd),
                        Flexible(
                          child: NovaMetaRow(
                            items: [
                              mediaTypeLabel(node.mediaType),
                              episodeCountLabel(node.numEpisodes),
                            ],
                            onScrim: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: NovaSize.spaceSm),
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
