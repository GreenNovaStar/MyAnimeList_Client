import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:android_app/data/model/data.dart';
import 'package:android_app/data/model/paging.dart';

part 'media_list.freezed.dart';
part 'media_list.g.dart';

/// A generic paginated list of media items, reused for search results,
/// suggestions, and the user's own anime/manga lists. Each item is a [Data]
/// wrapper ({node, list_status?}).
///
/// Pilot note: [Data] and [Paging] are still hand-written (fromJson/toJson).
/// This model exercises freezed -> legacy interop; codegen calls their
/// Data.fromJson / Paging.fromJson directly.
@freezed
abstract class MediaList with _$MediaList {
  const factory MediaList({required List<Data> data, required Paging paging}) =
      _MediaList;

  factory MediaList.fromJson(Map<String, dynamic> json) =>
      _$MediaListFromJson(json);
}
