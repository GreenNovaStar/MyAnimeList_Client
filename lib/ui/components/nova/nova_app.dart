import 'package:android_app/ui/theme/nova_theme.dart';
import 'package:flutter/material.dart';

/// The application root: a [MaterialApp] pre-wired with the Nova light/dark
/// themes and following the system brightness. Screens supply only [home];
/// all theming lives here (and in [NovaTheme]) so every entry point is
/// consistent and `main.dart` stays thin.
class NovaApp extends StatelessWidget {
  final Widget home;
  final String title;
  final bool showDebugBanner;

  const NovaApp({
    super.key,
    required this.home,
    this.title = "MyAnimeList Client V3",
    this.showDebugBanner = false,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: showDebugBanner,
      theme: NovaTheme.light(),
      darkTheme: NovaTheme.dark(),
      themeMode: ThemeMode.system,
      home: home,
    );
  }
}
