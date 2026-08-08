import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:android_app/data/model/data.dart';
import 'package:android_app/data/model/paging.dart';
import 'package:android_app/data/model/season.dart';

part 'anime_seasonal.freezed.dart';
part 'anime_seasonal.g.dart';

/// Seasonal anime response (`GET /anime/season/{year}/{season}`): a paged list
/// plus the [season] it covers.
@freezed
abstract class AnimeSeasonal with _$AnimeSeasonal {
  const factory AnimeSeasonal({
    @Default(<Data>[]) List<Data> data,
    required Paging paging,
    required Season season,
  }) = _AnimeSeasonal;

  factory AnimeSeasonal.fromJson(Map<String, dynamic> json) =>
      _$AnimeSeasonalFromJson(json);
}
