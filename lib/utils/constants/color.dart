import 'package:flutter/material.dart';

/// App-wide color tokens.
class NovaColors {
  // Status colors — one per MAL list state. Chosen to stay legible against
  // both bright poster art and dark scrims.
  static const Color watching = Color(0xFF2E7D32); // green 800
  static const Color reading = watching;
  static const Color completed = Color(0xFF1565C0); // blue 800
  static const Color onHold = Color(0xFFF9A825); // amber 800
  static const Color dropped = Color(0xFFC62828); // red 800
  static const Color planToWatch = Color(0xFF616161); // grey 700
  static const Color planToRead = planToWatch;

  /// Seed used to derive the light/dark [ColorScheme].
  static const Color seed = Color(0xFF6A1B9A);

  /// Semi-transparent backing used behind overlay chips on poster art.
  static const Color scrimChip = Color(0xB3000000); // black @ 70%

  // Rank-movement (trend) accents — legible over the dark scrim chip and
  // tuned to sit with the status palette rather than clash as neon.
  static const Color trendUp = Color(0xFF66BB6A); // green 400
  static const Color trendDown = Color(0xFFEF5350); // red 400

  // "Over-art" palette — content layered on top of poster imagery reads on a
  // dark scrim, so these are fixed (theme-independent) for legibility rather
  // than pulled from the ColorScheme.
  /// Primary text/icon color over a scrim.
  static const Color onScrim = Colors.white;

  /// Muted text/icon color over a scrim (e.g. placeholder glyphs).
  static const Color onScrimMuted = Colors.white70;

  /// End color of the bottom-up scrim gradient on poster art.
  static const Color scrimGradientEnd = Colors.black87;

  /// Neutral fill shown when a poster image fails to load.
  static final Color placeholderBg = Colors.blueGrey.shade200;
}

/// Presentation tokens for a single MAL list status: its color, icon, and
/// human-facing label. Keyed by the raw MAL status strings so no enum
/// translation is needed (matches the vocabulary used elsewhere in the app).
class StatusStyle {
  final Color color;
  final IconData icon;
  final String label;
  const StatusStyle(this.color, this.icon, this.label);

  /// Returns the style for a MAL status string, or null when the status is
  /// absent/unknown so callers can render nothing.
  static StatusStyle? of(String? status) => _styles[status];

  static const Map<String, StatusStyle> _styles = {
    'watching': StatusStyle(
      NovaColors.watching,
      Icons.play_circle_rounded,
      'Watching',
    ),
    'reading': StatusStyle(
      NovaColors.reading,
      Icons.auto_stories_rounded,
      'Reading',
    ),
    'completed': StatusStyle(
      NovaColors.completed,
      Icons.check_circle_rounded,
      'Completed',
    ),
    'on_hold': StatusStyle(
      NovaColors.onHold,
      Icons.pause_circle_rounded,
      'On Hold',
    ),
    'dropped': StatusStyle(NovaColors.dropped, Icons.cancel_rounded, 'Dropped'),
    'plan_to_watch': StatusStyle(
      NovaColors.planToWatch,
      Icons.bookmark_add_rounded,
      'Plan to Watch',
    ),
    'plan_to_read': StatusStyle(
      NovaColors.planToRead,
      Icons.bookmark_add_rounded,
      'Plan to Read',
    ),
  };
}
