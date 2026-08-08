import 'package:android_app/utils/constants/color.dart';
import 'package:android_app/utils/constants/size.dart';
import 'package:android_app/utils/constants/typography.dart';
import 'package:flutter/material.dart';

/// A small colored indicator rendered over poster art.
///
/// Two shapes:
/// - [NovaPill] (default): a rounded pill with an icon and a label.
/// - [NovaPill.marker]: a compact icon-only square marker with a light border,
///   for narrow surfaces where a label wouldn't fit.
///
/// Foreground (icon/label) uses [NovaColors.onScrim]; [color] is the fill.
class NovaPill extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String? label;
  final bool compact;
  final String? semanticsLabel;

  const NovaPill({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
    this.semanticsLabel,
  }) : compact = false;

  /// Compact icon-only marker (used on narrow tiles).
  const NovaPill.marker({
    super.key,
    required this.color,
    required this.icon,
    this.semanticsLabel,
  }) : label = null,
       compact = true;

  @override
  Widget build(BuildContext context) {
    final Widget child = compact ? _marker() : _pill();
    if (semanticsLabel == null) return child;
    return Semantics(label: semanticsLabel, child: child);
  }

  Widget _marker() {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(NovaSize.radiusBadge),
        // Soft shadow (instead of a hard white outline) separates the marker
        // from busy poster art without the "sticker" look.
        boxShadow: const [
          BoxShadow(
            color: Color(0x66000000),
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Icon(icon, color: NovaColors.onScrim, size: 14),
    );
  }

  Widget _pill() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: NovaSize.spaceSm,
        vertical: NovaSize.spaceXs,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(NovaSize.radiusPill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: NovaColors.onScrim, size: 14),
          if (label != null) ...[
            const SizedBox(width: NovaSize.spaceXs),
            Text(
              label!,
              style: NovaType.label.copyWith(color: NovaColors.onScrim),
            ),
          ],
        ],
      ),
    );
  }
}
