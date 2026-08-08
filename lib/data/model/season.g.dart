// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Season _$SeasonFromJson(Map<String, dynamic> json) => _Season(
  year: (json['year'] as num).toInt(),
  season: json['season'] as String,
);

Map<String, dynamic> _$SeasonToJson(_Season instance) => <String, dynamic>{
  'year': instance.year,
  'season': instance.season,
};
