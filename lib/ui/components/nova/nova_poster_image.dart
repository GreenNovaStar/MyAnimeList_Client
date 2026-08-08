import 'package:android_app/utils/constants/color.dart';
import 'package:flutter/material.dart';

/// A network image sized to fill its parent with a consistent placeholder
/// on error. Use inside a Stack or constrained box for poster art.
class NovaPosterImage extends StatelessWidget {
  final String url;
  final BoxFit fit;
  final Alignment alignment;

  const NovaPosterImage({
    super.key,
    required this.url,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.topCenter,
  });

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) return _placeholder();

    return Image.network(
      url,
      fit: fit,
      alignment: alignment,
      errorBuilder: (_, _, _) => _placeholder(),
    );
  }

  Widget _placeholder() {
    return Container(
      color: NovaColors.placeholderBg,
      alignment: Alignment.center,
      child: const Icon(
        Icons.image_not_supported_outlined,
        color: NovaColors.onScrimMuted,
      ),
    );
  }
}
