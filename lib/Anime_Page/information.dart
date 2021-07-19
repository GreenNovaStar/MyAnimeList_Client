import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myanimelist_client/API/Anime/Anime_Helper_Class/anime_details_class.dart';
import 'package:myanimelist_client/Extension_Methods/string_extension.dart';

Widget AnimeInfo(BuildContext context, AnimeDetails animeDetails){
  Size size = MediaQuery.of(context).size;
  double height = size.height;
  double width = size.width;
  return Column(
    children: [
      Text("Anime Information"),
      Container(
        height: height  * 0.25,
        width: width * 0.75,
        color: Colors.teal,
      )
    ],
  );
}