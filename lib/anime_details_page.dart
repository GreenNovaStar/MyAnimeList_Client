import 'package:flutter/material.dart';
import 'package:myanimelist_client/API/Anime/Anime_Helper_Class/anime_details_class.dart';

class AnimeDetailsPage extends StatelessWidget {
  AnimeDetails animeDetails;

  AnimeDetailsPage({
    required this.animeDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${animeDetails.title} page."),),
      body: const Center(child: Text("Hello World"),),
    );
  }
}
