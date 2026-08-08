import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:android_app/data/model/alternative_titles.dart';
import 'package:android_app/data/model/author.dart';
import 'package:android_app/data/model/genre.dart';
import 'package:android_app/data/model/main_picture.dart';
import 'package:android_app/data/model/my_list_status.dart';
import 'package:android_app/data/model/recommendation.dart';
import 'package:android_app/data/model/related_anime.dart';
import 'package:android_app/data/model/statistics.dart';

part 'manga_details.freezed.dart';
part 'manga_details.g.dart';

/// Flattens the MAL `serialization` field, which arrives as a list of
/// `{node: {id, name}}` wrappers, down to a list of magazine names. Symmetric
/// so a cached model round-trips back to the same wire shape.
class _SerializationConverter
    implements JsonConverter<List<String>?, List<dynamic>?> {
  const _SerializationConverter();

  @override
  List<String>? fromJson(List<dynamic>? json) {
    if (json == null) return null;
    final names = <String>[];
    for (final v in json) {
      final name = v is Map && v['node'] != null ? v['node']['name'] : null;
      if (name != null) names.add(name as String);
    }
    return names;
  }

  @override
  List<dynamic>? toJson(List<String>? names) {
    if (names == null) return null;
    return names
        .map(
          (name) => {
            'node': {'name': name},
          },
        )
        .toList();
  }
}

/// Full detail for a single manga (`GET /manga/{id}`). Mirrors AnimeDetails,
/// swapping in manga-specific fields (chapters/volumes, authors) and dropping
/// anime-only fields (broadcast, season, studios, themes).
@freezed
abstract class MangaDetails with _$MangaDetails {
  const factory MangaDetails({
    int? id,
    String? title,
    Picture? mainPicture,
    AlternativeTitles? alternativeTitles,
    String? startDate,
    String? endDate,
    String? synopsis,
    double? mean,
    int? rank,
    int? popularity,
    int? numListUsers,
    int? numScoringUsers,
    String? nsfw,
    String? createdAt,
    String? updatedAt,
    String? mediaType,
    String? status,
    List<Genres>? genres,
    MyListStatus? myListStatus,
    int? numVolumes,
    int? numChapters,
    List<Author>? authors,
    List<Picture>? pictures,
    String? background,
    List<RelatedAnime>? relatedAnime,
    List<RelatedManga>? relatedManga,
    List<Recommendations>? recommendations,
    @_SerializationConverter() List<String>? serialization,
    Statistics? statistics,
  }) = _MangaDetails;

  factory MangaDetails.fromJson(Map<String, dynamic> json) =>
      _$MangaDetailsFromJson(json);
}
