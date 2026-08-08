import 'package:android_app/data/model/anime_season.dart';
import 'package:android_app/utils/helpers/seasonal_helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('getNextSeason', () {
    test('winter -> spring (same year)', () {
      final (season, year) = getNextSeason(AnimeSeason.winter, 2025);
      expect(season, AnimeSeason.spring);
      expect(year, 2025);
    });

    test('spring -> summer (same year)', () {
      final (season, year) = getNextSeason(AnimeSeason.spring, 2025);
      expect(season, AnimeSeason.summer);
      expect(year, 2025);
    });

    test('summer -> fall (same year)', () {
      final (season, year) = getNextSeason(AnimeSeason.summer, 2025);
      expect(season, AnimeSeason.fall);
      expect(year, 2025);
    });

    test('fall -> winter (next year)', () {
      final (season, year) = getNextSeason(AnimeSeason.fall, 2025);
      expect(season, AnimeSeason.winter);
      expect(year, 2026);
    });
  });
}
