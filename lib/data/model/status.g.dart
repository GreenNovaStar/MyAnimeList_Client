// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StatusDistribution _$StatusDistributionFromJson(Map<String, dynamic> json) =>
    _StatusDistribution(
      watching: json['watching'] as String?,
      completed: json['completed'] as String?,
      onHold: json['on_hold'] as String?,
      dropped: json['dropped'] as String?,
      planToWatch: json['plan_to_watch'] as String?,
    );

Map<String, dynamic> _$StatusDistributionToJson(_StatusDistribution instance) =>
    <String, dynamic>{
      'watching': ?instance.watching,
      'completed': ?instance.completed,
      'on_hold': ?instance.onHold,
      'dropped': ?instance.dropped,
      'plan_to_watch': ?instance.planToWatch,
    };
