import 'package:android_app/data/exceptions/exception_mapper.dart';
import 'package:android_app/data/model/anime_details.dart';
import 'package:android_app/data/model/anime_ranking.dart';
import 'package:android_app/data/model/anime_seasonal.dart';
import 'package:android_app/data/model/manga_details.dart';
import 'package:android_app/data/model/media_list.dart';
import 'package:android_app/data/model/month.dart';
import 'package:android_app/data/model/ranking_type.dart';
import 'package:android_app/utils/helpers/seasonal_helper.dart';
import 'package:dio/dio.dart';

/// Shared MAL v2 client. Subclasses only differ in how they authenticate:
/// they set [options] (client-id header for guests, bearer token for users).
/// Unauthenticated requests may still send `fields` — the API simply omits
/// user-specific fields like `list_status` from the response.
abstract class MALBaseClient {
  late Dio dio;
  late Options options;

  /// The full set of fields requested for a single anime's detail view.
  static const String animeDetailFields =
      "id,title,main_picture,alternative_titles,start_date,end_date,synopsis,mean,rank,popularity,num_list_users,num_scoring_users,nsfw,created_at,updated_at,media_type,status,genres,my_list_status,num_episodes,start_season,broadcast,source,average_episode_duration,rating,pictures,background,related_anime,related_manga,recommendations,studios,statistics,opening_themes,ending_themes";

  /// The full set of fields requested for a single manga's detail view.
  static const String mangaDetailFields =
      "id,title,main_picture,alternative_titles,start_date,end_date,synopsis,mean,rank,popularity,num_list_users,num_scoring_users,nsfw,created_at,updated_at,media_type,status,genres,my_list_status,num_volumes,num_chapters,authors{first_name,last_name},pictures,background,related_anime,related_manga,recommendations,serialization{name},statistics";

  /// Fields requested for list endpoints (ranking/seasonal/suggestions).
  static const String listFields =
      "alternative_titles,mean,media_type,num_episodes,num_chapters,num_volumes,status,start_season,list_status";

  /// Node fields worth surfacing on search/list tiles alongside list_status.
  static const String searchFields =
      "id,title,alternative_titles,main_picture,mean,media_type,num_episodes,num_chapters,num_volumes,status,list_status";

  /// Fields requested for the signed-in user's profile.
  static const String userProfileFields = "anime_statistics";

  final BaseOptions _baseOptions = BaseOptions(
    baseUrl: "https://api.myanimelist.net/v2",
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
  );

  MALBaseClient() {
    dio = Dio(_baseOptions);
  }

  /// Runs [request], mapping any [DioException] to a domain exception tagged
  /// with [action] (a short human-readable description of what was attempted).
  Future<T> guard<T>(String action, Future<T> Function() request) async {
    try {
      return await request();
    } on DioException catch (e) {
      throw mapDioException(e, action);
    }
  }

  /// GETs [path] with this client's auth [options] and parses the JSON body.
  Future<T> getAndParse<T>(
    String path,
    T Function(Map<String, dynamic>) parse, {
    Map<String, dynamic>? query,
    required String action,
  }) {
    return guard(action, () async {
      final response = await dio.get(
        path,
        options: options,
        queryParameters: query,
      );
      return parse(response.data);
    });
  }

  Future<AnimeRanking> getAnimeRanking(
    AnimeRankingType rankingType, {
    int limit = 20,
    int offset = 0,
  }) {
    return getAndParse(
      "/anime/ranking",
      AnimeRanking.fromJson,
      query: {
        "ranking_type": rankingType.value,
        "limit": limit,
        "offset": offset,
        "fields": listFields,
      },
      action: "Fetch anime ranking ${rankingType.value}",
    );
  }

  Future<AnimeSeasonal> getSeasonalAnime(
    String year,
    String season, {
    int limit = 10,
    int offset = 0,
  }) {
    return getAndParse(
      "/anime/season/$year/$season",
      AnimeSeasonal.fromJson,
      query: {
        "limit": limit,
        "offset": offset,
        "sort": "anime_num_list_users",
        "fields": listFields,
      },
      action: "Fetch seasonal anime $year/$season",
    );
  }

  Future<AnimeDetails> getAnimeDetails(int animeId) {
    return getAndParse(
      "/anime/$animeId",
      AnimeDetails.fromJson,
      query: {"fields": animeDetailFields},
      action: "Fetch anime $animeId",
    );
  }

  Future<MangaDetails> getMangaDetails(int mangaId) {
    return getAndParse(
      "/manga/$mangaId",
      MangaDetails.fromJson,
      query: {"fields": mangaDetailFields},
      action: "Fetch manga $mangaId",
    );
  }

  Future<MediaList> searchAnime(
    String query, {
    int limit = 20,
    int offset = 0,
  }) {
    return getAndParse(
      "/anime",
      MediaList.fromJson,
      query: {
        "q": query,
        "limit": limit,
        "offset": offset,
        "fields": searchFields,
      },
      action: "Search anime '$query'",
    );
  }

  Future<MediaList> searchManga(
    String query, {
    int limit = 20,
    int offset = 0,
  }) {
    return getAndParse(
      "/manga",
      MediaList.fromJson,
      query: {
        "q": query,
        "limit": limit,
        "offset": offset,
        "fields": searchFields,
      },
      action: "Search manga '$query'",
    );
  }

  Future<MediaList> getMangaRanking(
    MangaRankingType rankingType, {
    int limit = 20,
    int offset = 0,
  }) {
    return getAndParse(
      "/manga/ranking",
      MediaList.fromJson,
      query: {
        "ranking_type": rankingType.value,
        "limit": limit,
        "offset": offset,
        "fields": listFields,
      },
      action: "Fetch manga ranking ${rankingType.value}",
    );
  }

  Future<AnimeSeasonal> getCurrentSeasonAnimes({
    int limit = 10,
    int offset = 0,
  }) {
    final now = DateTime.now();
    final season = Month.fromDateTime(now).season;
    return getSeasonalAnime(
      now.year.toString(),
      season.value,
      limit: limit,
      offset: offset,
    );
  }

  Future<AnimeSeasonal> getNextSeasonAnimes({int limit = 10, int offset = 0}) {
    final now = DateTime.now();
    final currentSeason = Month.fromDateTime(now).season;
    final (nextSeason, nextYear) = getNextSeason(currentSeason, now.year);
    return getSeasonalAnime(
      nextYear.toString(),
      nextSeason.value,
      limit: limit,
      offset: offset,
    );
  }
}
