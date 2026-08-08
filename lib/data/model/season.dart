import 'package:freezed_annotation/freezed_annotation.dart';

part 'season.freezed.dart';
part 'season.g.dart';

@freezed
abstract class Season with _$Season {
  const factory Season({required int year, required String season}) = _Season;

  factory Season.fromJson(Map<String, dynamic> json) => _$SeasonFromJson(json);
}
