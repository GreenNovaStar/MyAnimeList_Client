// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_list_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MyListStatus _$MyListStatusFromJson(Map<String, dynamic> json) =>
    _MyListStatus(
      status: json['status'] as String?,
      score: (json['score'] as num?)?.toInt(),
      priority: (json['priority'] as num?)?.toInt(),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      comments: json['comments'] as String?,
      updatedAt: json['updated_at'] as String?,
      startDate: json['start_date'] as String?,
      finishDate: json['finish_date'] as String?,
      numEpisodesWatched: (json['num_episodes_watched'] as num?)?.toInt(),
      isRewatching: json['is_rewatching'] as bool?,
      numTimesRewatched: (json['num_times_rewatched'] as num?)?.toInt(),
      rewatchValue: (json['rewatch_value'] as num?)?.toInt(),
      numChaptersRead: (json['num_chapters_read'] as num?)?.toInt(),
      numVolumesRead: (json['num_volumes_read'] as num?)?.toInt(),
      isRereading: json['is_rereading'] as bool?,
      numTimesReread: (json['num_times_reread'] as num?)?.toInt(),
      rereadValue: (json['reread_value'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MyListStatusToJson(_MyListStatus instance) =>
    <String, dynamic>{
      'status': ?instance.status,
      'score': ?instance.score,
      'priority': ?instance.priority,
      'tags': ?instance.tags,
      'comments': ?instance.comments,
      'updated_at': ?instance.updatedAt,
      'start_date': ?instance.startDate,
      'finish_date': ?instance.finishDate,
      'num_episodes_watched': ?instance.numEpisodesWatched,
      'is_rewatching': ?instance.isRewatching,
      'num_times_rewatched': ?instance.numTimesRewatched,
      'rewatch_value': ?instance.rewatchValue,
      'num_chapters_read': ?instance.numChaptersRead,
      'num_volumes_read': ?instance.numVolumesRead,
      'is_rereading': ?instance.isRereading,
      'num_times_reread': ?instance.numTimesReread,
      'reread_value': ?instance.rereadValue,
    };
