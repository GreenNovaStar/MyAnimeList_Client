import 'package:android_app/utils/constants/size.dart';
import 'package:flutter/material.dart';

/// An elevated, rounded, clipped surface with an optional tap ripple.
///
/// The reusable container behind poster tiles and content cards. Defaults
/// match the original inline tile surface (elevation 3, [NovaSize.radiusTile]).
class NovaCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final double radius;
  final double elevation;

  /// Surface fill. Defaults to [ColorScheme.surfaceContainerHigh] — a tonal
  /// step above the background that separates the card in both light and dark
  /// (relying on shadow alone is nearly invisible on a dark surface). Content
  /// that fills the card edge-to-edge (e.g. a poster image) hides this anyway.
  final Color? color;

  const NovaCard({
    super.key,
    required this.child,
    this.onTap,
    this.onLongPress,
    this.radius = NovaSize.radiusTile,
    this.elevation = 3,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? Theme.of(context).colorScheme.surfaceContainerHigh,
      elevation: elevation,
      borderRadius: BorderRadius.circular(radius),
      clipBehavior: Clip.antiAlias,
      child: InkWell(onTap: onTap, onLongPress: onLongPress, child: child),
    );
  }
}
