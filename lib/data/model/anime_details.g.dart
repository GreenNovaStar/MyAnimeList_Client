// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnimeDetails _$AnimeDetailsFromJson(
  Map<String, dynamic> json,
) => _AnimeDetails(
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
  myListStatus: json['my_list_status'] == null
      ? null
      : MyListStatus.fromJson(json['my_list_status'] as Map<String, dynamic>),
  genres: (json['genres'] as List<dynamic>?)
      ?.map((e) => Genres.fromJson(e as Map<String, dynamic>))
      .toList(),
  numEpisodes: (json['num_episodes'] as num?)?.toInt(),
  startSeason: json['start_season'] == null
      ? null
      : Season.fromJson(json['start_season'] as Map<String, dynamic>),
  broadcast: json['broadcast'] == null
      ? null
      : Broadcast.fromJson(json['broadcast'] as Map<String, dynamic>),
  source: json['source'] as String?,
  averageEpisodeDuration: (json['average_episode_duration'] as num?)?.toInt(),
  rating: json['rating'] as String?,
  pictures: (json['pictures'] as List<dynamic>?)
      ?.map((e) => Picture.fromJson(e as Map<String, dynamic>))
      .toList(),
  background: json['background'] as String?,
  relatedAnime: (json['related_anime'] as List<dynamic>?)
      ?.map((e) => RelatedAnime.fromJson(e as Map<String, dynamic>))
      .toList(),
  recommendations: (json['recommendations'] as List<dynamic>?)
      ?.map((e) => Recommendations.fromJson(e as Map<String, dynamic>))
      .toList(),
  studios: (json['studios'] as List<dynamic>?)
      ?.map((e) => Studios.fromJson(e as Map<String, dynamic>))
      .toList(),
  statistics: json['statistics'] == null
      ? null
      : Statistics.fromJson(json['statistics'] as Map<String, dynamic>),
  openingThemes: (json['opening_themes'] as List<dynamic>?)
      ?.map((e) => Themes.fromJson(e as Map<String, dynamic>))
      .toList(),
  endingThemes: (json['ending_themes'] as List<dynamic>?)
      ?.map((e) => Themes.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AnimeDetailsToJson(
  _AnimeDetails instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'title': ?instance.title,
  'main_picture': ?instance.mainPicture?.toJson(),
  'alternative_titles': ?instance.alternativeTitles?.toJson(),
  'start_date': ?instance.startDate,
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
  'my_list_status': ?instance.myListStatus?.toJson(),
  'genres': ?instance.genres?.map((e) => e.toJson()).toList(),
  'num_episodes': ?instance.numEpisodes,
  'start_season': ?instance.startSeason?.toJson(),
  'broadcast': ?instance.broadcast?.toJson(),
  'source': ?instance.source,
  'average_episode_duration': ?instance.averageEpisodeDuration,
  'rating': ?instance.rating,
  'pictures': ?instance.pictures?.map((e) => e.toJson()).toList(),
  'background': ?instance.background,
  'related_anime': ?instance.relatedAnime?.map((e) => e.toJson()).toList(),
  'recommendations': ?instance.recommendations?.map((e) => e.toJson()).toList(),
  'studios': ?instance.studios?.map((e) => e.toJson()).toList(),
  'statistics': ?instance.statistics?.toJson(),
  'opening_themes': ?instance.openingThemes?.map((e) => e.toJson()).toList(),
  'ending_themes': ?instance.endingThemes?.map((e) => e.toJson()).toList(),
};
