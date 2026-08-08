// ignore_for_file: constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_type.freezed.dart';
part 'user_type.g.dart';

/// Wraps the persisted user-type string. The [ADMIN]/[GUEST]/[USER] constants
/// are the valid values; [userType] holds the current one.
@freezed
abstract class UserType with _$UserType {
  const factory UserType({required String userType}) = _UserType;

  factory UserType.fromJson(Map<String, dynamic> json) =>
      _$UserTypeFromJson(json);

  static const String ADMIN = "ADMIN";
  static const String FIRST_TIME = "";
  static const String GUEST = "GUEST";
  static const String USER = "USER";
}
