import 'dart:convert';
import 'dart:developer'; //  allows to use log(), a way to print a longer string.

import 'package:dio/dio.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/anime_details_class.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/anime_ranking_class.dart';
import 'package:mal_client_v2/API/Authorization/user_authorization.dart';
import 'package:mal_client_v2/User/user_const.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<AnimeDetails> getAnimeDetails(int? animeID) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String _cachedAnime = prefs.getString("anime$animeID") ?? "";
  _cachedAnime = "";
  late AnimeDetails animeDetails;

  if (_cachedAnime.isEmpty) {
    tokenResponse = await retrieveTokens();
    checkToken(tokenResponse);

    BaseOptions _baseOptions = BaseOptions();
    if (!skippedLogin && tokenResponse.access_token.isNotEmpty) {
      _baseOptions = BaseOptions(
        headers: {"Authorization": "Bearer ${tokenResponse.access_token}"},
      );
    } else {
      _baseOptions = BaseOptions(
        headers: {"X-MAL-CLIENT-ID": clientID},
      );
    }

    final Dio dio = Dio(_baseOptions);
    Response response;

    response = await dio.get(
      "https://api.myanimelist.net/v2/anime/$animeID",
      queryParameters: {
        "fields":
            "id,title,main_picture,alternative_titles,start_date,end_date,synopsis,mean,rank,popularity,num_list_users,num_scoring_users,nsfw,created_at,updated_at,media_type,status,genres,my_list_status,num_episodes,start_season,broadcast,source,average_episode_duration,rating,pictures,background,related_anime,related_manga,recommendations,studios,statistics,opening_themes,ending_themes",
        // "fields": "id,title,main_picture,alternative_titles,start_date,end_date,synopsis,mean,rank,popularity,num_list_users,num_scoring_users,nsfw,created_at,updated_at,media_type,status,genres,my_list_status,num_episodes,start_season,broadcast,source,average_episode_duration,rating,pictures,background,related_anime,related_manga,recommendations,studios,statistics",
      },
    );

    if (response.statusCode == 200) {
      // print("response data = ${response.data.toString()}");
      animeDetails = AnimeDetails.fromJson(response.data);
      // prefs.setString("anime$animeID", jsonEncode(animeDetails.toJson()));
    } else {
      print("[getAnimeDetails] Error Calling API");
      print("[getAnimeDetails] Response Status Code = ${response.statusCode}");
    }
  } else {
    print("loaded anime $animeID data from file");
    animeDetails = AnimeDetails.fromJson(jsonDecode(_cachedAnime));
    print(animeDetails.title);
  }

  return animeDetails;
}

Future<AnimeRanking> getAnimeRanking(
    String rankingType, int limit, int offset) async {
  tokenResponse = await retrieveTokens();
  checkToken(tokenResponse);

  BaseOptions _baseOptions = BaseOptions();
  if (!skippedLogin && tokenResponse.access_token.isNotEmpty) {
    _baseOptions = BaseOptions(
      headers: {"Authorization": "Bearer ${tokenResponse.access_token}"},
    );
  } else {
    _baseOptions = BaseOptions(
      headers: {"X-MAL-CLIENT-ID": clientID},
    );
  }
  final Dio dio = Dio(_baseOptions);
  Response response;
  late AnimeRanking animeRanking;

  response = await dio.get(
    "https://api.myanimelist.net/v2/anime/ranking",
    queryParameters: {
      "ranking_type": rankingType,
      "limit": limit,
      "offset": offset,
      "fields":
          "id,title,main_picture,alternative_titles,start_date,end_date,synopsis,mean,rank,popularity,num_list_users,num_scoring_users,nsfw,created_at,updated_at,media_type,status,genres,my_list_status,num_episodes,start_season,broadcast,source,average_episode_duration,rating,pictures,background,related_anime,related_manga,recommendations,studios,statistics,opening_themes,ending_themes",
    },
  );

  if (response.statusCode == 200) {
    animeRanking = AnimeRanking.fromJson(response.data);
  } else {
    print("[getAnimeRanking] Error Calling API");
    print("[getAnimeRanking] Response Status Code = ${response.statusCode}");
  }

  return animeRanking;
}

Future<AnimeRanking> searchAnime(
    String searchQuery, int limit, int offset) async {
  tokenResponse = await retrieveTokens();
  checkToken(tokenResponse);

  BaseOptions _baseOptions = BaseOptions();
  if (!skippedLogin && tokenResponse.access_token.isNotEmpty) {
    _baseOptions = BaseOptions(
      headers: {"Authorization": "Bearer ${tokenResponse.access_token}"},
    );
  } else {
    _baseOptions = BaseOptions(
      headers: {"X-MAL-CLIENT-ID": clientID},
    );
  }
  final Dio dio = Dio(_baseOptions);
  Response response;
  late AnimeRanking animeRanking;

  response = await dio.get(
    "https://api.myanimelist.net/v2/anime",
    queryParameters: {"q": searchQuery, "limit": limit, "offset": offset},
  );

  if (response.statusCode == 200) {
    animeRanking = AnimeRanking.fromJson(response.data);
  } else {
    print("[searchAnime] Error Calling API");
    print("[searchAnime] Response Status Code = ${response.statusCode}");
  }

  return animeRanking;
}

Future<AnimeRanking> getSuggestedAnime(int limit, int offset) async {
  tokenResponse = await retrieveTokens();
  checkToken(tokenResponse);

  BaseOptions _baseOptions = BaseOptions(
    headers: {"Authorization": "Bearer ${tokenResponse.access_token}"},
  );
  final Dio dio = Dio(_baseOptions);
  Response response;
  late AnimeRanking animeRanking;

  response = await dio.get(
    "https://api.myanimelist.net/v2/anime/suggestions",
    queryParameters: {
      "limit": limit,
      "offset": offset,
      "fields":
          "id,title,main_picture,alternative_titles,start_date,end_date,synopsis,mean,rank,popularity,num_list_users,num_scoring_users,nsfw,created_at,updated_at,media_type,status,genres,my_list_status,num_episodes,start_season,broadcast,source,average_episode_duration,rating,pictures,background,related_anime,related_manga,recommendations,studios,statistics,opening_themes,ending_themes",
    },
  );

  if (response.statusCode == 200) {
    animeRanking = AnimeRanking.fromJson(response.data);
  } else {
    print("[getSuggestedAnime] Error Calling API");
    print("[getSuggestedAnime] Response Status Code = ${response.statusCode}");
  }

  return animeRanking;
}
