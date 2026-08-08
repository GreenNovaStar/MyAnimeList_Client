// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Statistics _$StatisticsFromJson(Map<String, dynamic> json) => _Statistics(
  status: json['status'] == null
      ? null
      : StatusDistribution.fromJson(json['status'] as Map<String, dynamic>),
  numListUsers: (json['num_list_users'] as num?)?.toInt(),
);

Map<String, dynamic> _$StatisticsToJson(_Statistics instance) =>
    <String, dynamic>{
      'status': ?instance.status?.toJson(),
      'num_list_users': ?instance.numListUsers,
    };
