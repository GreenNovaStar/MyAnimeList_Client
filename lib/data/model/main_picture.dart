import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_picture.freezed.dart';
part 'main_picture.g.dart';

@freezed
abstract class Picture with _$Picture {
  const factory Picture({String? medium, String? large}) = _Picture;

  factory Picture.fromJson(Map<String, dynamic> json) =>
      _$PictureFromJson(json);
}
