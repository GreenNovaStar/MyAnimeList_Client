// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MangaDetails _$MangaDetailsFromJson(Map<String, dynamic> json) =>
    _MangaDetails(
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
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      synopsis: json['synopsis'] as String?,
      mean: (json['mean'] as num?)?.toDouble(),
      rank: (json['rank'] as num?)?.toInt(),
      popularity: (json['popularity'] as num?)?.toInt(),
      numListUsers: (json['num_list_users'] as num?)?.toInt(),
      numScoringUsers: (json['num_scoring_users'] as num?)?.toInt(),
      nsfw: json['nsfw'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      mediaType: json['media_type'] as String?,
      status: json['status'] as String?,
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Genres.fromJson(e as Map<String, dynamic>))
          .toList(),
      myListStatus: json['my_list_status'] == null
          ? null
          : MyListStatus.fromJson(
              json['my_list_status'] as Map<String, dynamic>,
            ),
      numVolumes: (json['num_volumes'] as num?)?.toInt(),
      numChapters: (json['num_chapters'] as num?)?.toInt(),
      authors: (json['authors'] as List<dynamic>?)
          ?.map((e) => Author.fromJson(e as Map<String, dynamic>))
          .toList(),
      pictures: (json['pictures'] as List<dynamic>?)
          ?.map((e) => Picture.fromJson(e as Map<String, dynamic>))
          .toList(),
      background: json['background'] as String?,
      relatedAnime: (json['related_anime'] as List<dynamic>?)
          ?.map((e) => RelatedAnime.fromJson(e as Map<String, dynamic>))
          .toList(),
      relatedManga: (json['related_manga'] as List<dynamic>?)
          ?.map((e) => RelatedManga.fromJson(e as Map<String, dynamic>))
          .toList(),
      recommendations: (json['recommendations'] as List<dynamic>?)
          ?.map((e) => Recommendations.fromJson(e as Map<String, dynamic>))
          .toList(),
      serialization: const _SerializationConverter().fromJson(
        json['serialization'] as List?,
      ),
      statistics: json['statistics'] == null
          ? null
          : Statistics.fromJson(json['statistics'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MangaDetailsToJson(
  _MangaDetails instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'title': ?instance.title,
  'main_picture': ?instance.mainPicture?.toJson(),
  'alternative_titles': ?instance.alternativeTitles?.toJson(),
  'start_date': ?instance.startDate,
  'end_date': ?instance.endDate,
  'synopsis': ?instance.synopsis,
  'mean': ?instance.mean,
  'rank': ?instance.rank,
  'popularity': ?instance.popularity,
  'num_list_users': ?instance.numListUsers,
  'num_scoring_users': ?instance.numScoringUsers,
  'nsfw': ?instance.nsfw,
  'created_at': ?instance.createdAt,
  'updated_at': ?instance.updatedAt,
  'media_type': ?instance.mediaType,
  'status': ?instance.status,
  'genres': ?instance.genres?.map((e) => e.toJson()).toList(),
  'my_list_status': ?instance.myListStatus?.toJson(),
  'num_volumes': ?instance.numVolumes,
  'num_chapters': ?instance.numChapters,
  'authors': ?instance.authors?.map((e) => e.toJson()).toList(),
  'pictures': ?instance.pictures?.map((e) => e.toJson()).toList(),
  'background': ?instance.background,
  'related_anime': ?instance.relatedAnime?.map((e) => e.toJson()).toList(),
  'related_manga': ?instance.relatedManga?.map((e) => e.toJson()).toList(),
  'recommendations': ?instance.recommendations?.map((e) => e.toJson()).toList(),
  'serialization': ?const _SerializationConverter().toJson(
    instance.serialization,
  ),
  'statistics': ?instance.statistics?.toJson(),
};
