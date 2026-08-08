import 'package:android_app/data/exceptions/app_exception.dart';
import 'package:dio/dio.dart';

/// Maps a [DioException] to the appropriate [NovaException] subtype.
NovaException mapDioException(DioException e, String context) {
  final statusCode = e.response?.statusCode;

  if (e.type == DioExceptionType.connectionTimeout ||
      e.type == DioExceptionType.receiveTimeout ||
      e.type == DioExceptionType.sendTimeout ||
      e.type == DioExceptionType.connectionError) {
    return NovaNetworkException('$context: ${e.message}');
  }

  if (statusCode == null) {
    return NovaUnknownException('$context: ${e.message}');
  }

  return switch (statusCode) {
    401 => NovaAuthException('$context: unauthorized'),
    403 => NovaForbiddenException('$context: forbidden'),
    404 => NovaNotFoundException('$context: not found'),
    >= 500 => NovaServerException(
      '$context: server error ($statusCode)',
      statusCode: statusCode,
    ),
    _ => NovaUnknownException('$context: ${e.message}', statusCode: statusCode),
  };
}
