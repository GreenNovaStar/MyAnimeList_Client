import 'package:flutter/material.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/anime_ranking_class.dart';
import 'package:mal_client_v2/Screens/HomePage/Components/anime_card_component.dart';

// ignore: must_be_immutable
class TrendingList extends StatelessWidget {
  late Size size;
  late AnimeRanking anime;
  TrendingList({Key? key, required this.size, required this.anime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff2F52A2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(
              Icons.trending_up_rounded,
              color: Theme.of(context).primaryColorLight,
            ),
            title: Text(
              "Trending",
              style: TextStyle(color: Theme.of(context).primaryColorLight),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: SizedBox(
              // height: 250, // height to have text on bottom
              height: 200,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: anime.data?.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: index == 0
                        ? const EdgeInsets.only(left: 10, right: 5)
                        : index + 1 == anime.data?.length
                            ? const EdgeInsets.only(right: 10, left: 5)
                            : const EdgeInsets.symmetric(horizontal: 5),
                    child: AnimeCard(
                      anime: anime.data![index],
                      size: size,
                      ranking: true,
                      lightText: true,
                      hasList: anime.data![index].node?.listStatus != null,
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
