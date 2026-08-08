// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Node _$NodeFromJson(Map<String, dynamic> json) => _Node(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  mainPicture: json['main_picture'] == null
      ? null
      : Picture.fromJson(json['main_picture'] as Map<String, dynamic>),
  alternativeTitles: json['alternative_titles'] == null
      ? null
      : AlternativeTitles.fromJson(
          json['alternative_titles'] as Map<String, dynamic>,
        ),
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
  mean: (json['mean'] as num?)?.toDouble(),
  mediaType: json['media_type'] as String?,
  status: json['status'] as String?,
  numEpisodes: (json['num_episodes'] as num?)?.toInt(),
  numChapters: (json['num_chapters'] as num?)?.toInt(),
  numVolumes: (json['num_volumes'] as num?)?.toInt(),
);

Map<String, dynamic> _$NodeToJson(_Node instance) => <String, dynamic>{
  'id': ?instance.id,
  'title': ?instance.title,
  'main_picture': ?instance.mainPicture?.toJson(),
  'alternative_titles': ?instance.alternativeTitles?.toJson(),
  'first_name': ?instance.firstName,
  'last_name': ?instance.lastName,
  'mean': ?instance.mean,
  'media_type': ?instance.mediaType,
  'status': ?instance.status,
  'num_episodes': ?instance.numEpisodes,
  'num_chapters': ?instance.numChapters,
  'num_volumes': ?instance.numVolumes,
};
