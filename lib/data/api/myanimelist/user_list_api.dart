import 'package:android_app/data/api/myanimelist/base_client.dart';
import 'package:android_app/data/model/media_list.dart';
import 'package:android_app/data/model/my_list_status.dart';
import 'package:dio/dio.dart';

mixin UserListApi on MALBaseClient {
  Future<MediaList> getUserAnimeList({
    String? status,
    String sort = 'list_updated_at',
    int limit = 20,
    int offset = 0,
  }) {
    return _getUserList(
      "animelist",
      "anime",
      status: status,
      sort: sort,
      limit: limit,
      offset: offset,
    );
  }

  Future<MediaList> getUserMangaList({
    String? status,
    String sort = 'list_updated_at',
    int limit = 20,
    int offset = 0,
  }) {
    return _getUserList(
      "mangalist",
      "manga",
      status: status,
      sort: sort,
      limit: limit,
      offset: offset,
    );
  }

  Future<MediaList> _getUserList(
    String listPath,
    String mediaLabel, {
    required String? status,
    required String sort,
    required int limit,
    required int offset,
  }) {
    return getAndParse(
      "/users/@me/$listPath",
      MediaList.fromJson,
      query: {
        "status": ?status,
        "sort": sort,
        "limit": limit,
        "offset": offset,
        "fields": MALBaseClient.listFields,
      },
      action: "Fetch your $mediaLabel list",
    );
  }

  Future<MyListStatus> updateMyAnimeListStatus(
    int animeId, {
    String? status,
    int? score,
    int? numWatchedEpisodes,
    bool? isRewatching,
    int? priority,
    int? numTimesRewatched,
    int? rewatchValue,
    String? tags,
    String? comments,
    String? startDate,
    String? finishDate,
  }) {
    return _updateListStatus("anime", animeId, {
      'status': status,
      'score': score,
      'num_watched_episodes': numWatchedEpisodes,
      'is_rewatching': isRewatching,
      'priority': priority,
      'num_times_rewatched': numTimesRewatched,
      'rewatch_value': rewatchValue,
      'tags': tags,
      'comments': comments,
      'start_date': startDate,
      'finish_date': finishDate,
    });
  }

  Future<MyListStatus> updateMyMangaListStatus(
    int mangaId, {
    String? status,
    int? score,
    int? numChaptersRead,
    int? numVolumesRead,
    bool? isRereading,
    int? priority,
    int? numTimesReread,
    int? rereadValue,
    String? tags,
    String? comments,
    String? startDate,
    String? finishDate,
  }) {
    return _updateListStatus("manga", mangaId, {
      'status': status,
      'score': score,
      'num_chapters_read': numChaptersRead,
      'num_volumes_read': numVolumesRead,
      'is_rereading': isRereading,
      'priority': priority,
      'num_times_reread': numTimesReread,
      'reread_value': rereadValue,
      'tags': tags,
      'comments': comments,
      'start_date': startDate,
      'finish_date': finishDate,
    });
  }

  Future<void> deleteMyAnimeListStatus(int animeId) {
    return guard(
      "Remove anime $animeId from list",
      () => dio.delete("/anime/$animeId/my_list_status", options: options),
    );
  }

  Future<void> deleteMyMangaListStatus(int mangaId) {
    return guard(
      "Remove manga $mangaId from list",
      () => dio.delete("/manga/$mangaId/my_list_status", options: options),
    );
  }

  Future<MyListStatus> _updateListStatus(
    String mediaType,
    int id,
    Map<String, dynamic> fields,
  ) {
    return guard("Update $mediaType $id list status", () async {
      final response = await dio.patch(
        "/$mediaType/$id/my_list_status",
        data: _buildFormBody(fields),
        options: _formOptions,
      );
      return MyListStatus.fromJson(response.data);
    });
  }

  Map<String, dynamic> _buildFormBody(Map<String, dynamic> fields) {
    final body = <String, dynamic>{};
    fields.forEach((key, value) {
      if (value == null) return;
      body[key] = value is bool ? value.toString() : value;
    });
    return body;
  }

  Options get _formOptions => Options(
    headers: options.headers,
    contentType: Headers.formUrlEncodedContentType,
  );
}
