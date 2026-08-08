import 'package:android_app/data/model/anime_season.dart';

enum Month {
  january(1),
  february(2),
  march(3),
  april(4),
  may(5),
  june(6),
  july(7),
  august(8),
  september(9),
  october(10),
  november(11),
  december(12);

  final int number;
  const Month(this.number);

  static Month fromDateTime(DateTime date) => values[date.month - 1];

  AnimeSeason get season {
    switch (this) {
      case january || february || march:
        return AnimeSeason.winter;
      case april || may || june:
        return AnimeSeason.spring;
      case july || august || september:
        return AnimeSeason.summer;
      case october || november || december:
        return AnimeSeason.fall;
    }
  }
}
