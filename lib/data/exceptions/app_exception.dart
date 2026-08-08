/// Base exception for all app-level errors.
sealed class NovaException implements Exception {
  final String message;
  final int? statusCode;
  const NovaException(this.message, {this.statusCode});

  @override
  String toString() => '$runtimeType: $message';
}

/// A network-level failure (no connectivity, timeout, DNS).
class NovaNetworkException extends NovaException {
  const NovaNetworkException(super.message);
}

/// The user's token is invalid, expired, or missing (HTTP 401).
class NovaAuthException extends NovaException {
  const NovaAuthException(super.message) : super(statusCode: 401);
}

/// The server understood the request but refuses to authorize it (HTTP 403).
class NovaForbiddenException extends NovaException {
  const NovaForbiddenException(super.message) : super(statusCode: 403);
}

/// The requested resource does not exist (HTTP 404).
class NovaNotFoundException extends NovaException {
  const NovaNotFoundException(super.message) : super(statusCode: 404);
}

/// A server-side error (HTTP 5xx).
class NovaServerException extends NovaException {
  const NovaServerException(super.message, {super.statusCode});
}

/// A catch-all for unexpected failures that don't fit the above.
class NovaUnknownException extends NovaException {
  const NovaUnknownException(super.message, {super.statusCode});
}
