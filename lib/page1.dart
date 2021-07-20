import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:myanimelist_client/API/Anime/Anime_Helper_Class/anime_ranking_class.dart';
import 'package:myanimelist_client/API/Anime/Anime_Helper_Class/data_class.dart';
import 'package:myanimelist_client/API/Anime/anime_api_calls.dart';
import 'API/User/user_api_calls.dart';
import 'Anime_Page/anime_details_page.dart';
import 'Anime_Ranking_Page/anime_ranking_page.dart';

class Page1 extends StatefulWidget {
  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    // Future<AnimeRanking> readJson() async {
    //   final data = await json.decode(jsonTopAnime);
    //   AnimeRanking animeRanking = AnimeRanking.fromJson(data);
    //   return animeRanking;
    // }
    return RefreshIndicator(
      onRefresh: () => Future.delayed(const Duration(seconds: 1))
          .then((value) => setState(() {})),
      child: ListView(
        shrinkWrap: true,
        children: [
          AnimeRankingList(
            getAnime: getAnimeRanking("airing", 10, 0),
            rankingHeader: "Top Airing Anime",
            rankingType: "airing",
          ),
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
  }
}

class AnimeRankingList extends StatelessWidget {
  late Future<AnimeRanking> getAnime;
  late String rankingHeader;
  late String rankingType;

  AnimeRankingList(
      {required this.getAnime,
      required this.rankingHeader,
      required this.rankingType});

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Text(
    //               rankingHeader,
    //               style: const TextStyle(fontSize: 16),
    //             ),
    //             GestureDetector(
    //               onTap: () => print("View More Button Pressed"),
    //               child: Text("View More", style: TextStyle(color: Theme.of(context).primaryColor),),
    //             ),
    //           ],
    //         ),
    //       ),
    //       FutureBuilder(
    //         future: getAnime,
    //         builder:
    //             (BuildContext context, AsyncSnapshot<AnimeRanking> snapshot) {
    //           if (snapshot.hasData) {
    //             print("data recieved");
    //             return SizedBox(
    //               height: 245,
    //               // height: MediaQuery.of(context).size.height * 0.32,
    //               child: ListView.builder(
    //                 padding:
    //                     const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
    //                 physics: const BouncingScrollPhysics(),
    //                 itemCount: snapshot.data!.data!.length + 1,
    //                 scrollDirection: Axis.horizontal,
    //                 itemBuilder: (context, index) {
    //                   if (index < snapshot.data!.data!.length) {
    //                     return AnimeCard(snapshot.data!.data![index],
    //                         MediaQuery.of(context).size, context);
    //                   } else {
    //                     return IconButton(
    //                       icon: Icon(Icons.arrow_forward_rounded),
    //                       onPressed: () {},
    //                     );
    //                   }
    //                 },
    //               ),
    //             );
    //             // return AnimeDetails(snapshot.data!.data![1].node);
    //           } else {
    //             print("no data received");
    //             // ignore: sized_box_for_whitespace
    //             return const SizedBox.shrink();
    //           }
    //         },
    //       ),
    //     ],
    //   ),
    // );

    return FutureBuilder(
      future: getAnime,
      builder: (BuildContext context, AsyncSnapshot<AnimeRanking> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            print("data recieved");
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        rankingHeader,
                        style: const TextStyle(fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("View More Button Pressed");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AnimeRankingPage(
                                getAnime: getAnimeRanking(rankingType, 50, 0),
                                rankingHeader: rankingHeader,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "View More",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 245,
                  // height: MediaQuery.of(context).size.height * 0.32,
                  child: ListView.builder(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                    physics: const BouncingScrollPhysics(),
                    itemCount: snapshot.data!.data!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return AnimeCard(snapshot.data!.data![index],
                          MediaQuery.of(context).size, context);
                    },
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return const Scaffold(
                body: Center(child: Text("An Error Has Occured.")));
          }
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: CircularProgressIndicator()),
          );
          // return Container();
        } else {
          print("no data received");
          // ignore: sized_box_for_whitespace
          return const SizedBox.shrink();
        }
        return const SizedBox.shrink();
      },
    );
  }
}

Widget AnimeCard(Data? anime, Size size, BuildContext context) {
  String picture = anime!.node!.mainPicture!.large ?? "";
  // double height = size.width * 0.35;
  // double width = size.width * 0.35;
  return InkWell(
    onTap: () {
      getAnimeDetails(anime.node!.id).then(
        (value) => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AnimeDetailsPage(
              animeDetails: value,
            ),
          ),
        ),
      );
    },
    child: Container(
      //margin: const EdgeInsets.all(5.0),
      // color: Colors.red,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              SizedBox(
                width: 130,
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    picture,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 1,
                top: 1,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: anime.ranking!.rank == 1
                        ? const Color(0xFFFFD700)
                        : anime.ranking!.rank == 2
                            ? const Color(0xFFC0C0C0)
                            : anime.ranking!.rank == 3
                                ? const Color(0xFFCD7F32)
                                : Theme.of(context).primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      "${anime.ranking!.rank}",
                      style: TextStyle(
                          color: Theme.of(context).secondaryHeaderColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 140,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Text(
                anime.node!.title ?? "",
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(letterSpacing: 0.5),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
