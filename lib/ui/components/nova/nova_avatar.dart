import 'package:android_app/utils/constants/typography.dart';
import 'package:flutter/material.dart';

/// A circular avatar backed by a network image, with a graceful fallback.
///
/// When [imageUrl] is null/empty or fails to load, shows the user's initials
/// (derived from [name]) if available, otherwise a person icon. Colors come
/// from the theme so it reads in light and dark. Replaces the hardcoded
/// network avatar on the user screen and is reused by the profile screen.
class NovaAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? name;
  final double radius;

  const NovaAvatar({super.key, this.imageUrl, this.name, this.radius = 20});

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final bool hasImage = imageUrl != null && imageUrl!.isNotEmpty;

    return CircleAvatar(
      radius: radius,
      backgroundColor: scheme.secondaryContainer,
      foregroundImage: hasImage ? NetworkImage(imageUrl!) : null,
      // Shown when there's no image or the image fails to load.
      child: hasImage ? null : _fallback(scheme),
    );
  }

  Widget _fallback(ColorScheme scheme) {
    final String? initials = _initials(name);
    if (initials != null) {
      return Text(
        initials,
        style: NovaType.label.copyWith(color: scheme.onSecondaryContainer),
      );
    }
    return Icon(Icons.person, color: scheme.onSecondaryContainer, size: radius);
  }

  /// Up to two uppercase initials from a display name, or null if unavailable.
  static String? _initials(String? name) {
    if (name == null) return null;
    final parts = name
        .trim()
        .split(RegExp(r'\s+'))
        .where((p) => p.isNotEmpty)
        .toList();
    if (parts.isEmpty) return null;
    final first = parts.first[0];
    final second = parts.length > 1 ? parts.last[0] : '';
    return (first + second).toUpperCase();
  }
}
