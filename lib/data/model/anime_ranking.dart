import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:android_app/data/model/data.dart';
import 'package:android_app/data/model/paging.dart';

part 'anime_ranking.freezed.dart';
part 'anime_ranking.g.dart';

/// Paginated ranking response (`GET /anime/ranking`). Structurally identical to
/// [MediaList]; kept as a distinct type for now (a future refactor can collapse
/// the paged-list containers into one generic).
@freezed
abstract class AnimeRanking with _$AnimeRanking {
  const factory AnimeRanking({
    required List<Data> data,
    required Paging paging,
  }) = _AnimeRanking;

  factory AnimeRanking.fromJson(Map<String, dynamic> json) =>
      _$AnimeRankingFromJson(json);
}
