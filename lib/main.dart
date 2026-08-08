import 'dart:async';
import 'dart:developer';

import 'package:android_app/data/auth/authentication.dart';
import 'package:android_app/data/model/token.dart';
import 'package:android_app/data/model/user_type.dart';
import 'package:android_app/providers/auth_provider.dart';
import 'package:android_app/providers/media_mode_provider.dart';
import 'package:android_app/providers/title_language_provider.dart';
import 'package:android_app/ui/components/nova/nova_app.dart';
import 'package:android_app/ui/components/nova/nova_error_boundary.dart';
import 'package:android_app/ui/screens/home/home_guest.dart';
import 'package:android_app/ui/screens/home/home_user.dart';
import 'package:android_app/ui/dev/nova_gallery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:android_app/ui/screens/landing_page.dart';

/// TEMP: launch straight into the component gallery while building the design
/// system. Set back to false to restore normal auth-based routing.
const bool showGallery = false;

Future main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      setupErrorHandling();
      await dotenv.load(fileName: "config.env");

      if (showGallery) {
        runApp(const ProviderScope(child: NovaApp(home: NovaGallery())));
        return;
      }

      final (widget, token) = await _resolveStartScreen();
      final mediaMode = await loadPersistedMediaMode();
      final preferEnglish = await loadPersistedTitlePreference();
      runApp(
        ProviderScope(
          overrides: [
            if (token != null) tokenProvider.overrideWith((_) => token),
            mediaModeProvider.overrideWith(() => MediaModeNotifier(mediaMode)),
            preferEnglishTitlesProvider.overrideWith(
              () => TitleLanguageNotifier(preferEnglish),
            ),
          ],
          child: NovaApp(home: widget),
        ),
      );
    },
    (error, stack) {
      log('Uncaught error: $error', error: error, stackTrace: stack);
    },
  );
}

Future<(Widget, OAuthToken?)> _resolveStartScreen() async {
  UserType user = await retrieveUserType();
  switch (user.userType) {
    case UserType.GUEST:
      log("I am a guest");
      return (const HomePageGuest(), null);
    case UserType.USER:
      log("I am a user");
      final token = await bootUpFetchTokens();
      return (const HomePageUser(), token);
    default:
      log("I am a first time guest");
      return (LandingPage(), null);
  }
}
