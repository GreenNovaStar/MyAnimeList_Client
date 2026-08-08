import 'package:android_app/data/model/ranking.dart';
import 'package:android_app/utils/constants/color.dart';
import 'package:android_app/utils/constants/size.dart';
import 'package:android_app/utils/constants/typography.dart';
import 'package:flutter/material.dart';

/// Rank-movement indicator shown top-right on a poster tile, mirroring the
/// rank chip on the opposite corner: a [NovaColors.scrimChip]-backed rounded
/// pill with a rounded trend arrow and the number of places moved (e.g. ▲2).
///
/// Renders nothing when there's no previous rank to compare against. When the
/// rank is unchanged it shows a muted dash.
class TrendingIcon extends StatelessWidget {
  final Ranking ranking;
  const TrendingIcon({super.key, required this.ranking});

  @override
  Widget build(BuildContext context) {
    final int? previous = ranking.previousRank;
    if (previous == null) return const SizedBox.shrink();

    final int delta = previous - ranking.rank; // positive = moved up
    final IconData icon;
    final Color color;
    if (delta > 0) {
      icon = Icons.trending_up_rounded;
      color = NovaColors.trendUp;
    } else if (delta < 0) {
      icon = Icons.trending_down_rounded;
      color = NovaColors.trendDown;
    } else {
      icon = Icons.trending_flat_rounded;
      color = NovaColors.onScrimMuted;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: NovaSize.spaceSm,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: NovaColors.scrimChip,
        borderRadius: BorderRadius.circular(NovaSize.radiusPill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 14),
          // Show how many places it moved; nothing extra when unchanged.
          if (delta != 0) ...[
            const SizedBox(width: 2),
            Text(
              "${delta.abs()}",
              style: NovaType.badge.copyWith(color: color),
            ),
          ],
        ],
      ),
    );
  }
}
