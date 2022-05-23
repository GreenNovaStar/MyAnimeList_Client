import 'package:flutter/material.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/data_class.dart';
import 'package:mal_client_v2/API/Anime/anime_api_calls.dart';
import 'package:mal_client_v2/Anime_Page/anime_details_page.dart';
import 'package:mal_client_v2/Screens/AnimePage/detail_page_base.dart';
import 'package:mal_client_v2/Utils/chip_colors_const.dart';
import 'package:mal_client_v2/Utils/status_mapping_const.dart';

class AnimeCard extends StatelessWidget {
  late Data anime;
  late Size size;
  late bool ranking;
  late bool lightText;
  bool hasList;
  AnimeCard(
      {Key? key,
      required this.anime,
      required this.size,
      required this.ranking,
      required this.lightText,
      this.hasList = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String picture = anime.node!.mainPicture!.large ?? "";
    return InkWell(
      onTap: () {
        getAnimeDetails(anime.node!.id).then(
          (value) => Navigator.push(
            context,
            MaterialPageRoute(
              // builder: (context) => AnimeDetailsPage(
              //   animeDetails: value,
              // ),
              builder: (context) => DetailPage(
                animeDetails: value,
              ),
            ),
          ),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Stack(
              children: [
                SizedBox(
                  width: 130,
                  height: 200,
                  child: Image.network(
                    picture,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: 130,
                  height: 200,
                  decoration: BoxDecoration(
                    // color: Colors.transparent,
                    gradient: LinearGradient(
                      begin: FractionalOffset.center,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.grey.withOpacity(0),
                        Colors.black.withOpacity(0.8),
                      ],
                      stops: const [0.0, 1.0],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    child: SizedBox(
                      height: 38,
                      width: 125,
                      child: Text(
                        anime.node?.title ?? "No Name Provided",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          letterSpacing: 0.5,
                          height: 1.1,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 2,
                  left: 10,
                  child: SizedBox(
                    // height: 15,
                    width: 130,
                    child: RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: [
                          const WidgetSpan(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 1.5, right: 3),
                              child: Icon(
                                Icons.star_rate_rounded,
                                size: 13,
                                color: Colors.amber,
                              ),
                            ),
                          ),
                          TextSpan(
                            text: (anime.node?.mean != null)
                                ? ("${anime.node?.mean}")
                                : "N/A",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (hasList)
                  Positioned(
                    right: 0,
                    bottom: 1,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(5)),
                      ),
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: RichText(
                          text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: [
                                // TextSpan(
                                //   style: TextStyle(fontSize: 12),
                                //   text: cleanedStatusLabels[
                                //       anime.node?.listStatus?.status],
                                //   // text: "Plan to Watch",
                                // ),
                                WidgetSpan(
                                  child: Icon(
                                    Icons.bookmark_rounded,
                                    size: 20,
                                    color: statusLabelColors[
                                        cleanedStatusLabels[anime
                                            .node?.listStatus?.status]]?[0],
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                if (ranking)
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
                              color: anime.ranking!.rank! > 3
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
