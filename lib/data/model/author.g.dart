// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Author _$AuthorFromJson(Map<String, dynamic> json) => _Author(
  node: json['node'] == null
      ? null
      : Node.fromJson(json['node'] as Map<String, dynamic>),
  role: json['role'] as String?,
);

Map<String, dynamic> _$AuthorToJson(_Author instance) => <String, dynamic>{
  'node': ?instance.node?.toJson(),
  'role': ?instance.role,
};
