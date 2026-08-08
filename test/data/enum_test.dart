import 'package:android_app/data/model/anime_season.dart';
import 'package:android_app/data/model/list_status_type.dart';
import 'package:android_app/data/model/month.dart';
import 'package:android_app/data/model/ranking_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Month', () {
    test('fromDateTime maps month number to enum', () {
      expect(Month.fromDateTime(DateTime(2025, 1, 10)), Month.january);
      expect(Month.fromDateTime(DateTime(2025, 6, 10)), Month.june);
      expect(Month.fromDateTime(DateTime(2025, 12, 10)), Month.december);
    });

    test('season groups months into MAL quarters', () {
      expect(Month.january.season, AnimeSeason.winter);
      expect(Month.march.season, AnimeSeason.winter);
      expect(Month.april.season, AnimeSeason.spring);
      expect(Month.june.season, AnimeSeason.spring);
      expect(Month.july.season, AnimeSeason.summer);
      expect(Month.september.season, AnimeSeason.summer);
      expect(Month.october.season, AnimeSeason.fall);
      expect(Month.december.season, AnimeSeason.fall);
    });
  });

  group('AnimeSeason', () {
    test('of resolves from wire value', () {
      expect(AnimeSeason.of('winter'), AnimeSeason.winter);
      expect(AnimeSeason.of('fall'), AnimeSeason.fall);
    });

    test('next cycles through seasons and wraps', () {
      expect(AnimeSeason.winter.next, AnimeSeason.spring);
      expect(AnimeSeason.spring.next, AnimeSeason.summer);
      expect(AnimeSeason.summer.next, AnimeSeason.fall);
      expect(AnimeSeason.fall.next, AnimeSeason.winter);
    });
  });

  group('ranking types', () {
    test('AnimeRankingType.of resolves from wire value', () {
      expect(AnimeRankingType.of('trend'), AnimeRankingType.trend);
      expect(
        AnimeRankingType.of('bypopularity'),
        AnimeRankingType.bypopularity,
      );
    });

    test('MangaRankingType.of resolves from wire value', () {
      expect(MangaRankingType.of('manhwa'), MangaRankingType.manhwa);
    });
  });

  group('list status types', () {
    test('AnimeListStatus.of resolves from wire value', () {
      expect(AnimeListStatus.of('watching'), AnimeListStatus.watching);
      expect(AnimeListStatus.of('plan_to_watch'), AnimeListStatus.planToWatch);
    });

    test('AnimeListStatus carries display labels', () {
      expect(AnimeListStatus.planToWatch.label, 'Plan to Watch');
      expect(AnimeListStatus.onHold.label, 'On Hold');
    });

    test('MangaListStatus.of resolves from wire value', () {
      expect(MangaListStatus.of('reading'), MangaListStatus.reading);
      expect(MangaListStatus.of('plan_to_read'), MangaListStatus.planToRead);
    });

    test('ListSort.of resolves from wire value', () {
      expect(ListSort.of('list_updated_at'), ListSort.listUpdatedAt);
      expect(ListSort.of('anime_title'), ListSort.animeTitle);
    });
  });
}
