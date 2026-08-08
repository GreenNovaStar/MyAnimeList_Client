import 'package:flutter/material.dart';

/// App-wide text-style tokens.
///
/// Styles are intentionally color-less: the same scale is used both over
/// poster art (caller applies [NovaColors.onScrim]) and on themed surfaces
/// (caller applies a [ColorScheme] color). Apply color with `.copyWith(...)`
/// or via the surrounding [DefaultTextStyle]/theme.
class NovaType {
  // --- Overlay / tile scale (matches the pre-token inline styles) ---

  /// Tile title over a scrim. Was: 14 / w600 / height 1.2.
  static const TextStyle title = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );

  /// Pill / chip label. Was: 12 / w600.
  static const TextStyle label = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  /// Small emphatic marker text (e.g. rank chip "#3"). Was: 11 / w700.
  static const TextStyle badge = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w700,
  );

  // --- Larger scale for content screens (detail / profile / search) ---

  /// Screen-level display text (e.g. a detail hero title).
  static const TextStyle display = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 1.15,
  );

  /// Section headline (e.g. "Synopsis", "Related").
  static const TextStyle headline = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  /// Standard body copy (e.g. synopsis).
  static const TextStyle body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );

  /// Secondary / caption text (metadata, timestamps).
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.3,
  );
}
