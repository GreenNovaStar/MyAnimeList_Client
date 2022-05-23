import 'package:flutter/material.dart';
import 'package:mal_client_v2/Screens/List/Components/watch_list_body_page.dart';
import 'package:mal_client_v2/Utils/status_chip_const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnimeList extends StatefulWidget {
  const AnimeList({Key? key}) : super(key: key);

  @override
  State<AnimeList> createState() => _AnimeListState();
}

class _AnimeListState extends State<AnimeList> {
  List<bool> sortingList = List.generate(4, (index) => false);
  Map<String, int> sortIndex = {
    "anime_title": 0,
    'list_updated_at': 1,
    'anime_start_date': 2,
    'list_score': 3,
  };
  Map<int, String> getSortTitleFromIndex = {
    0: "anime_title",
    1: 'list_updated_at',
    2: 'anime_start_date',
    3: 'list_score',
  };

  void grabSortStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sortingList[sortIndex[prefs.getString('sortList') ?? "anime_title"] ?? 0] =
        true;
  }

  void storeSortStatus(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('sortList', value);
  }

  @override
  void initState() {
    // TODO: implement initState
    grabSortStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Anime List"),
        actions: [
          PopupMenuButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.zero,
            tooltip: "Sort",
            onSelected: (result) async {
              print(result);
              for (int i = 0; i < sortingList.length; i++) {
                sortingList[i] = i == sortIndex[result];
              }
              storeSortStatus(result.toString());
              setState(() {});
            },
            icon: const Icon(Icons.sort_rounded),
            itemBuilder: (context) => [
              CheckedPopupMenuItem(
                padding: EdgeInsets.zero,
                checked: (sortingList[sortIndex['anime_title'] ?? 0]),
                value: "anime_title",
                child: const Text('Title'),
              ),
              CheckedPopupMenuItem(
                padding: EdgeInsets.zero,
                checked: (sortingList[sortIndex['list_updated_at'] ?? 0]),
                value: 'list_updated_at',
                child: const Text('Last Updated'),
              ),
              CheckedPopupMenuItem(
                padding: EdgeInsets.zero,
                checked: (sortingList[sortIndex['anime_start_date'] ?? 0]),
                value: 'anime_start_date',
                child: const Text('Start Date'),
              ),
              CheckedPopupMenuItem(
                padding: EdgeInsets.zero,
                checked: (sortingList[sortIndex['list_score'] ?? 0]),
                value: "list_score",
                child: const Text('List Score'),
              ),
            ],
          ),
        ],
      ),
      body: AnimeListBody(
          sortOrder: getSortTitleFromIndex[sortingList.indexOf(true)] ??
              "anime_title"),
    );
  }
}
