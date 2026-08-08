import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _prefsKey = 'prefer_english_titles';

/// The preference persisted by the last [TitleLanguageNotifier.set] (off on
/// first launch). main() reads this before runApp and seeds
/// [preferEnglishTitlesProvider] via an override.
Future<bool> loadPersistedTitlePreference() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool(_prefsKey) ?? false;
}

/// Whether titles render as MAL's English alternative title when one exists
/// (e.g. "Attack on Titan") instead of the default romaji ("Shingeki no
/// Kyojin").
final preferEnglishTitlesProvider =
    NotifierProvider<TitleLanguageNotifier, bool>(TitleLanguageNotifier.new);

class TitleLanguageNotifier extends Notifier<bool> {
  final bool _initial;

  TitleLanguageNotifier([this._initial = false]);

  @override
  bool build() => _initial;

  /// Switches the preference and persists it for the next launch.
  Future<void> set(bool preferEnglish) async {
    state = preferEnglish;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefsKey, preferEnglish);
  }
}
