import 'package:android_app/data/api/myanimelist/base_client.dart';
import 'package:android_app/data/api/myanimelist/guest_client.dart';
import 'package:android_app/data/api/myanimelist/user_client.dart';
import 'package:android_app/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final malClientProvider = Provider<MALBaseClient>((ref) {
  final token = ref.watch(tokenProvider);
  if (token != null) {
    return MALUserClient(token: token);
  }
  return MALGuestClient();
});
