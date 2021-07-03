import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:myanimelist_client/anime_ranking.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<AnimeRanking> readJson() async {
      final data = await json.decode(jsonTopAnime);
      AnimeRanking animeRanking = AnimeRanking.fromJson(data);
      return animeRanking;
    }

    return FutureBuilder(
      future: readJson(),
      builder: (BuildContext context, AsyncSnapshot<AnimeRanking> snapshot) {
        Widget child;
        if (snapshot.hasData) {
          print("data recieved");
          child = ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data!.data!.length,
            itemBuilder: (context, index) {
              return AnimeDetails(snapshot.data!.data![index].node);
              // return Text(
              //     snapshot.data!.data![index].node!.title ?? "No title");
            },
          );
        } else {
          child = Container(height: 0.0, width: 0.0);
          print("no data received");
        }
        return child;
      },
    );
  }
}

Widget AnimeDetails(Node? anime) {
  return Card(
    child: ListTile(
      leading: Image.network(
        anime!.mainPicture!.medium ?? "",
        height: 300,
        alignment: Alignment.center,
      ),
      title: Text(anime.title ?? ""),
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
