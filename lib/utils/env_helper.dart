import 'package:flutter_dotenv/flutter_dotenv.dart';

String getEnv(String key) {
  return dotenv.env[key] ?? "";
}
