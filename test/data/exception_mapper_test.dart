import 'package:android_app/data/exceptions/app_exception.dart';
import 'package:android_app/data/exceptions/exception_mapper.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

DioException _makeDioException({
  DioExceptionType type = DioExceptionType.badResponse,
  int? statusCode,
  String? message,
}) {
  return DioException(
    type: type,
    requestOptions: RequestOptions(path: '/test'),
    response: statusCode != null
        ? Response(
            statusCode: statusCode,
            requestOptions: RequestOptions(path: '/test'),
          )
        : null,
    message: message ?? 'test error',
  );
}

void main() {
  group('mapDioException', () {
    test('connection timeout maps to NovaNetworkException', () {
      final e = _makeDioException(type: DioExceptionType.connectionTimeout);
      expect(mapDioException(e, 'ctx'), isA<NovaNetworkException>());
    });

    test('receive timeout maps to NovaNetworkException', () {
      final e = _makeDioException(type: DioExceptionType.receiveTimeout);
      expect(mapDioException(e, 'ctx'), isA<NovaNetworkException>());
    });

    test('send timeout maps to NovaNetworkException', () {
      final e = _makeDioException(type: DioExceptionType.sendTimeout);
      expect(mapDioException(e, 'ctx'), isA<NovaNetworkException>());
    });

    test('connection error maps to NovaNetworkException', () {
      final e = _makeDioException(type: DioExceptionType.connectionError);
      expect(mapDioException(e, 'ctx'), isA<NovaNetworkException>());
    });

    test('401 maps to NovaAuthException', () {
      final e = _makeDioException(statusCode: 401);
      final result = mapDioException(e, 'ctx');
      expect(result, isA<NovaAuthException>());
      expect(result.statusCode, 401);
    });

    test('403 maps to NovaForbiddenException', () {
      final e = _makeDioException(statusCode: 403);
      final result = mapDioException(e, 'ctx');
      expect(result, isA<NovaForbiddenException>());
      expect(result.statusCode, 403);
    });

    test('404 maps to NovaNotFoundException', () {
      final e = _makeDioException(statusCode: 404);
      final result = mapDioException(e, 'ctx');
      expect(result, isA<NovaNotFoundException>());
      expect(result.statusCode, 404);
    });

    test('500 maps to NovaServerException', () {
      final e = _makeDioException(statusCode: 500);
      final result = mapDioException(e, 'ctx');
      expect(result, isA<NovaServerException>());
      expect(result.statusCode, 500);
    });

    test('502 maps to NovaServerException', () {
      final e = _makeDioException(statusCode: 502);
      final result = mapDioException(e, 'ctx');
      expect(result, isA<NovaServerException>());
    });

    test('unknown status code maps to NovaUnknownException', () {
      final e = _makeDioException(statusCode: 418);
      final result = mapDioException(e, 'ctx');
      expect(result, isA<NovaUnknownException>());
      expect(result.statusCode, 418);
    });

    test(
      'null status code with non-network type maps to NovaUnknownException',
      () {
        final e = _makeDioException(type: DioExceptionType.unknown);
        expect(mapDioException(e, 'ctx'), isA<NovaUnknownException>());
      },
    );

    test('context is included in message', () {
      final e = _makeDioException(statusCode: 404);
      final result = mapDioException(e, 'fetching anime 123');
      expect(result.message, contains('fetching anime 123'));
    });
  });
}
