// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Ranking _$RankingFromJson(Map<String, dynamic> json) => _Ranking(
  rank: (json['rank'] as num).toInt(),
  previousRank: (json['previous_rank'] as num?)?.toInt(),
);

Map<String, dynamic> _$RankingToJson(_Ranking instance) => <String, dynamic>{
  'rank': instance.rank,
  'previous_rank': ?instance.previousRank,
};
