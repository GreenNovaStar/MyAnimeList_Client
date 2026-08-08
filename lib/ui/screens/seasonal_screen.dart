import 'package:android_app/data/model/anime_season.dart';
import 'package:android_app/data/model/media_kind.dart';
import 'package:android_app/data/model/month.dart';
import 'package:android_app/providers/seasonal_provider.dart';
import 'package:android_app/ui/components/anime_list_row.dart';
import 'package:android_app/ui/components/nova/nova_choice_chip.dart';
import 'package:android_app/ui/components/nova/nova_empty_state.dart';
import 'package:android_app/ui/components/nova/nova_skeleton.dart';
import 'package:android_app/ui/screens/media_detail_screen.dart';
import 'package:android_app/utils/constants/size.dart';
import 'package:android_app/utils/extension_methods/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// MAL's oldest seasonal data is early 20th century, but browsing that far
/// back is noise; anything before this is reachable via search instead.
const int _firstYear = 1970;

/// Browse anime by season: a year dropdown + season chips over an
/// infinite-scrolling list of that season's shows (most popular first).
/// Opens on the current season; results are cached per (year, season) so
/// flipping between seasons is instant after the first load.
class SeasonalScreen extends ConsumerStatefulWidget {
  /// Where the picker starts, defaulting to the current season.
  final int? initialYear;
  final AnimeSeason? initialSeason;

  const SeasonalScreen({super.key, this.initialYear, this.initialSeason});

  @override
  ConsumerState<SeasonalScreen> createState() => _SeasonalScreenState();
}

class _SeasonalScreenState extends ConsumerState<SeasonalScreen> {
  late int _year;
  late AnimeSeason _season;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _year = widget.initialYear ?? now.year;
    _season = widget.initialSeason ?? Month.fromDateTime(now).season;
  }

  SeasonKey get _key => (year: _year, season: _season.value);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    // Next year is browsable: upcoming seasons are announced well ahead.
    final years = [for (var y = now.year + 1; y >= _firstYear; y--) y];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Seasons'),
        actions: [
          DropdownButton<int>(
            value: _year,
            underline: const SizedBox.shrink(),
            items: [
              for (final year in years)
                DropdownMenuItem(value: year, child: Text('$year')),
            ],
            onChanged: (year) {
              if (year != null) setState(() => _year = year);
            },
          ),
          const SizedBox(width: NovaSize.spaceMd),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: NovaSize.spaceMd,
              vertical: NovaSize.spaceSm,
            ),
            child: Row(
              children: [
                for (final season in AnimeSeason.values) ...[
                  NovaChoiceChip(
                    label: season.value.prettifyString(),
                    selected: _season == season,
                    onSelected: () => setState(() => _season = season),
                  ),
                  const SizedBox(width: NovaSize.spaceSm),
                ],
              ],
            ),
          ),
        ),
      ),
      body: _SeasonList(seasonKey: _key),
    );
  }
}

/// One season's list: skeleton -> error -> infinite-scrolling rows.
class _SeasonList extends ConsumerWidget {
  final SeasonKey seasonKey;

  const _SeasonList({required this.seasonKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listAsync = ref.watch(seasonalProvider(seasonKey));

    return listAsync.when(
      loading: () => ListView.builder(
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
      ),
      error: (error, _) => NovaEmptyState(
        icon: Icons.cloud_off_rounded,
        message:
            "Couldn't load this season.\nCheck your connection and try again.",
        actionLabel: 'Retry',
        onAction: () => ref.invalidate(seasonalProvider(seasonKey)),
      ),
      data: (list) => _buildList(context, ref, list),
    );
  }

  Widget _buildList(BuildContext context, WidgetRef ref, SeasonalState list) {
    if (list.items.isEmpty) {
      return const NovaEmptyState(
        icon: Icons.search_off_rounded,
        message: 'Nothing found for this season.',
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        // Fetch the next page as the user nears the bottom.
        if (list.hasMore &&
            notification.metrics.extentAfter < 600 &&
            notification is ScrollUpdateNotification) {
          ref.read(seasonalProvider(seasonKey).notifier).loadMore();
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
                      MediaDetailScreen(data: item, kind: MediaKind.anime),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
