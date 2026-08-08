// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Recommendations _$RecommendationsFromJson(Map<String, dynamic> json) =>
    _Recommendations(
      node: json['node'] == null
          ? null
          : Node.fromJson(json['node'] as Map<String, dynamic>),
      numRecommendations: (json['num_recommendations'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RecommendationsToJson(_Recommendations instance) =>
    <String, dynamic>{
      'node': ?instance.node?.toJson(),
      'num_recommendations': ?instance.numRecommendations,
    };
