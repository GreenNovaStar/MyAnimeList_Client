import 'package:android_app/utils/constants/color.dart';
import 'package:android_app/utils/constants/size.dart';
import 'package:android_app/utils/constants/typography.dart';
import 'package:flutter/material.dart';

/// A small "#N" rank pill rendered over poster art on a dark scrim background.
class NovaRankChip extends StatelessWidget {
  final int rank;

  const NovaRankChip({super.key, required this.rank});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: NovaSize.spaceSm,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: NovaColors.scrimChip,
        borderRadius: BorderRadius.circular(NovaSize.radiusPill),
      ),
      child: Text(
        '#$rank',
        style: NovaType.badge.copyWith(color: NovaColors.onScrim),
      ),
    );
  }
}
