import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/alternative_title_class.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/broadcast_class.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/genre_class.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/list_status_class.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/main_picture_class.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/start_season_class.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/studios_class.dart';

class Node {
  /// Anime id
  int? id;

  /// Anime title
  String? title;

  /// Anime main picture
  MainPicture? mainPicture;

  /// Alternative Titles
  AlternativeTitle? alternativeTitle;

  /// Start Date
  String? startDate;

  /// End Date
  String? endDate;

  /// Anime Synopsis
  String? synopsis;

  /// Mean Score for Anime
  var mean;

  /// Rank for the anime
  int? rank;

  /// Popularity of the anime
  int? popularity;

  /// Number of users that have this anime in their list
  int? numListUsers;

  /// Number of users that have scored this anime
  int? numScoringUsers;

  /// Color regarding the anime if it is NSFW
  String? nsfw;

  /// Date that this anime was added to MyAnimeList Servers
  String? createdAt;

  /// Date that this anime was last updated on MyAnimeList Servers
  String? updatedAt;

  /// What the Viewing type of this anime
  String? mediaType;

  /// What is the Status of this anime.
  /// airing/finished_airing/not_yet_aired
  String? status;

  /// Genres for this anime
  List<Genres>? genre;

  /// Number of episodes for this anime
  int? numEpisodes;

  /// What season did this anime start airing
  StartSeason? startSeason;

  /// What day and time did this anime air
  Broadcast? broadcast;

  /// What was the original source for this anime
  String? source;

  /// How long on average each episode is, in seconds
  int? averageEpisodeDuration;

  /// What is the PG Rating of this show
  String? rating;

  /// What Studio(s) was involved in creating this anime
  List<Studio>? studios;

  /// List Status of this anime
  ListStatus? listStatus;

  Node.fromJson(Map<String, dynamic> json) {
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
    if (json['studios'] != null) {
      studios = <Studio>[];
      json['studios'].forEach((v) {
        studios!.add(Studio.fromJson(v));
      });
    }
    if (json['my_list_status'] != null) {
      listStatus = ListStatus.fromJson(json['my_list_status']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['main_picture'] = mainPicture?.toJson();
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
    data['studios'] = studios?.map((v) => v.toJson()).toList();
    data['my_list_status'] = listStatus?.toJson();
    return data;
  }

  String toString() {
    return toJson().toString();
  }
}
