// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'related_anime.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RelatedAnime _$RelatedAnimeFromJson(Map<String, dynamic> json) =>
    _RelatedAnime(
      node: json['node'] == null
          ? null
          : Node.fromJson(json['node'] as Map<String, dynamic>),
      relationType: json['relation_type'] as String?,
      relationTypeFormatted: json['relation_type_formatted'] as String?,
    );

Map<String, dynamic> _$RelatedAnimeToJson(_RelatedAnime instance) =>
    <String, dynamic>{
      'node': ?instance.node?.toJson(),
      'relation_type': ?instance.relationType,
      'relation_type_formatted': ?instance.relationTypeFormatted,
    };

_RelatedManga _$RelatedMangaFromJson(Map<String, dynamic> json) =>
    _RelatedManga(
      node: json['node'] == null
          ? null
          : Node.fromJson(json['node'] as Map<String, dynamic>),
      relationType: json['relation_type'] as String?,
      relationTypeFormatted: json['relation_type_formatted'] as String?,
    );

Map<String, dynamic> _$RelatedMangaToJson(_RelatedManga instance) =>
    <String, dynamic>{
      'node': ?instance.node?.toJson(),
      'relation_type': ?instance.relationType,
      'relation_type_formatted': ?instance.relationTypeFormatted,
    };
