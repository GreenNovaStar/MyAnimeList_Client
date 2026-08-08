// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_ranking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnimeRanking _$AnimeRankingFromJson(Map<String, dynamic> json) =>
    _AnimeRanking(
      data: (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      paging: Paging.fromJson(json['paging'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimeRankingToJson(_AnimeRanking instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'paging': instance.paging.toJson(),
    };
