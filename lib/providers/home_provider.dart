import 'package:android_app/data/api/myanimelist/user_client.dart';
import 'package:android_app/data/model/anime_ranking.dart';
import 'package:android_app/data/model/anime_seasonal.dart';
import 'package:android_app/data/model/media_list.dart';
import 'package:android_app/data/model/ranking_type.dart';
import 'package:android_app/providers/client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// One provider per home rail, so each rail loads, fails, and retries
/// independently: invalidating one refetches only that rail, and the body
/// shows a per-rail error state instead of failing the whole screen.

// Anime rails.

final trendingAnimeProvider = FutureProvider.autoDispose<AnimeRanking>((ref) {
  final client = ref.watch(malClientProvider);
  return client.getAnimeRanking(AnimeRankingType.trend);
});

final currentSeasonAnimeProvider = FutureProvider.autoDispose<AnimeSeasonal>((
  ref,
) {
  final client = ref.watch(malClientProvider);
  return client.getCurrentSeasonAnimes();
});

final nextSeasonAnimeProvider = FutureProvider.autoDispose<AnimeSeasonal>((
  ref,
) {
  final client = ref.watch(malClientProvider);
  return client.getNextSeasonAnimes();
});

final popularAnimeProvider = FutureProvider.autoDispose<AnimeRanking>((ref) {
  final client = ref.watch(malClientProvider);
  return client.getAnimeRanking(AnimeRankingType.bypopularity);
});

/// Null for guests (no personalized suggestions without a signed-in user).
final animeSuggestionsProvider = FutureProvider.autoDispose<MediaList?>((
  ref,
) async {
  final client = ref.watch(malClientProvider);
  if (client is! MALUserClient) return null;
  return client.getAnimeSuggestions();
});

// Manga rails. MAL has no manga seasonal or suggestions endpoints, so the
// manga home is ranking-based: one provider-family instance per ranking type.

final mangaRankingProvider = FutureProvider.autoDispose
    .family<MediaList, MangaRankingType>((ref, rankingType) {
      final client = ref.watch(malClientProvider);
      return client.getMangaRanking(rankingType);
    });
