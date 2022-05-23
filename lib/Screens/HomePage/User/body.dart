import 'package:flutter/material.dart';
import 'package:mal_client_v2/API/Anime/anime_api_calls.dart';
import 'package:mal_client_v2/API/Authorization/user_authorization.dart';
import 'package:mal_client_v2/Screens/HomePage/User/header.dart';
import 'package:mal_client_v2/Screens/HomePage/top_airing_anime.dart';
import 'package:mal_client_v2/Screens/Settings/Header/header_provider.dart';
import 'package:mal_client_v2/page1.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // return FutureBuilder(
    //   future: getBody([
    //     getAnimeRanking("airing", 10, 0),
    //     getAnimeRanking("all", 10, 0),
    //     getAnimeRanking("upcoming", 10, 0),
    //     getAnimeRanking("tv", 10, 0),
    //   ]),
    //   builder: (BuildContext context, AsyncSnapshot snapshot) {
    //     return Container();
    //   },
    // );

    // return ListView(
    //   cacheExtent: 500,
    //   children: [
    //     Consumer<HeaderProvider>(builder: (context, headerProvider, child) {
    //       if (headerProvider.getVisiblity) {
    //         return HeaderRow(size);
    //       } else {
    //         return const SizedBox.shrink();
    //       }
    //     }),
    //     TopAiringAnime(),
    //     AnimeRankingList(
    //       getAnime: getAnimeRanking("all", 10, 0),
    //       rankingHeader: "Top Anime of All Time",
    //       rankingType: "all",
    //     ),
    //     AnimeRankingList(
    //       getAnime: getAnimeRanking("upcoming", 10, 0),
    //       rankingHeader: "Top Upcoming Anime",
    //       rankingType: "upcoming",
    //     ),
    //     AnimeRankingList(
    //       getAnime: getAnimeRanking("tv", 10, 0),
    //       rankingHeader: "Top TV Anime of All Time",
    //       rankingType: "tv",
    //     ),
    //   ],
    // );

    return SingleChildScrollView(
      child: Column(
        children: [
          Consumer<HeaderProvider>(builder: (context, headerProvider, child) {
            if (headerProvider.getVisiblity) {
              return HeaderRow(size);
            } else {
              return const SizedBox.shrink();
            }
          }),
          Container(
            color: Colors.red,
          ),
          TopAiringAnime(),
          AnimeRankingList(
            getAnime: getAnimeRanking("all", 10, 0),
            rankingHeader: "Top Anime of All Time",
            rankingType: "all",
          ),
          AnimeRankingList(
            getAnime: getAnimeRanking("upcoming", 10, 0),
            rankingHeader: "Top Upcoming Anime",
            rankingType: "upcoming",
          ),
          AnimeRankingList(
            getAnime: getAnimeRanking("tv", 10, 0),
            rankingHeader: "Top TV Anime of All Time",
            rankingType: "tv",
          ),
        ],
      ),
    );

    //TODO: Fix when API access token returns an error
    // return FutureBuilder(
    //   future: testAPI(),
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {
    //       return SingleChildScrollView(
    //         child: Column(
    //           children: [
    //             Consumer<HeaderProvider>(
    //                 builder: (context, headerProvider, child) {
    //               if (headerProvider.getVisiblity) {
    //                 return HeaderRow(size);
    //               } else {
    //                 return const SizedBox.shrink();
    //               }
    //             }),
    //             TopAiringAnime(),
    //             AnimeRankingList(
    //               getAnime: getAnimeRanking("all", 10, 0),
    //               rankingHeader: "Top Anime of All Time",
    //               rankingType: "all",
    //             ),
    //             AnimeRankingList(
    //               getAnime: getAnimeRanking("upcoming", 10, 0),
    //               rankingHeader: "Top Upcoming Anime",
    //               rankingType: "upcoming",
    //             ),
    //             AnimeRankingList(
    //               getAnime: getAnimeRanking("tv", 10, 0),
    //               rankingHeader: "Top TV Anime of All Time",
    //               rankingType: "tv",
    //             ),
    //           ],
    //         ),
    //       );
    //     } else if (snapshot.hasError){
    //       return
    //     }
    //   },
    //   // child: SingleChildScrollView(
    //   //   child: Column(
    //   //     children: [
    //   //       Consumer<HeaderProvider>(builder: (context, headerProvider, child) {
    //   //         if (headerProvider.getVisiblity) {
    //   //           return HeaderRow(size);
    //   //         } else {
    //   //           return const SizedBox.shrink();
    //   //         }
    //   //       }),
    //   //       TopAiringAnime(),
    //   //       AnimeRankingList(
    //   //         getAnime: getAnimeRanking("all", 10, 0),
    //   //         rankingHeader: "Top Anime of All Time",
    //   //         rankingType: "all",
    //   //       ),
    //   //       AnimeRankingList(
    //   //         getAnime: getAnimeRanking("upcoming", 10, 0),
    //   //         rankingHeader: "Top Upcoming Anime",
    //   //         rankingType: "upcoming",
    //   //       ),
    //   //       AnimeRankingList(
    //   //         getAnime: getAnimeRanking("tv", 10, 0),
    //   //         rankingHeader: "Top TV Anime of All Time",
    //   //         rankingType: "tv",
    //   //       ),
    //   //     ],
    //   //   ),
    //   // ),
    // );
  }
}
