import 'package:freezed_annotation/freezed_annotation.dart';

part 'themes.freezed.dart';
part 'themes.g.dart';

@freezed
abstract class Themes with _$Themes {
  const factory Themes({int? id, int? animeId, String? text}) = _Themes;

  factory Themes.fromJson(Map<String, dynamic> json) => _$ThemesFromJson(json);
}
