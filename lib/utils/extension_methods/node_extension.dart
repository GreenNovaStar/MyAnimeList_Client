import 'package:android_app/data/model/node.dart';

extension NodeImage on Node {
  /// Poster art URL with the app-wide fallback policy: prefer the large
  /// rendition, fall back to medium, else empty (NovaPosterImage renders a
  /// placeholder for '').
  String get posterUrl => mainPicture?.large ?? mainPicture?.medium ?? '';

  /// Display title honoring the prefer-English setting: the English
  /// alternative title when preferred and present, else MAL's default
  /// (romaji) title.
  String displayTitle({required bool preferEnglish}) {
    if (preferEnglish) {
      final en = alternativeTitles?.en;
      if (en != null && en.isNotEmpty) return en;
    }
    return title ?? '';
  }
}
