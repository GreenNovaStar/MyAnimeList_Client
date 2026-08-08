import 'package:android_app/data/exceptions/app_exception.dart';
import 'package:flutter/material.dart';

void showNovaErrorSnackbar(BuildContext context, Object error) {
  final String message = switch (error) {
    NovaNetworkException() =>
      'No internet connection. Please check your network and try again.',
    NovaAuthException() => 'Your session has expired. Please sign in again.',
    NovaForbiddenException() => 'You don\'t have permission to do that.',
    NovaNotFoundException() => 'That item could not be found.',
    NovaServerException() => 'MyAnimeList is having issues. Try again later.',
    NovaUnknownException() => 'Something went wrong. Please try again.',
    _ => 'Something went wrong. Please try again.',
  };

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      showCloseIcon: true,
    ),
  );
}
