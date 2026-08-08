// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'themes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Themes _$ThemesFromJson(Map<String, dynamic> json) => _Themes(
  id: (json['id'] as num?)?.toInt(),
  animeId: (json['anime_id'] as num?)?.toInt(),
  text: json['text'] as String?,
);

Map<String, dynamic> _$ThemesToJson(_Themes instance) => <String, dynamic>{
  'id': ?instance.id,
  'anime_id': ?instance.animeId,
  'text': ?instance.text,
};
