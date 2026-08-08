import 'package:android_app/utils/constants/size.dart';
import 'package:flutter/material.dart';

/// A titled section header with an optional trailing action.
///
/// Used above rails, detail sections ("Synopsis", "Related"), and list groups.
/// The title uses the theme's `titleLarge` so it adapts to light/dark; pass a
/// [trailing] widget (e.g. a "See all" TextButton) for a right-aligned action.
class NovaSectionHeader extends StatelessWidget {
  final String title;
  final Widget? trailing;

  const NovaSectionHeader({super.key, required this.title, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: NovaSize.spaceMd,
        vertical: NovaSize.spaceSm,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          ?trailing,
        ],
      ),
    );
  }
}
