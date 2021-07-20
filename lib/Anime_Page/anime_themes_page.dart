import 'package:flutter/material.dart';
import 'package:myanimelist_client/API/Anime/Anime_Helper_Class/anime_details_class.dart';
import 'package:myanimelist_client/API/Anime/Anime_Helper_Class/anime_theme_class.dart';

Widget AnimeThemesCard(BuildContext context, AnimeDetails animeDetails) {
  print("Anime opening ${animeDetails.animeOpening}");
  print("Anime ending ${animeDetails.animeEnding}");
  return Container(
    color: Colors.blue[50],
    child: Column(
      children: [
        // Text("Anime Theme"),
        Text("Anime Openings"),
        Text(listToString(animeDetails.animeOpening)),
        Text("Anime Ending"),
        Text(listToString(animeDetails.animeEnding)),
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
