import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:android_app/data/model/alternative_titles.dart';
import 'package:android_app/data/model/main_picture.dart';

part 'node.freezed.dart';
part 'node.g.dart';

@freezed
abstract class Node with _$Node {
  const factory Node({
    int? id,
    // Nullable: most nodes carry a title, but person/author nodes (returned in
    // manga authors[]) instead have first_name/last_name and no title.
    String? title,
    Picture? mainPicture,
    AlternativeTitles? alternativeTitles,

    // Person-node fields (manga authors).
    String? firstName,
    String? lastName,

    // Optional fields present when a richer `fields` set is requested (and for
    // manga nodes). Nullable so plain anime nodes are unaffected.
    // json_serializable coerces JSON num -> double automatically, so an
    // integer `mean` from the API no longer crashes (the old hand-written bug).
    double? mean,
    String? mediaType,
    String? status,
    int? numEpisodes, // anime
    int? numChapters, // manga
    int? numVolumes, // manga
  }) = _Node;

  factory Node.fromJson(Map<String, dynamic> json) => _$NodeFromJson(json);
}
