import 'package:flutter/material.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/anime_ranking_class.dart';
import 'package:mal_client_v2/API/Anime/anime_api_calls.dart';
import 'package:mal_client_v2/Anime_Ranking_Page/anime_ranking_page.dart';
import 'package:mal_client_v2/Screens/HomePage/Components/anime_grid_tile_component.dart';
import 'package:mal_client_v2/Screens/HomePage/Components/section_header_component.dart';

// ignore: must_be_immutable
class UpcomingList extends StatelessWidget {
  late Size size;
  late AnimeRanking anime;
  UpcomingList({Key? key, required this.size, required this.anime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SectionHeader(
          icon: Icons.next_plan_rounded,
          headerTitle: "Upcoming",
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AnimeRankingPage(
                  getAnime: getAnimeRanking("upcoming", 50, 0),
                  rankingHeader: "Top Upcoming",
                ),
              ),
            );
          },
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: SizedBox(
            height: 490,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 5, mainAxisExtent: 245),
              itemCount: 6,
              itemBuilder: (context, index) {
                String? picture = anime.data?[index].node?.mainPicture?.medium;
                return AnimeGridTile(
                  picture: picture,
                  index: index,
                  anime: anime,
                  hasAired: false,
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
