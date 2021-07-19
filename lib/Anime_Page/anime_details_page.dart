import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myanimelist_client/API/Anime/Anime_Helper_Class/anime_details_class.dart';
import 'package:myanimelist_client/Anime_Page/header.dart';
import 'package:myanimelist_client/Anime_Page/information.dart';

class AnimeDetailsPage extends StatelessWidget {
  AnimeDetails animeDetails;
  AnimeDetailsPage({
    required this.animeDetails,
  });

  @override
  Widget build(BuildContext context) {
    String url = 'https://myanimelist.net/anime/${animeDetails.id}';
    return Scaffold(
      appBar: AppBar(
        // title: Text("${animeDetails.title} page."),
        actions: [
          // IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_rounded)),
        ],
      ),
      // body: const Center(child: Text("Hello World"),),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(animeDetails.title, style: TextStyle(fontSize: 24),),
          ),
          AnimeDetailsHeader(context, animeDetails),
          AnimeInfo(context, animeDetails),
          AnimeInfo(context, animeDetails),
          AnimeInfo(context, animeDetails),
        ],
      ),
    );
  }
}
