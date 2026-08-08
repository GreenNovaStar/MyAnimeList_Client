import 'package:android_app/utils/constants/color.dart';
import 'package:android_app/utils/constants/size.dart';
import 'package:flutter/material.dart';

/// Builds the app's [ThemeData] from the Nova design tokens.
///
/// Both the light and dark themes derive from [NovaColors.seed]. Interactive
/// shapes (buttons) share the pill radius used by the Nova chip/pill
/// primitives so the UI reads as one system.
class NovaTheme {
  const NovaTheme._();

  static ThemeData light() => _build(Brightness.light);
  static ThemeData dark() => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(NovaSize.radiusPill),
    );
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: NovaColors.seed,
        brightness: brightness,
      ),
      useMaterial3: true,
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(shape: shape),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(shape: shape),
      ),
    );
  }
}
