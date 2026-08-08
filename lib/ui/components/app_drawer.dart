import 'package:android_app/data/auth/authentication.dart';
import 'package:android_app/data/model/media_kind.dart';
import 'package:android_app/data/model/user_profile.dart';
import 'package:android_app/providers/media_mode_provider.dart';
import 'package:android_app/providers/profile_provider.dart';
import 'package:android_app/providers/title_language_provider.dart';
import 'package:android_app/ui/components/nova/nova_avatar.dart';
import 'package:android_app/ui/components/nova/nova_skeleton.dart';
import 'package:android_app/ui/screens/landing_page.dart';
import 'package:android_app/ui/screens/my_list_screen.dart';
import 'package:android_app/ui/screens/profile_screen.dart';
import 'package:android_app/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final profileAsync = ref.watch(profileProvider);
    final mode = ref.watch(mediaModeProvider);

    return Drawer(
      child: Column(
        children: [
          profileAsync.when(
            loading: () => _buildHeaderSkeleton(scheme),
            error: (_, _) => _buildHeaderFallback(scheme),
            data: (profile) => profile != null
                ? _buildHeader(scheme, profile)
                : _buildHeaderFallback(scheme),
          ),
          const SizedBox(height: NovaSize.spaceSm),
          ListTile(
            leading: Icon(
              mode == MediaKind.anime
                  ? Icons.movie_outlined
                  : Icons.menu_book_outlined,
            ),
            title: Text(
              mode == MediaKind.anime ? "My Anime List" : "My Manga List",
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyListScreen(kind: mode),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text("Profile"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
          const Spacer(),
          const Divider(),
          SwitchListTile(
            secondary: const Icon(Icons.translate),
            title: const Text("English titles"),
            value: ref.watch(preferEnglishTitlesProvider),
            onChanged: (v) =>
                ref.read(preferEnglishTitlesProvider.notifier).set(v),
          ),
          ListTile(
            leading: Icon(Icons.logout, color: scheme.error),
            title: Text("Sign out", style: TextStyle(color: scheme.error)),
            onTap: () async {
              await signOut(context);
              if (context.mounted) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LandingPage()),
                );
              }
            },
          ),
          const SizedBox(height: NovaSize.spaceMd),
        ],
      ),
    );
  }

  Widget _buildHeader(ColorScheme scheme, UserProfile profile) {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(color: scheme.primaryContainer),
      currentAccountPicture: NovaAvatar(
        imageUrl: profile.picture,
        name: profile.name,
        radius: 36,
      ),
      accountName: Text(
        profile.name ?? "User",
        style: TextStyle(color: scheme.onPrimaryContainer),
      ),
      accountEmail: profile.animeStatistics != null
          ? Text(
              "${profile.animeStatistics!.numItemsCompleted ?? 0} completed · "
              "${profile.animeStatistics!.numItemsWatching ?? 0} watching",
              style: TextStyle(
                color: scheme.onPrimaryContainer.withValues(alpha: 0.7),
              ),
            )
          : null,
    );
  }

  Widget _buildHeaderSkeleton(ColorScheme scheme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(
        NovaSize.spaceLg,
        56,
        NovaSize.spaceLg,
        NovaSize.spaceLg,
      ),
      color: scheme.primaryContainer,
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NovaSkeleton(width: 72, height: 72, radius: 36),
            const SizedBox(height: NovaSize.spaceMd),
            NovaSkeleton(width: 120, height: 16, radius: NovaSize.radiusBadge),
            const SizedBox(height: NovaSize.spaceSm),
            NovaSkeleton(width: 180, height: 14, radius: NovaSize.radiusBadge),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderFallback(ColorScheme scheme) {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(color: scheme.primaryContainer),
      currentAccountPicture: const NovaAvatar(radius: 36),
      accountName: Text(
        "User",
        style: TextStyle(color: scheme.onPrimaryContainer),
      ),
      accountEmail: null,
    );
  }
}
