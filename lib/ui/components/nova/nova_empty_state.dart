import 'package:android_app/utils/constants/size.dart';
import 'package:android_app/utils/constants/typography.dart';
import 'package:flutter/material.dart';

/// A centered icon + message with an optional action button, for error and
/// empty-result states. Theme-styled (adapts to light/dark) rather than
/// dumping raw error text.
class NovaEmptyState extends StatelessWidget {
  final IconData icon;
  final String message;

  /// Optional action (e.g. "Retry"). When both are provided a button shows.
  final String? actionLabel;
  final VoidCallback? onAction;

  const NovaEmptyState({
    super.key,
    required this.icon,
    required this.message,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(NovaSize.spaceLg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 48, color: scheme.onSurfaceVariant),
            const SizedBox(height: NovaSize.spaceMd),
            Text(
              message,
              textAlign: TextAlign.center,
              style: NovaType.body.copyWith(color: scheme.onSurfaceVariant),
            ),
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: NovaSize.spaceLg),
              FilledButton.tonal(
                onPressed: onAction,
                child: Text(actionLabel!),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
