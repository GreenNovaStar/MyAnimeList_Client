import 'package:android_app/utils/constants/size.dart';
import 'package:android_app/utils/constants/typography.dart';
import 'package:flutter/material.dart';

/// A selectable chip that follows the Nova design language.
///
/// When [selected] is false it renders as an outlined chip (like
/// [NovaChip.outlined]). When selected, it fills with the primary color.
class NovaChoiceChip extends StatelessWidget {
  final String label;
  final bool selected;
  final Color? color;
  final VoidCallback onSelected;

  const NovaChoiceChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onSelected,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final Color activeColor = color ?? scheme.primary;
    final Color bg = selected ? activeColor : Colors.transparent;
    final Color fg = selected ? Colors.white : scheme.onSurfaceVariant;
    final Border? border = selected ? null : Border.all(color: scheme.outline);

    return GestureDetector(
      onTap: onSelected,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(
          horizontal: NovaSize.spaceMd,
          vertical: NovaSize.spaceXs,
        ),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(NovaSize.radiusPill),
          border: border,
        ),
        child: Text(label, style: NovaType.label.copyWith(color: fg)),
      ),
    );
  }
}
