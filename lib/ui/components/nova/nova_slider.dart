import 'package:android_app/utils/constants/size.dart';
import 'package:android_app/utils/constants/typography.dart';
import 'package:flutter/material.dart';

/// A labeled slider following the Nova design language.
///
/// Displays a [label] on the left, the slider track in the middle, and a
/// [suffix] value on the right. When [divisions] is provided, the slider snaps
/// to discrete steps and shows a tooltip with the current value while dragging.
class NovaSlider extends StatelessWidget {
  final String label;
  final double value;
  final double min;
  final double max;
  final int? divisions;
  final String? valueLabel;
  final String suffix;
  final double step;
  final ValueChanged<double> onChanged;

  const NovaSlider({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.min = 0,
    this.max = 10,
    this.divisions,
    this.valueLabel,
    this.suffix = '',
    this.step = 1,
  });

  Widget _stepButton({
    required IconData icon,
    required bool enabled,
    required VoidCallback onPressed,
    required ColorScheme scheme,
  }) {
    return GestureDetector(
      onTap: enabled ? onPressed : null,
      child: Icon(
        icon,
        size: 20,
        color: enabled
            ? scheme.onSurfaceVariant
            : scheme.outline.withValues(alpha: 0.4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: NovaType.label.copyWith(color: scheme.onSurfaceVariant),
            ),
            const SizedBox(width: NovaSize.spaceSm),
            Text(
              suffix.isNotEmpty ? suffix : (valueLabel ?? ''),
              style: NovaType.body.copyWith(color: scheme.onSurface),
            ),
          ],
        ),
        const SizedBox(height: NovaSize.spaceXs),
        Row(
          children: [
            _stepButton(
              icon: Icons.remove,
              enabled: value > min,
              onPressed: () => onChanged((value - step).clamp(min, max)),
              scheme: scheme,
            ),
            Expanded(
              child: SliderTheme(
                data: SliderThemeData(
                  activeTrackColor: scheme.primary,
                  inactiveTrackColor: scheme.surfaceContainerHighest,
                  thumbColor: scheme.primary,
                  overlayColor: scheme.primary.withValues(alpha: 0.12),
                  valueIndicatorColor: scheme.inverseSurface,
                  valueIndicatorTextStyle: NovaType.label.copyWith(
                    color: scheme.onInverseSurface,
                  ),
                  trackHeight: 4,
                  thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 8,
                  ),
                ),
                child: Slider(
                  value: value,
                  min: min,
                  max: max,
                  divisions: divisions,
                  label: valueLabel,
                  onChanged: onChanged,
                ),
              ),
            ),
            _stepButton(
              icon: Icons.add,
              enabled: value < max,
              onPressed: () => onChanged((value + step).clamp(min, max)),
              scheme: scheme,
            ),
          ],
        ),
      ],
    );
  }
}
