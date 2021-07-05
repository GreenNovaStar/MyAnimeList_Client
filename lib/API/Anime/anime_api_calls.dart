import 'package:dio/dio.dart';
import 'package:myanimelist_client/API/Anime/Anime_Helper_Class/anime_details_class.dart';
import 'package:myanimelist_client/user_authorization.dart';

BaseOptions _baseOptions = BaseOptions(headers: {"Authorization": "Bearer ${tokenResponse.access_token}"},);

Future<AnimeDetails> getAnimeDetails(int? animeID) async {
  tokenResponse = await retrieveTokens();
  final Dio dio = Dio(_baseOptions);
  Response response;
  late AnimeDetails animeDetails;

  response = await dio.get("https://api.myanimelist.net/v2/anime/$animeID",
    queryParameters: {
      "fields": "id,title,main_picture,alternative_titles,start_date,end_date,synopsis,mean,rank,popularity,num_list_users,num_scoring_users,nsfw,created_at,updated_at,media_type,status,genres,my_list_status,num_episodes,start_season,broadcast,source,average_episode_duration,rating,pictures,background,related_anime,related_manga,recommendations,studios,statistics",
      // "fields": "id,title,main_picture,alternative_titles,start_date,end_date,synopsis,mean,rank,popularity,num_list_users,num_scoring_users,nsfw,created_at,updated_at,media_type,status,genres,my_list_status,num_episodes,start_season,broadcast,source,average_episode_duration,rating,pictures,background,related_anime,related_manga,recommendations,studios,statistics",
    },
  );

  if(response.statusCode == 200){
    // print("response data = ${response.data.toString()}");
    animeDetails = AnimeDetails.fromJson(response.data);
  }else{
    //todo: refresh access token
  }
  return animeDetails;
}

/*
"id,
title,
main_picture,
alternative_titles,
start_date,
end_date,
synopsis,
mean,
rank,
popularity,
num_list_users,
num_scoring_users,
nsfw,
created_at,
updated_at,
media_type,
status,
genres,
my_list_status,
num_episodes,
start_season,
broadcast,
source,
average_episode_duration,
rating,
pictures,
background,
related_anime,
recommendations,
studios,
statistics"
 */