// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alternative_titles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AlternativeTitles _$AlternativeTitlesFromJson(Map<String, dynamic> json) =>
    _AlternativeTitles(
      synonyms:
          (json['synonyms'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      en: json['en'] as String?,
      ja: json['ja'] as String?,
    );

Map<String, dynamic> _$AlternativeTitlesToJson(_AlternativeTitles instance) =>
    <String, dynamic>{
      'synonyms': instance.synonyms,
      'en': ?instance.en,
      'ja': ?instance.ja,
    };
