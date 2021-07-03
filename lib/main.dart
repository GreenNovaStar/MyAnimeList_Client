import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:myanimelist_client/anime_ranking.dart';
import 'package:myanimelist_client/json_mock_data.dart';
import 'package:myanimelist_client/oauth_authentication.dart';
import 'package:myanimelist_client/page1.dart';

import 'dart:math';

import 'package:myanimelist_client/user_authorization.dart';

import 'package:myanimelist_client/json_mock_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("[Logo]"),
      ),
      // body: Page1(),
      // body: Center(
      //   child: Column(
      //     children: [
      //       TextButton(
      //         child: Text("Press Me"),
      //         onPressed: () {},
      //       ),
      //       OAuthAuthentication(),
      //     ],
      //   ),
      // ),
      body: Center(
        child: OAuthAuthentication(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
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
