// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Data _$DataFromJson(Map<String, dynamic> json) => _Data(
  node: Node.fromJson(json['node'] as Map<String, dynamic>),
  ranking: json['ranking'] == null
      ? null
      : Ranking.fromJson(json['ranking'] as Map<String, dynamic>),
  listStatus: json['list_status'] == null
      ? null
      : MyListStatus.fromJson(json['list_status'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DataToJson(_Data instance) => <String, dynamic>{
  'node': instance.node.toJson(),
  'ranking': ?instance.ranking?.toJson(),
  'list_status': ?instance.listStatus?.toJson(),
};
