import 'package:android_app/utils/constants/color.dart';
import 'package:android_app/utils/constants/size.dart';
import 'package:android_app/utils/constants/typography.dart';
import 'package:flutter/material.dart';

/// A star icon followed by a numeric score (e.g. ★ 8.72).
///
/// Renders nothing when [score] is null (MAL omits `mean` for unrated titles),
/// so callers don't need to null-check. Set [onScrim] when placing it over
/// poster art (fixed white); otherwise it uses the theme's onSurface color.
class NovaScore extends StatelessWidget {
  final double? score;
  final bool onScrim;
  final double iconSize;

  const NovaScore({
    super.key,
    required this.score,
    this.onScrim = false,
    this.iconSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    if (score == null) return const SizedBox.shrink();

    final Color fg = onScrim
        ? NovaColors.onScrim
        : Theme.of(context).colorScheme.onSurface;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star_rounded, size: iconSize, color: NovaColors.onHold),
        const SizedBox(width: NovaSize.spaceXs),
        Text(
          score!.toStringAsFixed(2),
          style: NovaType.label.copyWith(color: fg),
        ),
      ],
    );
  }
}
