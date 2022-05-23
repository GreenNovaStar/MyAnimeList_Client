import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/list_status_class.dart';
import 'package:mal_client_v2/API/Authorization/user_authorization.dart';
import 'package:mal_client_v2/API/User/User_Helper_Class/user_anime_list_class.dart';
import 'package:mal_client_v2/API/User/User_Helper_Class/user_class.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<User> getUserDetails() async {
  late User userInfo;

  tokenResponse = await retrieveTokens();
  checkToken(tokenResponse);

  BaseOptions _baseOptions = BaseOptions(
    headers: {"Authorization": "Bearer ${tokenResponse.access_token}"},
  );
  final Dio dio = Dio(_baseOptions);
  Response response;

  response = await dio.get(
    "https://api.myanimelist.net/v2/users/@me",
    queryParameters: {
      "fields": "anime_statistics",
    },
  );

  if (response.statusCode == 200) {
    userInfo = User.fromJson(response.data);
  } else {
    print("[getUserDetails] Error Calling API");
    print("[getUserDetails] Response Status Code = ${response.statusCode}");
  }

  return userInfo;
}

Future<UserAnimeList> getAnimeList(String status, String sort) async {
  // SharedPreferences prefs = await SharedPreferences.getInstance();

  tokenResponse = await retrieveTokens();
  checkToken(tokenResponse);

  BaseOptions _baseOptions = BaseOptions(
    headers: {"Authorization": "Bearer ${tokenResponse.access_token}"},
  );

  final Dio dio = Dio(_baseOptions);
  Response response;
  late UserAnimeList data;

  response = await dio.get(
    "https://api.myanimelist.net/v2/users/@me/animelist",
    queryParameters: {
      "fields":
          "list_status,id,title,main_picture,alternative_titles,start_date,end_date,synopsis,mean,rank,popularity,num_list_users,num_scoring_users,nsfw,created_at,updated_at,media_type,status,genres,my_list_status,num_episodes,start_season,broadcast,source,average_episode_duration,rating,pictures,background,related_anime,related_manga,recommendations,studios,statistics,opening_themes,ending_themes",
      "status": status,
      "sort": sort,
      "limit": 300,
    },
  );

  if (response.statusCode == 200) {
    data = UserAnimeList.fromJson(response.data);
  } else {
    print("[getAnimeList] Error Calling API");
    print("[getAnimeList] Response Status Code = ${response.statusCode}");
  }

  return data;
}

Future<ListStatus> updateAnimeList(
    int animeID,
    String? status,
    bool? isRewatching,
    int? numWatchedEpisodes,
    int? score,
    String? startDate,
    String? finishDate) async {
  tokenResponse = await retrieveTokens();
  checkToken(tokenResponse);

  BaseOptions _baseOptions = BaseOptions(
    headers: {"Authorization": "Bearer ${tokenResponse.access_token}"},
    contentType: Headers.formUrlEncodedContentType,
  );

  final Dio dio = Dio(_baseOptions);
  Response response;
  late ListStatus data;

  response = await dio.patch(
      "https://api.myanimelist.net/v2/anime/$animeID/my_list_status",
      data: {
        "status": status,
        "is_rewatching": isRewatching,
        "num_watched_episodes": numWatchedEpisodes,
        "score": score,
        "start_date": startDate,
        "finish_date": finishDate,
      });

  if (response.statusCode == 200) {
    data = ListStatus.fromJson(response.data);
    print("Successfully updated list ${data.toString()}");
  } else {
    print("[patchAnimeList] Error Calling API");
    print("[patchAnimeList] Response Status Code = ${response.statusCode}");
  }

  return data;
}

Future<List<dynamic>> deleteAnimeFromList(int animeID) async {
  tokenResponse = await retrieveTokens();
  checkToken(tokenResponse);

  BaseOptions _baseOptions = BaseOptions(
    headers: {"Authorization": "Bearer ${tokenResponse.access_token}"},
    contentType: Headers.formUrlEncodedContentType,
  );

  final Dio dio = Dio(_baseOptions);
  Response response;
  late List<dynamic> data;

  response = await dio
      .delete("https://api.myanimelist.net/v2/anime/$animeID/my_list_status");

  if (response.statusCode == 200) {
    data = response.data;
    if (data.isEmpty) {
      print("Successfully deleted anime list ${data.toString()}");
    } else {
      print("unable to remove anime from list ${data.toString()}");
    }
  } else {
    print("[deleteAnimeFromList] Error Calling API");
    print(
        "[deleteAnimeFromList] Response Status Code = ${response.statusCode}");
  }
  return data;
}
