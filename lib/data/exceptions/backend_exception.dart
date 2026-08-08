import 'dart:io';

class BackendException implements Exception {
  int statusCode = HttpStatus.internalServerError;
  String message;
  StackTrace? stackTrace;

  BackendException({required this.message, this.stackTrace});

  @override
  String toString() {
    return 'Backend exception caught for $message\n$stackTrace';
  }
}
