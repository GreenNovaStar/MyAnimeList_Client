import 'package:android_app/utils/constants/size.dart';
import 'package:flutter/material.dart';

/// A pulsing placeholder box shown while content loads.
///
/// Self-contained (no shimmer package): a looping opacity pulse over a
/// theme-derived neutral fill. Compose these to mirror the shape of the
/// content that's loading (see [NovaRailSkeleton]).
class NovaSkeleton extends StatefulWidget {
  final double? width;
  final double? height;
  final double radius;

  const NovaSkeleton({
    super.key,
    this.width,
    this.height,
    this.radius = NovaSize.radiusBadge,
  });

  @override
  State<NovaSkeleton> createState() => _NovaSkeletonState();
}

class _NovaSkeletonState extends State<NovaSkeleton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color base = Theme.of(context).colorScheme.onSurface;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // Pulse between subtle and slightly stronger tints of the surface.
        final double opacity = 0.06 + (_controller.value * 0.08);
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: base.withValues(alpha: opacity),
            borderRadius: BorderRadius.circular(widget.radius),
          ),
        );
      },
    );
  }
}

/// A loading placeholder shaped like an [AnimeRail]: a short title bar above a
/// horizontal row of tile-shaped skeletons. Drop-in for a rail's loading state.
class NovaRailSkeleton extends StatelessWidget {
  /// How many placeholder tiles to show.
  final int tileCount;

  const NovaRailSkeleton({super.key, this.tileCount = 4});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title bar placeholder.
        const Padding(
          padding: EdgeInsets.fromLTRB(
            NovaSize.spaceMd,
            NovaSize.spaceMd,
            NovaSize.spaceMd,
            NovaSize.spaceSm,
          ),
          child: NovaSkeleton(width: 140, height: 20),
        ),
        // Row of tile placeholders (no scroll physics — purely decorative).
        SizedBox(
          height: NovaSize.railHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: NovaSize.spaceSm),
            itemCount: tileCount,
            itemBuilder: (context, index) => const Padding(
              padding: EdgeInsets.all(NovaSize.spaceXs),
              child: NovaSkeleton(
                width: NovaSize.railTileWidth,
                height: NovaSize.railTileHeight,
                radius: NovaSize.radiusTile,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
