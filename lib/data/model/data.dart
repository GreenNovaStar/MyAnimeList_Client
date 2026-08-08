import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:android_app/data/model/my_list_status.dart';
import 'package:android_app/data/model/node.dart';
import 'package:android_app/data/model/ranking.dart';

part 'data.freezed.dart';
part 'data.g.dart';

/// Per-item envelope in every paginated response: the media [node] plus its
/// optional [ranking] (ranking endpoints) and [listStatus] (authenticated
/// requests). `listStatus` maps to the `list_status` JSON key via snake_case.
@freezed
abstract class Data with _$Data {
  const factory Data({
    required Node node,
    Ranking? ranking,
    MyListStatus? listStatus,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
