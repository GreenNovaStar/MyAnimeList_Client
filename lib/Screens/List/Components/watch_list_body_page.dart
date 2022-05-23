import 'package:flutter/material.dart';
import 'package:mal_client_v2/API/User/User_Helper_Class/user_anime_list_class.dart';
import 'package:mal_client_v2/API/User/user_api_calls.dart';
import 'package:mal_client_v2/Screens/List/Components/watch_list_body_component.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnimeListBody extends StatefulWidget {
  String sortOrder;
  AnimeListBody({Key? key, this.sortOrder = "anime_title"}) : super(key: key);

  @override
  _AnimeListBodyState createState() => _AnimeListBodyState();
}

class _AnimeListBodyState extends State<AnimeListBody> {
  late Future<List<UserAnimeList>> _animeListData;
  late int pageIndex;
  late double scrollOffset;

  @override
  void initState() {
    super.initState();
    _animeListData = _getAnimeListData(widget.sortOrder);
    lastSavedIndex();
  }

  void lastSavedIndex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    pageIndex = prefs.getInt('animeListPageIndex') ?? 0;
    scrollOffset = prefs.getDouble('statusChipsScrollOffset') ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: _getAnimeListData(widget.sortOrder),
      builder: (context, AsyncSnapshot<List<UserAnimeList>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 30,
                  ),
                  Text("Fetching Data"),
                ],
              ),
            );
          case ConnectionState.done:
            if (snapshot.hasData) {
              return buildBody(
                data: snapshot.data ?? [],
                pageIndex: pageIndex,
                scrollOffset: scrollOffset,
              );
            } else if (snapshot.hasError) {
              print(snapshot.error.toString());
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    snapshot.error.toString().contains("403")
                        ? const Text(
                            "Http status error [403]\nUnable to connect to server")
                        : Text("Error: ${snapshot.error.toString()}"),
                    TextButton(
                      child: const Text("Refresh"),
                      onPressed: () => setState(() {}),
                    )
                  ],
                ),
              );
            } else {
              return const Center(
                child: Text("No Data"),
              );
            }
          case ConnectionState.none:
            return const Center(
              child: Text("Connection state none"),
            );
        }
      },
    );
  }

  Future<List<UserAnimeList>> _getAnimeListData(String? sort) async {
    setState(() {
      _animeListData = Future.wait([
        getAnimeList("", sort ?? "anime_title"),
        getAnimeList("watching", sort ?? "anime_title"),
        getAnimeList("completed", sort ?? "anime_title"),
        getAnimeList("on_hold", sort ?? "anime_title"),
        getAnimeList("dropped", sort ?? "anime_title"),
        getAnimeList("plan_to_watch", sort ?? "anime_title")
      ]);
    });
    return _animeListData;
  }

  Future<void> _reloadAnimeListData() async {
    setState(() {
      _animeListData = _getAnimeListData(widget.sortOrder);
    });
  }
}
