import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_list_status.freezed.dart';
part 'my_list_status.g.dart';

/// The current user's personal list entry for an anime or manga.
///
/// Returned by the MAL API as `list_status` on list endpoints (ranking,
/// seasonal, search, user list) and as `my_list_status` on the detail and
/// PATCH endpoints — the shape is identical. Only present on authenticated
/// (Bearer) requests. Anime- and manga-specific counters are both nullable
/// so a single model serves both media types.
@freezed
abstract class MyListStatus with _$MyListStatus {
  const factory MyListStatus({
    String? status, // anime: watching|... ; manga: reading|...
    int? score,
    int? priority,
    List<String>? tags,
    String? comments,
    String? updatedAt,
    String? startDate,
    String? finishDate,

    // Anime-specific.
    int? numEpisodesWatched,
    bool? isRewatching,
    int? numTimesRewatched,
    int? rewatchValue,

    // Manga-specific.
    int? numChaptersRead,
    int? numVolumesRead,
    bool? isRereading,
    int? numTimesReread,
    int? rereadValue,
  }) = _MyListStatus;

  factory MyListStatus.fromJson(Map<String, dynamic> json) =>
      _$MyListStatusFromJson(json);
}
