import 'package:android_app/utils/constants/size.dart';
import 'package:android_app/utils/constants/typography.dart';
import 'package:flutter/material.dart';

/// A compact rounded label for genres, tags, and metadata on themed surfaces
/// (detail / profile / search screens).
///
/// Unlike [NovaPill] (which is designed to sit over poster art with fixed
/// colors), NovaChip derives its colors from the current [ColorScheme], so it
/// adapts to light and dark themes. Two variants:
/// - [NovaChip] (default): filled with the secondary container color.
/// - [NovaChip.outlined]: transparent with an outline border.
class NovaChip extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool outlined;

  const NovaChip({super.key, required this.label, this.icon})
    : outlined = false;

  const NovaChip.outlined({super.key, required this.label, this.icon})
    : outlined = true;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final Color fg = outlined
        ? scheme.onSurfaceVariant
        : scheme.onSecondaryContainer;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: NovaSize.spaceMd,
        vertical: NovaSize.spaceXs,
      ),
      decoration: BoxDecoration(
        color: outlined ? Colors.transparent : scheme.secondaryContainer,
        borderRadius: BorderRadius.circular(NovaSize.radiusPill),
        border: outlined ? Border.all(color: scheme.outline) : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: fg),
            const SizedBox(width: NovaSize.spaceXs),
          ],
          Text(label, style: NovaType.label.copyWith(color: fg)),
        ],
      ),
    );
  }
}
