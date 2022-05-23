import 'dart:core';

import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/alternative_title_class.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/anime_statistics_class.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/broadcast_class.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/genre_class.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/main_picture_class.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/recommendation_class.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/related_anime_class.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/start_season_class.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/studios_class.dart';

import 'anime_theme_class.dart';

class AnimeDetails {
  /// Anime ID
  late int id;

  /// Anime Romanji Title
  late String title;

  /// Main Picture on MAL
  late MainPicture mainPicture;

  /// Alternate titles
  late AlternativeTitle? alternativeTitle;
  late String? startDate;
  late String? endDate;
  late String? synopsis;
  late double? mean;
  late int? rank;
  late int? popularity;
  late int? numListUsers;
  late int? numScoringUsers;
  late String? nsfw;
  late String? createdAt;
  late String? updatedAt;
  late String? mediaType;
  late String? status;
  late List<Genres>? genre;
  late int? numEpisodes;
  late StartSeason? startSeason;
  late Broadcast? broadcast;
  late String? source;
  late int? averageEpisodeDuration;
  late String? rating;
  late List<MainPicture>? pictures;
  late String? background;
  late List<RelatedAnime>? relatedAnime;
  late List<Recommendation>? recommendations;
  late List<Studio>? studios;
  late AnimeStatistics? animeStatistics;
  List<AnimeTheme>? animeOpening;
  List<AnimeTheme>? animeEnding;

  AnimeDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    mainPicture = MainPicture.fromJson(json['main_picture']);
    alternativeTitle = json['alternative_titles'] != null
        ? AlternativeTitle.fromJson(json['alternative_titles'])
        : null;
    startDate = json['start_date'];
    endDate = json['end_date'];
    synopsis = json['synopsis'];
    mean = json['mean'];
    rank = json['rank'];
    popularity = json['popularity'];
    numListUsers = json['num_list_users'];
    numScoringUsers = json['num_scoring_users'];
    nsfw = json['nsfw'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    mediaType = json['media_type'];
    status = json['status'];
    if (json['genres'] != null) {
      genre = <Genres>[];
      json['genres'].forEach((v) {
        genre!.add(Genres.fromJson(v));
      });
    }
    numEpisodes = json['num_episodes'];
    startSeason = json['start_season'] != null
        ? StartSeason.fromJson(json['start_season'])
        : null;
    broadcast = json['broadcast'] != null
        ? Broadcast.fromJson(json['broadcast'])
        : null;
    source = json['source'];
    averageEpisodeDuration = json['average_episode_duration'];
    rating = json['rating'];
    if (json['pictures'] != null) {
      pictures = <MainPicture>[];
      json['pictures'].forEach((v) {
        MainPicture.fromJson(v);
      });
    }
    background = json['background'];
    if (json['related_anime'] != null) {
      relatedAnime = <RelatedAnime>[];
      json['related_anime'].forEach((v) {
        relatedAnime?.add(RelatedAnime.fromJson(v));
      });
    }
    // // if (json['related_manga'] != null) {
    // //   relatedManga = new List<Null>();
    // //   json['related_manga'].forEach((v) {
    // //     relatedManga.add(new Null.fromJson(v));
    // //   });
    // // }
    if (json['recommendations'] != null) {
      recommendations = <Recommendation>[];
      json['recommendations'].forEach((v) {
        recommendations!.add(Recommendation.fromJson(v));
      });
    }
    if (json['studios'] != null) {
      studios = <Studio>[];
      json['studios'].forEach((v) {
        studios!.add(Studio.fromJson(v));
      });
    }
    animeStatistics = json['statistics'] != null
        ? AnimeStatistics.fromJson(json['statistics'])
        : null;
    if (json['opening_themes'] != null) {
      animeOpening = <AnimeTheme>[];
      json['opening_themes'].forEach((v) {
        animeOpening!.add(AnimeTheme.fromJson(v));
      });
    }
    if (json['ending_themes'] != null) {
      animeEnding = <AnimeTheme>[];
      json['ending_themes'].forEach((v) {
        animeEnding!.add(AnimeTheme.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['main_picture'] = mainPicture.toJson();
    data['alternative_titles'] = alternativeTitle!.toJson();
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['synopsis'] = synopsis;
    data['mean'] = mean;
    data['rank'] = rank;
    data['popularity'] = popularity;
    data['num_list_users'] = numListUsers;
    data['num_scoring_users'] = numScoringUsers;
    data['nsfw'] = nsfw;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['media_type'] = mediaType;
    data['status'] = status;
    data['genres'] = genre?.map((v) => v.toJson()).toList();
    data['num_episodes'] = numEpisodes;
    data['start_season'] = startSeason?.toJson();
    data['broadcast'] = broadcast?.toJson();
    data['source'] = source;
    data['average_episode_duration'] = averageEpisodeDuration;
    data['rating'] = rating;
    data['pictures'] = pictures?.map((v) => v.toJson()).toList();
    data['background'] = background;
    data['related_anime'] = relatedAnime?.map((v) => v.toJson()).toList();
    // if (this.relatedManga != null) {
    //   data['related_manga'] = this.relatedManga.map((v) => v.toJson()).toList();
    // }
    data['recommendations'] = recommendations?.map((v) => v.toJson()).toList();
    data['studios'] = studios?.map((v) => v.toJson()).toList();
    data['statistics'] = animeStatistics?.toJson();
    if (animeOpening != null) {
      data['opening_themes'] = animeOpening?.map((v) => v.toJson()).toList();
    }
    if (animeEnding != null) {
      data['ending_themes'] = animeEnding?.map((v) => v.toJson()).toList();
    }
    return data;
  }

  String toString() {
    return toJson().toString();
  }
}
