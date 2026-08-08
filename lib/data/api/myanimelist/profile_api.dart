import 'package:android_app/data/api/myanimelist/base_client.dart';
import 'package:android_app/data/model/media_list.dart';
import 'package:android_app/data/model/user_profile.dart';

mixin ProfileApi on MALBaseClient {
  Future<UserProfile> getMyUserProfile() {
    return getAndParse(
      "/users/@me",
      UserProfile.fromJson,
      query: {"fields": MALBaseClient.userProfileFields},
      action: "Fetch your profile",
    );
  }

  Future<MediaList> getAnimeSuggestions({int limit = 20, int offset = 0}) {
    return getAndParse(
      "/anime/suggestions",
      MediaList.fromJson,
      query: {
        "limit": limit,
        "offset": offset,
        "fields": MALBaseClient.listFields,
      },
      action: "Fetch suggestions",
    );
  }
}
