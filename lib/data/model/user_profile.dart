import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:android_app/data/model/anime_statistics.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

/// The signed-in user's profile, returned by `GET /users/@me`.
/// Note: [picture] is a plain URL string, not a Picture object.
@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    int? id,
    String? name,
    String? picture,
    String? gender,
    String? birthday,
    String? location,
    String? joinedAt,
    String? timeZone,
    bool? isSupporter,
    AnimeStatistics? animeStatistics,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
