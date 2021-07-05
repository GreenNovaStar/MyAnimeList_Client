import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:myanimelist_client/API/Anime/Anime_Helper_Class/anime_ranking_class.dart';
import 'package:myanimelist_client/API/Anime/anime_api_calls.dart';
import 'API/User/user_api_calls.dart';
import 'anime_details_page.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<AnimeRanking> readJson() async {
      final data = await json.decode(jsonTopAnime);
      AnimeRanking animeRanking = AnimeRanking.fromJson(data);
      return animeRanking;
    }

    return RefreshIndicator(
      onRefresh: () => Future.delayed(Duration(seconds: 1)),
      child: ListView(
        children: [
          Container(color: Colors.blue,child: AnimeRankingList(getAnime: getTopAiringAnime(), rankingHeader:  "Top Airing Anime",)),
          Container(color: Colors.yellow,child: AnimeRankingList(getAnime: readJson(), rankingHeader: "Top Anime of All Time",)),
          AnimeRankingList(getAnime: readJson(), rankingHeader: "Top Anime of All Time",),
          AnimeRankingList(getAnime: readJson(), rankingHeader: "Top Anime of All Time",),
        ],
      ),
    );
  }
}

class AnimeRankingList extends StatelessWidget {

  late Future<AnimeRanking> getAnime;
  late String rankingHeader;

  AnimeRankingList({required this.getAnime, required this.rankingHeader});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.purpleAccent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: Text(rankingHeader, style: TextStyle(fontSize: 16),),
          ),
          FutureBuilder(
            future: getAnime,
            builder: (BuildContext context, AsyncSnapshot<AnimeRanking> snapshot) {
              if (snapshot.hasData) {
                print("data recieved");
                return SizedBox(
                  height: MediaQuery.of(context).size.width * 0.588,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                    physics: const BouncingScrollPhysics(),
                    itemCount: snapshot.data!.data!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return AnimeCard(snapshot.data!.data![index], MediaQuery.of(context).size, context);
                    },
                  ),
                );
                // return AnimeDetails(snapshot.data!.data![1].node);
              } else {
                print("no data received");
                // ignore: sized_box_for_whitespace
                return Container(height: 0.0, width: 0.0);
              }
            },
          ),
        ],
      ),
    );
  }
}


Widget AnimeCard(Data? anime, Size size, BuildContext context) {
  String picture = anime!.node!.mainPicture!.medium ?? "";
  double height = size.width * 0.45;
  double width = size.width * 0.3;
  return InkWell(
    onTap: () {
      getAnimeDetails(anime.node!.id).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context) => AnimeDetailsPage(animeDetails: value,))));
      //Navigator.push(context, MaterialPageRoute(builder: (context) => AnimeDetailsPage(animeDetails: null,)));
    },
    child: SizedBox(
      height: size.width,
      width: width,
      child: Card(
        color: Colors.black,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Positioned(
                  child: picture != ""
                    ? Image.network(
                      picture,
                      height: height,
                      width: width,
                      alignment: Alignment.topCenter,
                      fit: BoxFit.fitHeight,
                    )
                    // ? ShaderMask(
                    //   child: Image.network(
                    //     picture,
                    //     height: height,
                    //     width: width,
                    //     alignment: Alignment.topCenter,
                    //     fit: BoxFit.fill,
                    //   ),
                    //   shaderCallback: (rect) {
                    //     return LinearGradient(
                    //       begin: Alignment.center,
                    //       end: Alignment.bottomCenter,
                    //       colors: [Colors.white, Colors.black12],
                    //     ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                    // },
                    // blendMode: BlendMode.dstIn,
                    // )
                    : Image.asset(
                      'assets/images/myanimelist_logo_short.png',
                      height: height * 0.9,
                      width: width,
                      alignment: Alignment.topCenter,
                    ),
                ),
                // picture == ""
                //     ? Image.network(
                //         picture,
                //         height: 130,
                //         width: 90,
                //         alignment: Alignment.center,
                //       )
                //     : Image.asset(
                //         'assets/images/myanimelist_logo_short.png',
                //         height: 130,
                //         width: 90,
                //         alignment: Alignment.center,
                //       ),
                Positioned(
                  left: 1,
                  top: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text("${anime.ranking!.rank}"),
                  ),
                ),
                // Positioned(
                //   left: 3,
                //   bottom: 1,
                //   height: height * 0.21,
                //   width: width*0.94,
                //   child: Padding(
                //     padding: const EdgeInsets.all(2.5),
                //     child: Text(
                //       anime.node!.title ?? "",
                //       softWrap: true,
                //       overflow: TextOverflow.clip,
                //       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                //     ),
                //   ),
                // )
              ],
            ),
            Container(
              // color: Colors.red,
              child: SizedBox(
                height: size.width * 0.092,
                child: Padding(
                  padding: const EdgeInsets.all(2.5),
                  child: Text(
                    anime.node!.title ?? "",
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

const jsonTopAnime = """{
  "data": [
    {
      "node": {
        "id": 5114,
        "title": "Fullmetal Alchemist: Brotherhood",
        "main_picture": {
          "medium": "https://api-cdn.myanimelist.net/images/anime/1223/96541.jpg",
          "large": "https://api-cdn.myanimelist.net/images/anime/1223/96541l.jpg"
        }
      },
      "ranking": {
        "rank": 1
      }
    },
    {
      "node": {
        "id": 38524,
        "title": "Shingeki no Kyojin Season 3 Part 2",
        "main_picture": {
          "medium": "https://api-cdn.myanimelist.net/images/anime/1517/100633.jpg",
          "large": "https://api-cdn.myanimelist.net/images/anime/1517/100633l.jpg"
        }
      },
      "ranking": {
        "rank": 2
      }
    },
    {
      "node": {
        "id": 9253,
        "title": "Steins;Gate",
        "main_picture": {
          "medium": "https://api-cdn.myanimelist.net/images/anime/5/73199.jpg",
          "large": "https://api-cdn.myanimelist.net/images/anime/5/73199l.jpg"
        }
      },
      "ranking": {
        "rank": 3
      }
    },
    {
      "node": {
        "id": 42938,
        "title": "Fruits Basket: The Final",
        "main_picture": {
          "medium": "https://api-cdn.myanimelist.net/images/anime/1085/114792.jpg",
          "large": "https://api-cdn.myanimelist.net/images/anime/1085/114792l.jpg"
        }
      },
      "ranking": {
        "rank": 4
      }
    },
    {
      "node": {
        "id": 28977,
        "title": "Gintama°",
        "main_picture": {
          "medium": "https://api-cdn.myanimelist.net/images/anime/3/72078.jpg",
          "large": "https://api-cdn.myanimelist.net/images/anime/3/72078l.jpg"
        }
      },
      "ranking": {
        "rank": 5
      }
    },
    {
      "node": {
        "id": 11061,
        "title": "Hunter x Hunter (2011)",
        "main_picture": {
          "medium": "https://api-cdn.myanimelist.net/images/anime/11/33657.jpg",
          "large": "https://api-cdn.myanimelist.net/images/anime/11/33657l.jpg"
        }
      },
      "ranking": {
        "rank": 6
      }
    },
    {
      "node": {
        "id": 820,
        "title": "Ginga Eiyuu Densetsu",
        "main_picture": {
          "medium": "https://api-cdn.myanimelist.net/images/anime/13/13225.jpg",
          "large": "https://api-cdn.myanimelist.net/images/anime/13/13225l.jpg"
        }
      },
      "ranking": {
        "rank": 7
      }
    },
    {
      "node": {
        "id": 9969,
        "title": "Gintama'",
        "main_picture": {
          "medium": "https://api-cdn.myanimelist.net/images/anime/4/50361.jpg",
          "large": "https://api-cdn.myanimelist.net/images/anime/4/50361l.jpg"
        }
      },
      "ranking": {
        "rank": 8
      }
    },
    {
      "node": {
        "id": 15417,
        "title": "Gintama': Enchousen",
        "main_picture": {
          "medium": "https://api-cdn.myanimelist.net/images/anime/6/75172.jpg",
          "large": "https://api-cdn.myanimelist.net/images/anime/6/75172l.jpg"
        }
      },
      "ranking": {
        "rank": 9
      }
    },
    {
      "node": {
        "id": 35180,
        "title": "3-gatsu no Lion 2nd Season",
        "main_picture": {
          "medium": "https://api-cdn.myanimelist.net/images/anime/3/88469.jpg",
          "large": "https://api-cdn.myanimelist.net/images/anime/3/88469l.jpg"
        }
      },
      "ranking": {
        "rank": 10
      }
    }
  ],
  "paging": {
    "next": "https://api.myanimelist.net/v2/anime/ranking?offset=10&ranking_type=all&limit=10"
  }
}""";
