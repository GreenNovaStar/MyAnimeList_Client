// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MediaList _$MediaListFromJson(Map<String, dynamic> json) => _MediaList(
  data: (json['data'] as List<dynamic>)
      .map((e) => Data.fromJson(e as Map<String, dynamic>))
      .toList(),
  paging: Paging.fromJson(json['paging'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MediaListToJson(_MediaList instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'paging': instance.paging.toJson(),
    };
