import 'package:freezed_annotation/freezed_annotation.dart';

part 'alternative_titles.freezed.dart';
part 'alternative_titles.g.dart';

/// Alternative titles for a media item. All fields are nullable: the MAL API
/// omits `en`/`ja` when empty and may omit `synonyms` entirely (the old
/// `late`/non-null version crashed on such partial responses).
@freezed
abstract class AlternativeTitles with _$AlternativeTitles {
  const factory AlternativeTitles({
    @Default(<String>[]) List<String> synonyms,
    String? en,
    String? ja,
  }) = _AlternativeTitles;

  factory AlternativeTitles.fromJson(Map<String, dynamic> json) =>
      _$AlternativeTitlesFromJson(json);
}
