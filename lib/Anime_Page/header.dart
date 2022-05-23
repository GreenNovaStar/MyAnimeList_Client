import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/anime_details_class.dart';

Widget AnimeDetailsHeader(BuildContext context, AnimeDetails animeDetails) {
  Size size = MediaQuery.of(context).size;
  double height = size.height * 0.4;
  double width = size.width * 0.5;
  var numFormatter = NumberFormat('###,###,###');

  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.max,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.5,
            ),
          ),
          child: SizedBox(
            width: width,
            height: height,
            child: animeDetails.mainPicture.large != ""
                ? Image.network(animeDetails.mainPicture.large ?? "",
                    fit: BoxFit.cover)
                : Image.asset('assets/images/myanimelist_logo_short.png'),
          ),
        ),
      ),
      SizedBox(
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StatisticCard(const Icon(Icons.star), 'Score',
                animeDetails.mean ?? "N/A", size),
            StatisticCard(
                const Icon(Icons.trending_up_rounded),
                'Rank',
                animeDetails.rank != null
                    ? "#${numFormatter.format(animeDetails.rank)}"
                    : "N/A",
                size),
            StatisticCard(
                const Icon(Icons.favorite_rounded),
                'Popularity',
                animeDetails.popularity != null
                    ? "#${numFormatter.format(animeDetails.popularity)}"
                    : "N/A",
                size),
            StatisticCard(
                const Icon(Icons.groups_rounded),
                'Users',
                animeDetails.numListUsers != null
                    ? numFormatter.format(animeDetails.numListUsers)
                    : "N/A",
                size),
          ],
        ),
      )
    ],
  );
}

Widget StatisticCard(Icon icon, String categoryName, var value, Size size) {
  double height = size.height * 0.4;
  double width = size.width * 0.4;

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      // height: height,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          icon,
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(categoryName),
              Text('$value'),
            ],
          ),
        ],
      ),
    ),
  );
}
