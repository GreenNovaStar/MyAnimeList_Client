import 'package:dio/dio.dart';
import 'package:myanimelist_client/API/Anime/Anime_Helper_Class/anime_details_class.dart';
import 'package:myanimelist_client/API/Anime/Anime_Helper_Class/anime_ranking_class.dart';
import '../Authorization/user_authorization.dart';

BaseOptions _baseOptions = BaseOptions(
  headers: {"Authorization": "Bearer ${tokenResponse.access_token}"},
);

Future<AnimeDetails> getAnimeDetails(int? animeID) async {
  tokenResponse = await retrieveTokens();
  final Dio dio = Dio(_baseOptions);
  Response response;
  late AnimeDetails animeDetails;

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
  } else {
    //todo: refresh access token
  }
  return animeDetails;
}

Future<AnimeRanking> getAnimeRanking(
    String rankingType, int limit, int offset) async {
  tokenResponse = await retrieveTokens();
  final Dio dio = Dio(_baseOptions);
  Response response;
  late AnimeRanking animeRanking;

  response = await dio.get(
    "https://api.myanimelist.net/v2/anime/ranking",
    queryParameters: {
      "ranking_type": rankingType,
      "limit": limit,
      "offset": offset
    },
  );

  if (response.statusCode == 200) {
    animeRanking = AnimeRanking.fromJson(response.data);
  } else {
    //todo: refresh access token
  }
  return animeRanking;
}

Future<AnimeRanking> searchAnime(
    String searchQuery, int limit, int offset) async {
  tokenResponse = await retrieveTokens();
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
    //todo: refresh access token
  }
  return animeRanking;
}

// Future<AnimeRanking> getTopUpcomingAnime() async {
//   tokenResponse = await retrieveTokens();
//   final Dio dio = Dio(_baseOptions);
//   Response response;
//   late AnimeRanking animeRanking;

//   response = await dio.get(
//     "https://api.myanimelist.net/v2/anime/ranking",
//     queryParameters: {
//       "ranking_type": "upcoming",
//       "limit": 10,
//     },
//   );

//   if (response.statusCode == 200) {
//     animeRanking = AnimeRanking.fromJson(response.data);
//   } else {
//     //todo: refresh access token
//   }
//   return animeRanking;
// }

// Future<AnimeRanking> getTopAnime() async {
//   tokenResponse = await retrieveTokens();
//   final Dio dio = Dio(_baseOptions);
//   Response response;
//   late AnimeRanking animeRanking;

//   response = await dio.get(
//     "https://api.myanimelist.net/v2/anime/ranking",
//     queryParameters: {
//       "ranking_type": "all",
//       "limit": 10,
//     },
//   );

//   if (response.statusCode == 200) {
//     animeRanking = AnimeRanking.fromJson(response.data);
//   } else {
//     //todo: refresh access token
//   }
//   return animeRanking;
// }

// Future<AnimeRanking> getTopTVAnime() async {
//   tokenResponse = await retrieveTokens();
//   final Dio dio = Dio(_baseOptions);
//   Response response;
//   late AnimeRanking animeRanking;

//   response = await dio.get(
//     "https://api.myanimelist.net/v2/anime/ranking",
//     queryParameters: {
//       "ranking_type": "tv",
//       "limit": 10,
//     },
//   );

//   if (response.statusCode == 200) {
//     animeRanking = AnimeRanking.fromJson(response.data);
//   } else {
//     //todo: refresh access token
//   }
//   return animeRanking;
// }
