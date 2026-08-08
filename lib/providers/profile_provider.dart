import 'package:android_app/data/api/myanimelist/user_client.dart';
import 'package:android_app/data/model/user_profile.dart';
import 'package:android_app/providers/client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileProvider = FutureProvider.autoDispose<UserProfile?>((ref) async {
  final client = ref.watch(malClientProvider);
  if (client is! MALUserClient) return null;
  return client.getMyUserProfile();
});
