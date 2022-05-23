import 'package:flutter/material.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/anime_ranking_class.dart';
import 'package:mal_client_v2/API/Anime/anime_api_calls.dart';
import 'package:mal_client_v2/Anime_Page/anime_details_page.dart';

class AnimeGridTile extends StatelessWidget {
  const AnimeGridTile({
    Key? key,
    required this.picture,
    required this.anime,
    required this.index,
    this.hasAired,
  }) : super(key: key);

  final String? picture;
  final AnimeRanking anime;
  final int index;
  final bool? hasAired;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 4, right: 4, bottom: 5),
      child: InkWell(
        onTap: () => getAnimeDetails(anime.data?[index].node?.id).then(
          (value) => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AnimeDetailsPage(
                animeDetails: value,
              ),
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              picture ?? "",
              fit: BoxFit.cover,
              height: 200,
            ),
            Container(
              margin: const EdgeInsets.only(left: 2, right: 2, top: 2),
              child: SizedBox(
                height: 35,
                child: Text(
                  anime.data?[index].node?.title ?? "No Name Provided",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(letterSpacing: 0.5, height: 1.3),
                ),
              ),
            ),
            if (hasAired ?? false)
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      const WidgetSpan(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 1.5, right: 3),
                          child: Icon(
                            Icons.star_rate_rounded,
                            size: 14,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: (anime.data?[index].node?.mean != null)
                            ? ("${anime.data?[index].node?.mean.toDouble()}")
                            : "N/A",
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );

    // return Container(
    //   margin: const EdgeInsets.symmetric(horizontal: 4),
    //   child: GestureDetector(
    //     onTap: () => getAnimeDetails(anime.data?[index].node?.id).then(
    //       (value) => Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => AnimeDetailsPage(
    //             animeDetails: value,
    //           ),
    //         ),
    //       ),
    //     ),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Image.network(
    //           picture ?? "",
    //           fit: BoxFit.cover,
    //           height: 200,
    //         ),
    //         Container(
    //           margin: const EdgeInsets.only(left: 2, right: 2, top: 2),
    //           child: SizedBox(
    //             height: 35,
    //             child: Text(
    //               anime.data?[index].node?.title ?? "No Name Provided",
    //               maxLines: 2,
    //               overflow: TextOverflow.ellipsis,
    //               style: const TextStyle(letterSpacing: 0.5, height: 1.3),
    //             ),
    //           ),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.only(top: 4.0),
    //           child: RichText(
    //             text: TextSpan(
    //               style: DefaultTextStyle.of(context).style,
    //               children: [
    //                 const WidgetSpan(
    //                   child: Padding(
    //                     padding: EdgeInsets.only(bottom: 1.5, right: 3),
    //                     child: Icon(
    //                       Icons.star_rate_rounded,
    //                       size: 14,
    //                       color: Colors.amber,
    //                     ),
    //                   ),
    //                 ),
    //                 TextSpan(
    //                   text: (anime.data?[index].node?.mean != null)
    //                       ? ("${anime.data?[index].node?.mean}")
    //                       : "N/A",
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
