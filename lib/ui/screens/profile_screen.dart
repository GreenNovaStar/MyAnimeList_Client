import 'package:android_app/data/model/anime_statistics.dart';
import 'package:android_app/data/model/list_status_type.dart';
import 'package:android_app/data/model/user_profile.dart';
import 'package:android_app/providers/profile_provider.dart';
import 'package:android_app/ui/components/nova/nova_avatar.dart';
import 'package:android_app/ui/components/nova/nova_empty_state.dart';
import 'package:android_app/ui/components/nova/nova_skeleton.dart';
import 'package:android_app/utils/constants/size.dart';
import 'package:android_app/utils/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The signed-in user's profile: avatar/name header, a status-colored
/// breakdown bar of their anime list, and aggregate watch statistics.
/// MAL only exposes anime statistics (no manga equivalent), so the stats
/// section is anime-only regardless of the app's media mode.
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: profileAsync.when(
        loading: () => _buildSkeleton(),
        error: (error, _) => NovaEmptyState(
          icon: Icons.cloud_off_rounded,
          message:
              "Couldn't load your profile.\nCheck your connection and try again.",
          actionLabel: 'Retry',
          onAction: () => ref.invalidate(profileProvider),
        ),
        data: (profile) => profile == null
            ? const NovaEmptyState(
                icon: Icons.person_off_outlined,
                message: 'Sign in to see your profile.',
              )
            : _buildProfile(context, profile),
      ),
    );
  }

  Widget _buildSkeleton() {
    return const Padding(
      padding: EdgeInsets.all(NovaSize.spaceLg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: NovaSkeleton(width: 96, height: 96, radius: 48)),
          SizedBox(height: NovaSize.spaceMd),
          Center(child: NovaSkeleton(width: 140, height: 20)),
          SizedBox(height: NovaSize.spaceLg),
          NovaSkeleton(width: double.infinity, height: 12),
          SizedBox(height: NovaSize.spaceLg),
          NovaSkeleton(width: double.infinity, height: 80),
          SizedBox(height: NovaSize.spaceMd),
          NovaSkeleton(width: double.infinity, height: 80),
        ],
      ),
    );
  }

  Widget _buildProfile(BuildContext context, UserProfile profile) {
    final scheme = Theme.of(context).colorScheme;
    final stats = profile.animeStatistics;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(NovaSize.spaceLg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Identity header.
          NovaAvatar(imageUrl: profile.picture, name: profile.name, radius: 48),
          const SizedBox(height: NovaSize.spaceMd),
          Text(
            profile.name ?? 'User',
            textAlign: TextAlign.center,
            style: NovaType.headline.copyWith(color: scheme.onSurface),
          ),
          if (_memberLine(profile) case final String member) ...[
            const SizedBox(height: NovaSize.spaceXs),
            Text(
              member,
              textAlign: TextAlign.center,
              style: NovaType.caption.copyWith(color: scheme.onSurfaceVariant),
            ),
          ],

          if (stats != null) ...[
            const SizedBox(height: NovaSize.spaceLg),
            _AnimeListBreakdown(stats: stats),
            const SizedBox(height: NovaSize.spaceLg),
            Text(
              'Anime Stats',
              style: NovaType.headline.copyWith(color: scheme.onSurface),
            ),
            const SizedBox(height: NovaSize.spaceSm),
            _StatGrid(stats: stats),
          ],
        ],
      ),
    );
  }

  /// "Joined March 2020 · Tokyo" (whichever parts exist), or null.
  String? _memberLine(UserProfile profile) {
    final joined = DateTime.tryParse(profile.joinedAt ?? '');
    final parts = [
      if (joined != null) 'Joined ${_months[joined.month - 1]} ${joined.year}',
      if (profile.location != null && profile.location!.isNotEmpty)
        profile.location!,
    ];
    return parts.isEmpty ? null : parts.join(' · ');
  }

  static const _months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
}

/// A single stacked bar of the user's list by status (colored with the same
/// status palette as the list badges), with a count legend underneath.
class _AnimeListBreakdown extends StatelessWidget {
  final AnimeStatistics stats;

  const _AnimeListBreakdown({required this.stats});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final segments = [
      (AnimeListStatus.watching, stats.numItemsWatching ?? 0),
      (AnimeListStatus.completed, stats.numItemsCompleted ?? 0),
      (AnimeListStatus.onHold, stats.numItemsOnHold ?? 0),
      (AnimeListStatus.dropped, stats.numItemsDropped ?? 0),
      (AnimeListStatus.planToWatch, stats.numItemsPlanToWatch ?? 0),
    ];
    final total = segments.fold(0, (sum, s) => sum + s.$2);
    if (total == 0) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$total anime',
          style: NovaType.label.copyWith(color: scheme.onSurfaceVariant),
        ),
        const SizedBox(height: NovaSize.spaceSm),
        ClipRRect(
          borderRadius: BorderRadius.circular(NovaSize.radiusPill),
          child: SizedBox(
            height: 12,
            child: Row(
              children: [
                for (final (status, count) in segments)
                  if (count > 0)
                    Expanded(
                      flex: count,
                      child: ColoredBox(color: status.color),
                    ),
              ],
            ),
          ),
        ),
        const SizedBox(height: NovaSize.spaceSm),
        Wrap(
          spacing: NovaSize.spaceMd,
          runSpacing: NovaSize.spaceXs,
          children: [
            for (final (status, count) in segments)
              if (count > 0)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: status.color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: NovaSize.spaceXs),
                    Text(
                      '${status.label} $count',
                      style: NovaType.caption.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
          ],
        ),
      ],
    );
  }
}

/// Two-column grid of aggregate stats (days watched, episodes, mean score...).
class _StatGrid extends StatelessWidget {
  final AnimeStatistics stats;

  const _StatGrid({required this.stats});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final entries = <(String, String)>[
      if (stats.numEpisodes != null) ('Episodes', '${stats.numEpisodes}'),
      if (stats.numDaysWatched != null)
        ('Days Watched', stats.numDaysWatched!.toStringAsFixed(1)),
      if (stats.meanScore != null && stats.meanScore! > 0)
        ('Mean Score', stats.meanScore!.toStringAsFixed(2)),
      if (stats.numTimesRewatched != null && stats.numTimesRewatched! > 0)
        ('Rewatched', '${stats.numTimesRewatched}'),
    ];
    if (entries.isEmpty) return const SizedBox.shrink();

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: NovaSize.spaceSm,
      crossAxisSpacing: NovaSize.spaceSm,
      childAspectRatio: 2.4,
      children: [
        for (final (label, value) in entries)
          Container(
            padding: const EdgeInsets.all(NovaSize.spaceMd),
            decoration: BoxDecoration(
              color: scheme.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(NovaSize.radiusTile),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value,
                  style: NovaType.title.copyWith(color: scheme.onSurface),
                ),
                Text(
                  label,
                  style: NovaType.caption.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
