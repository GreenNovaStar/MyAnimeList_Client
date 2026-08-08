import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre.freezed.dart';
part 'genre.g.dart';

@freezed
abstract class Genres with _$Genres {
  const factory Genres({int? id, String? name}) = _Genres;

  factory Genres.fromJson(Map<String, dynamic> json) => _$GenresFromJson(json);
}
