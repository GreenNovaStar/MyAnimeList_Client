import 'package:android_app/data/model/anime_season.dart';

(AnimeSeason season, int year) getNextSeason(AnimeSeason current, int year) {
  final next = current.next;
  final nextYear = current == AnimeSeason.fall ? year + 1 : year;
  return (next, nextYear);
}
