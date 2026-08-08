import 'package:android_app/providers/browse_provider.dart';
import 'package:android_app/ui/components/anime_list_row.dart';
import 'package:android_app/ui/components/nova/nova_empty_state.dart';
import 'package:android_app/ui/components/nova/nova_skeleton.dart';
import 'package:android_app/ui/screens/media_detail_screen.dart';
import 'package:android_app/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The full paginated list behind one home rail ("See all"): an
/// infinite-scrolling column of [AnimeListRow]s. Works for guests and
/// signed-in users (rows show list status when signed in).
class BrowseScreen extends ConsumerWidget {
  final BrowseSource source;

  const BrowseScreen({super.key, required this.source});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listAsync = ref.watch(browseProvider(source));

    return Scaffold(
      appBar: AppBar(title: Text(source.title)),
      body: listAsync.when(
        loading: () => _buildSkeleton(),
        error: (error, _) => NovaEmptyState(
          icon: Icons.cloud_off_rounded,
          message:
              "Couldn't load this list.\nCheck your connection and try again.",
          actionLabel: 'Retry',
          onAction: () => ref.invalidate(browseProvider(source)),
        ),
        data: (list) => _buildList(context, ref, list),
      ),
    );
  }

  Widget _buildSkeleton() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(
        horizontal: NovaSize.spaceSm,
        vertical: NovaSize.spaceSm,
      ),
      itemCount: 6,
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.symmetric(vertical: NovaSize.spaceXs),
        child: NovaSkeleton(width: double.infinity, height: 130),
      ),
    );
  }

  Widget _buildList(BuildContext context, WidgetRef ref, BrowseState list) {
    if (list.items.isEmpty) {
      return const NovaEmptyState(
        icon: Icons.search_off_rounded,
        message: 'Nothing here yet.',
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        // Fetch the next page as the user nears the bottom.
        if (list.hasMore &&
            notification.metrics.extentAfter < 600 &&
            notification is ScrollUpdateNotification) {
          ref.read(browseProvider(source).notifier).loadMore();
        }
        return false;
      },
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: NovaSize.spaceSm,
          vertical: NovaSize.spaceSm,
        ),
        itemCount: list.items.length + (list.hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index >= list.items.length) {
            return const Padding(
              padding: EdgeInsets.all(NovaSize.spaceMd),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          final item = list.items[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: NovaSize.spaceXs),
            child: AnimeListRow(
              data: item,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      MediaDetailScreen(data: item, kind: source.kind),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
