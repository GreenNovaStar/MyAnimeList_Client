// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Genres _$GenresFromJson(Map<String, dynamic> json) =>
    _Genres(id: (json['id'] as num?)?.toInt(), name: json['name'] as String?);

Map<String, dynamic> _$GenresToJson(_Genres instance) => <String, dynamic>{
  'id': ?instance.id,
  'name': ?instance.name,
};
