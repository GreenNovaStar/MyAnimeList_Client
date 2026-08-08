import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_statistics.freezed.dart';
part 'anime_statistics.g.dart';

/// The current user's aggregate anime statistics, returned by
/// `GET /users/@me?fields=anime_statistics`.
@freezed
abstract class AnimeStatistics with _$AnimeStatistics {
  const factory AnimeStatistics({
    int? numItemsWatching,
    int? numItemsCompleted,
    int? numItemsOnHold,
    int? numItemsDropped,
    int? numItemsPlanToWatch,
    int? numItems,
    double? numDaysWatched,
    double? numDaysWatching,
    double? numDaysCompleted,
    double? numDaysOnHold,
    double? numDaysDropped,
    double? numDays,
    int? numEpisodes,
    int? numTimesRewatched,
    double? meanScore,
  }) = _AnimeStatistics;

  factory AnimeStatistics.fromJson(Map<String, dynamic> json) =>
      _$AnimeStatisticsFromJson(json);
}
