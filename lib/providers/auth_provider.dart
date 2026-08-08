import 'package:android_app/data/model/token.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tokenProvider = StateProvider<OAuthToken?>((ref) => null);
