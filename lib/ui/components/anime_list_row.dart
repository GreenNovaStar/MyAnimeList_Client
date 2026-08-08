import 'package:android_app/data/model/data.dart';
import 'package:android_app/providers/title_language_provider.dart';
import 'package:android_app/ui/components/status_badge.dart';
import 'package:android_app/ui/components/trending_icon.dart';
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
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A full-width list row for an anime or manga: poster art on the left (with
/// rank/trend overlaid) and a themed info panel on the right (title, score,
/// metadata, status). The scannable workhorse for search results and the
/// user's lists — text sits on a themed surface so it stays legible regardless
/// of the poster, and it adapts to light/dark. Contrast with the
/// poster-overlay [AnimeTile].
///
/// Optional list-tracking affordances (all off by default): [onLongPress]
/// (quick-edit sheet), [progressLabel] (e.g. "3/12"), and [onIncrement]
/// (a +1 episode/chapter button).
class AnimeListRow extends ConsumerWidget {
  final Data data;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final VoidCallback? onIncrement;
  final String? progressLabel;
  final double height;

  const AnimeListRow({
    super.key,
    required this.data,
    this.onTap,
    this.onLongPress,
    this.onIncrement,
    this.progressLabel,
    this.height = 130,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;
    final node = data.node;
    final preferEnglish = ref.watch(preferEnglishTitlesProvider);

    return SizedBox(
      height: height,
      child: NovaCard(
        onTap: onTap,
        onLongPress: onLongPress,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Poster art with rank overlay (left).
            Expanded(
              flex: 4,
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
            // Info panel (right).
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(NovaSize.spaceMd),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Title at top
                    Text(
                      node.displayTitle(preferEnglish: preferEnglish),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: NovaType.title.copyWith(color: scheme.onSurface),
                    ),
                    // Meta info at bottom
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: NovaMetaRow(
                                items: [
                                  if (node.mean != null)
                                    NovaScore(score: node.mean),
                                  mediaTypeLabel(node.mediaType),
                                  episodeCountLabel(node.numEpisodes),
                                ],
                              ),
                            ),
                            if (data.ranking != null)
                              TrendingIcon(ranking: data.ranking!),
                          ],
                        ),
                        const SizedBox(height: NovaSize.spaceXs),
                        Row(
                          children: [
                            StatusBadge(listStatus: data.listStatus),
                            const Spacer(),
                            if (progressLabel != null)
                              Text(
                                progressLabel!,
                                style: NovaType.caption.copyWith(
                                  color: scheme.onSurfaceVariant,
                                ),
                              ),
                            if (onIncrement != null)
                              IconButton(
                                onPressed: onIncrement,
                                icon: const Icon(Icons.plus_one, size: 20),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: NovaSize.spaceSm,
                                ),
                                constraints: const BoxConstraints(),
                                visualDensity: VisualDensity.compact,
                                tooltip: 'Log one more',
                                color: scheme.primary,
                              ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
