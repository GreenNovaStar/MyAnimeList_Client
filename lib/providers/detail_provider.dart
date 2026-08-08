import 'package:android_app/data/model/anime_details.dart';
import 'package:android_app/data/model/manga_details.dart';
import 'package:android_app/providers/client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final animeDetailProvider = FutureProvider.autoDispose
    .family<AnimeDetails, int>((ref, animeId) {
      final client = ref.watch(malClientProvider);
      return client.getAnimeDetails(animeId);
    });

final mangaDetailProvider = FutureProvider.autoDispose
    .family<MangaDetails, int>((ref, mangaId) {
      final client = ref.watch(malClientProvider);
      return client.getMangaDetails(mangaId);
    });
