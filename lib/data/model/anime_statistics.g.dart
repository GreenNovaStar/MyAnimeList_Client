// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnimeStatistics _$AnimeStatisticsFromJson(Map<String, dynamic> json) =>
    _AnimeStatistics(
      numItemsWatching: (json['num_items_watching'] as num?)?.toInt(),
      numItemsCompleted: (json['num_items_completed'] as num?)?.toInt(),
      numItemsOnHold: (json['num_items_on_hold'] as num?)?.toInt(),
      numItemsDropped: (json['num_items_dropped'] as num?)?.toInt(),
      numItemsPlanToWatch: (json['num_items_plan_to_watch'] as num?)?.toInt(),
      numItems: (json['num_items'] as num?)?.toInt(),
      numDaysWatched: (json['num_days_watched'] as num?)?.toDouble(),
      numDaysWatching: (json['num_days_watching'] as num?)?.toDouble(),
      numDaysCompleted: (json['num_days_completed'] as num?)?.toDouble(),
      numDaysOnHold: (json['num_days_on_hold'] as num?)?.toDouble(),
      numDaysDropped: (json['num_days_dropped'] as num?)?.toDouble(),
      numDays: (json['num_days'] as num?)?.toDouble(),
      numEpisodes: (json['num_episodes'] as num?)?.toInt(),
      numTimesRewatched: (json['num_times_rewatched'] as num?)?.toInt(),
      meanScore: (json['mean_score'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AnimeStatisticsToJson(_AnimeStatistics instance) =>
    <String, dynamic>{
      'num_items_watching': ?instance.numItemsWatching,
      'num_items_completed': ?instance.numItemsCompleted,
      'num_items_on_hold': ?instance.numItemsOnHold,
      'num_items_dropped': ?instance.numItemsDropped,
      'num_items_plan_to_watch': ?instance.numItemsPlanToWatch,
      'num_items': ?instance.numItems,
      'num_days_watched': ?instance.numDaysWatched,
      'num_days_watching': ?instance.numDaysWatching,
      'num_days_completed': ?instance.numDaysCompleted,
      'num_days_on_hold': ?instance.numDaysOnHold,
      'num_days_dropped': ?instance.numDaysDropped,
      'num_days': ?instance.numDays,
      'num_episodes': ?instance.numEpisodes,
      'num_times_rewatched': ?instance.numTimesRewatched,
      'mean_score': ?instance.meanScore,
    };
