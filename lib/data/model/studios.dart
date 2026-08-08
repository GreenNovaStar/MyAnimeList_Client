import 'package:freezed_annotation/freezed_annotation.dart';

part 'studios.freezed.dart';
part 'studios.g.dart';

@freezed
abstract class Studios with _$Studios {
  const factory Studios({int? id, String? name}) = _Studios;

  factory Studios.fromJson(Map<String, dynamic> json) =>
      _$StudiosFromJson(json);
}
