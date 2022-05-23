import 'package:flutter/material.dart';
import 'package:mal_client_v2/API/Anime/anime_api_calls.dart';
import 'package:mal_client_v2/Screens/HomePage/Components/airing_list_component.dart';
import 'package:mal_client_v2/Screens/HomePage/Components/trending_list_component.dart';
import 'package:mal_client_v2/Screens/HomePage/Components/upcoming_list_component.dart';

class GuestBody extends StatefulWidget {
  const GuestBody({Key? key}) : super(key: key);

  @override
  State<GuestBody> createState() => _GuestBodyState();
}

class _GuestBodyState extends State<GuestBody> {
  late Future<List<dynamic>> _bodyData;
  @override
  void initState() {
    super.initState();
    _bodyData = _getHomeData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return FutureBuilder(
      future: _bodyData,
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
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
              return RefreshIndicator(
                  child: _buildBody(context, size, snapshot.data ?? []),
                  onRefresh: _reloadHomeData);
              // return _buildBody(context, size, snapshot.data ?? []);
            } else if (snapshot.hasError) {
              print(snapshot.error.toString());
              return Center(
                child: Text("Error: ${snapshot.error.toString()}"),
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

  Future<List<dynamic>> _getHomeData() async {
    return Future.wait([
      getAnimeRanking("trend", 10, 0),
      getAnimeRanking("airing", 6, 0),
      getAnimeRanking("upcoming", 6, 0),
      // getAnimeRanking("all", 10, 0),
      // getAnimeRanking("tv", 10, 0),
    ]);
  }

  Future<void> _reloadHomeData() async {
    setState(() {
      _bodyData = _getHomeData();
    });
  }

  Widget _buildBody(BuildContext context, Size size, List<dynamic> data) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TrendingList(size: size, anime: data[0]),
          const Divider(
            thickness: 10,
            height: 8,
          ),
          AiringList(size: size, anime: data[1]),
          const Divider(
            thickness: 10,
          ),
          UpcomingList(size: size, anime: data[2]),
        ],
      ),
    );
  }
}
