import 'package:android_app/utils/constants/color.dart';
import 'package:flutter/material.dart';

/// A gradient overlay that darkens one edge of poster art so overlaid text and
/// chips stay legible. Defaults to a bottom-up transparent → dark fade.
class NovaScrim extends StatelessWidget {
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final List<Color> colors;

  const NovaScrim({
    super.key,
    this.begin = Alignment.center,
    this.end = Alignment.bottomCenter,
    this.colors = const [Colors.transparent, NovaColors.scrimGradientEnd],
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: begin, end: end, colors: colors),
      ),
    );
  }
}
