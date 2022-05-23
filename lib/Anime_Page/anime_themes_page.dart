import 'package:flutter/material.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/anime_details_class.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/anime_theme_class.dart';

Widget AnimeThemesCard(BuildContext context, AnimeDetails animeDetails) {
  return Container(
    // color: Colors.blue[50],
    child: Column(
      children: [
        ExpansionTile(
          title: const Text("Anime Openings"),
          children: [Text(listToString(animeDetails.animeOpening))],
        ),
        ExpansionTile(
          title: const Text("Anime Endings"),
          children: [Text(listToString(animeDetails.animeEnding))],
        ),
      ],
    ),
  );
}

String listToString(List<AnimeTheme>? theme) {
  String listThemes = "";
  if (theme != null) {
    for (int i = 0; i < theme.length; i++) {
      listThemes = listThemes + theme[i].songName + "\n";
      // if ((i + 1) != theme.length) listThemes = listThemes + "\n";
    }
  } else {
    listThemes = "None";
  }
  return listThemes;
}
