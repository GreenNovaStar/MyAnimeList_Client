import 'package:android_app/data/api/myanimelist/base_client.dart';
import 'package:android_app/data/api/myanimelist/profile_api.dart';
import 'package:android_app/data/api/myanimelist/user_list_api.dart';
import 'package:android_app/data/model/token.dart';
import 'package:dio/dio.dart';

/// Authenticated MAL client: sends the user's OAuth bearer token, which makes
/// the API include user-specific fields (list_status) and unlocks the
/// list-mutation and profile endpoints in [UserListApi] and [ProfileApi].
class MALUserClient extends MALBaseClient with UserListApi, ProfileApi {
  OAuthToken token;
  MALUserClient({required this.token}) {
    options = Options(
      headers: {"Authorization": "Bearer ${token.accessToken}"},
    );
  }
}
