import 'dart:developer';

import 'package:android_app/utils/constants/size.dart';
import 'package:android_app/utils/constants/typography.dart';
import 'package:flutter/material.dart';

class NovaErrorBoundary extends StatefulWidget {
  final Widget child;
  const NovaErrorBoundary({super.key, required this.child});

  @override
  State<NovaErrorBoundary> createState() => _NovaErrorBoundaryState();
}

class _NovaErrorBoundaryState extends State<NovaErrorBoundary> {
  bool _hasError = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _hasError = false;
  }

  void _retry() {
    setState(() => _hasError = false);
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      return NovaErrorFallback(onRetry: _retry);
    }

    return widget.child;
  }
}

class NovaErrorFallback extends StatelessWidget {
  final VoidCallback? onRetry;
  const NovaErrorFallback({super.key, this.onRetry});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(NovaSize.spaceLg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline_rounded, size: 48, color: scheme.error),
            const SizedBox(height: NovaSize.spaceMd),
            Text(
              'Something went wrong',
              style: NovaType.headline.copyWith(color: scheme.onSurface),
            ),
            const SizedBox(height: NovaSize.spaceSm),
            Text(
              'An unexpected error occurred.\nTap below to recover.',
              textAlign: TextAlign.center,
              style: NovaType.body.copyWith(color: scheme.onSurfaceVariant),
            ),
            const SizedBox(height: NovaSize.spaceLg),
            if (onRetry != null)
              FilledButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh_rounded),
                label: const Text('Retry'),
              )
            else
              Builder(
                builder: (ctx) {
                  final navigator = Navigator.maybeOf(ctx);
                  if (navigator != null && navigator.canPop()) {
                    return FilledButton.icon(
                      onPressed: () => navigator.pop(),
                      icon: const Icon(Icons.arrow_back_rounded),
                      label: const Text('Go Back'),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
          ],
        ),
      ),
    );
  }
}

void setupErrorHandling() {
  FlutterError.onError = (details) {
    log(
      'Flutter error: ${details.exceptionAsString()}',
      error: details.exception,
      stackTrace: details.stack,
    );
    FlutterError.presentError(details);
  };

  ErrorWidget.builder = (FlutterErrorDetails details) {
    return const Material(child: NovaErrorFallback());
  };
}
