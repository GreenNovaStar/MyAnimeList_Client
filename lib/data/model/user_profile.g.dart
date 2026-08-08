// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => _UserProfile(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  picture: json['picture'] as String?,
  gender: json['gender'] as String?,
  birthday: json['birthday'] as String?,
  location: json['location'] as String?,
  joinedAt: json['joined_at'] as String?,
  timeZone: json['time_zone'] as String?,
  isSupporter: json['is_supporter'] as bool?,
  animeStatistics: json['anime_statistics'] == null
      ? null
      : AnimeStatistics.fromJson(
          json['anime_statistics'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$UserProfileToJson(_UserProfile instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'name': ?instance.name,
      'picture': ?instance.picture,
      'gender': ?instance.gender,
      'birthday': ?instance.birthday,
      'location': ?instance.location,
      'joined_at': ?instance.joinedAt,
      'time_zone': ?instance.timeZone,
      'is_supporter': ?instance.isSupporter,
      'anime_statistics': ?instance.animeStatistics?.toJson(),
    };
