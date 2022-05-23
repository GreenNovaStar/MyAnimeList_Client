import 'package:flutter/material.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/data_class.dart';
import 'package:mal_client_v2/Screens/List/Components/anime_list_tile.dart';

// ignore: must_be_immutable
class AnimeWatchList extends StatelessWidget {
  late List<Data> list;
  AnimeWatchList({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      // itemCount: 1,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              padding: index == 0
                  ? const EdgeInsets.only(top: 8)
                  : index + 1 == list.length
                      ? const EdgeInsets.only(bottom: 8)
                      : EdgeInsets.zero,
              child: AnimeListTile(
                anime: list[index],
                animeList: list,
                showDivider: (index + 1 != list.length),
              ),
            ),
            // if  const Divider(),
          ],
        );
      },
    );
  }
}
