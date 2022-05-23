import 'package:flutter/material.dart';
import 'package:mal_client_v2/API/Anime/anime_api_calls.dart';
import 'package:mal_client_v2/page1.dart';

Widget TopAiringAnime() {
  return AnimeRankingList(
    getAnime: getAnimeRanking("airing", 10, 0),
    rankingHeader: "Top Airing Anime",
    rankingType: "airing",
  );
}
