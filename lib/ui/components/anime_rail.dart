import 'package:android_app/data/model/data.dart';
import 'package:android_app/ui/components/anime_tile.dart';
import 'package:android_app/ui/components/nova/nova_section_header.dart';
import 'package:android_app/utils/constants/size.dart';
import 'package:flutter/material.dart';

/// A titled horizontal rail of anime poster tiles. Reusable across every
/// discovery category (Trending, Seasonal, Airing, Upcoming, Popular, ...).
class AnimeRail extends StatelessWidget {
  final String title;
  final List<Data> items;
  final void Function(Data data)? onTap;

  /// Shows a "See all" action in the header when set.
  final VoidCallback? onSeeAll;

  const AnimeRail({
    super.key,
    required this.title,
    required this.items,
    this.onTap,
    this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NovaSectionHeader(
          title: title,
          trailing: onSeeAll != null
              ? TextButton(onPressed: onSeeAll, child: const Text('See all'))
              : null,
        ),
        SizedBox(
          height: NovaSize.railHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: NovaSize.spaceSm),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final Data animeData = items[index];
              return AnimeTile(
                animeData: animeData,
                onPressed: onTap == null ? null : () => onTap!(animeData),
              );
            },
          ),
        ),
      ],
    );
  }
}
