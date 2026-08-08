import 'package:android_app/data/api/myanimelist/base_client.dart';
import 'package:android_app/utils/env_helper.dart';
import 'package:dio/dio.dart';

/// Unauthenticated MAL client: identifies the app via the client-id header.
/// All endpoints come from [MALBaseClient]; the API just omits user-specific
/// response fields (e.g. list_status) for unauthenticated requests.
class MALGuestClient extends MALBaseClient {
  MALGuestClient() {
    options = Options(headers: {"X-MAL-CLIENT-ID": getEnv("CLIENT_ID")});
  }
}
