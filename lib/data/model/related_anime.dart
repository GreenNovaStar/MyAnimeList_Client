import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:android_app/data/model/node.dart';

part 'related_anime.freezed.dart';
part 'related_anime.g.dart';

@freezed
abstract class RelatedAnime with _$RelatedAnime {
  const factory RelatedAnime({
    Node? node,
    String? relationType,
    String? relationTypeFormatted,
  }) = _RelatedAnime;

  factory RelatedAnime.fromJson(Map<String, dynamic> json) =>
      _$RelatedAnimeFromJson(json);
}

@freezed
abstract class RelatedManga with _$RelatedManga {
  const factory RelatedManga({
    Node? node,
    String? relationType,
    String? relationTypeFormatted,
  }) = _RelatedManga;

  factory RelatedManga.fromJson(Map<String, dynamic> json) =>
      _$RelatedMangaFromJson(json);
}
