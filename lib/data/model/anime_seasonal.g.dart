// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_seasonal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnimeSeasonal _$AnimeSeasonalFromJson(Map<String, dynamic> json) =>
    _AnimeSeasonal(
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Data>[],
      paging: Paging.fromJson(json['paging'] as Map<String, dynamic>),
      season: Season.fromJson(json['season'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimeSeasonalToJson(_AnimeSeasonal instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'paging': instance.paging.toJson(),
      'season': instance.season.toJson(),
    };
