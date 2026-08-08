import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:android_app/data/model/alternative_titles.dart';
import 'package:android_app/data/model/broadcast.dart';
import 'package:android_app/data/model/genre.dart';
import 'package:android_app/data/model/main_picture.dart';
import 'package:android_app/data/model/my_list_status.dart';
import 'package:android_app/data/model/recommendation.dart';
import 'package:android_app/data/model/related_anime.dart';
import 'package:android_app/data/model/season.dart';
import 'package:android_app/data/model/statistics.dart';
import 'package:android_app/data/model/studios.dart';
import 'package:android_app/data/model/themes.dart';

part 'anime_details.freezed.dart';
part 'anime_details.g.dart';

/// Full detail for a single anime (`GET /anime/{id}`).
@freezed
abstract class AnimeDetails with _$AnimeDetails {
  const factory AnimeDetails({
    int? id,
    String? title,
    Picture? mainPicture,
    AlternativeTitles? alternativeTitles,
    String? startDate,
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
    MyListStatus? myListStatus,
    List<Genres>? genres,
    int? numEpisodes,
    Season? startSeason,
    Broadcast? broadcast,
    String? source,
    int? averageEpisodeDuration,
    String? rating,
    List<Picture>? pictures,
    String? background,
    List<RelatedAnime>? relatedAnime,
    List<Recommendations>? recommendations,
    List<Studios>? studios,
    Statistics? statistics,
    List<Themes>? openingThemes,
    List<Themes>? endingThemes,
  }) = _AnimeDetails;

  factory AnimeDetails.fromJson(Map<String, dynamic> json) =>
      _$AnimeDetailsFromJson(json);
}
