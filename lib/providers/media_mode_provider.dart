import 'package:android_app/data/model/media_kind.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _prefsKey = 'media_mode';

/// The mode persisted by the last [MediaModeNotifier.set] (anime on first
/// launch or for unrecognized stored values). main() reads this before runApp
/// and seeds [mediaModeProvider] via an override, so the first frame already
/// shows the previous session's mode.
Future<MediaKind> loadPersistedMediaMode() async {
  final prefs = await SharedPreferences.getInstance();
  return MediaKind.values.asNameMap()[prefs.getString(_prefsKey)] ??
      MediaKind.anime;
}

/// App-wide anime/manga mode: drives the home rails, search, and My List
/// navigation.
final mediaModeProvider = NotifierProvider<MediaModeNotifier, MediaKind>(
  MediaModeNotifier.new,
);

class MediaModeNotifier extends Notifier<MediaKind> {
  final MediaKind _initial;

  MediaModeNotifier([this._initial = MediaKind.anime]);

  @override
  MediaKind build() => _initial;

  /// Switches mode and persists the choice for the next launch.
  Future<void> set(MediaKind kind) async {
    state = kind;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKey, kind.name);
  }
}
