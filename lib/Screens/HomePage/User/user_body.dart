import 'package:flutter/material.dart';
import 'package:mal_client_v2/API/Anime/anime_api_calls.dart';
import 'package:mal_client_v2/API/Authorization/user_authorization.dart';
import 'package:mal_client_v2/API/User/user_api_calls.dart';
import 'package:mal_client_v2/Screens/HomePage/Components/airing_list_component.dart';
import 'package:mal_client_v2/Screens/HomePage/Components/suggested_list_component.dart';
import 'package:mal_client_v2/Screens/HomePage/Components/trending_list_component.dart';
import 'package:mal_client_v2/Screens/HomePage/Components/upcoming_list_component.dart';
import 'package:mal_client_v2/Screens/HomePage/Components/user_header_component.dart';
import 'package:mal_client_v2/Screens/Settings/Header/header_provider.dart';
import 'package:provider/provider.dart';

class UserBody extends StatefulWidget {
  const UserBody({Key? key}) : super(key: key);

  @override
  State<UserBody> createState() => _UserBodyState();
}

class _UserBodyState extends State<UserBody> {
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
      future: _getHomeData(),
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

  Future<List<dynamic>> _getHomeData() async {
    setState(() {
      _bodyData = Future.wait([
        getUserDetails(),
        getAnimeRanking("trend", 10, 0),
        getAnimeRanking("airing", 8, 0),
        getAnimeRanking("upcoming", 8, 0),
        //* IMPORTANT
        // TODO: Fix issue with suggested anime
        // getSuggestedAnime(8, 0),
      ]);
    });
    return _bodyData;
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
          Consumer<HeaderProvider>(builder: (context, headerProvider, child) {
            if (headerProvider.getVisiblity) {
              return GreetingHeader(user: data[0], size: size);
            } else {
              return const SizedBox.shrink();
            }
          }),
          TrendingList(anime: data[1], size: size),
          const Divider(
            thickness: 10,
            height: 8,
          ),
          AiringList(anime: data[2], size: size),
          const Divider(
            thickness: 10,
          ),
          UpcomingList(anime: data[3], size: size),
          const Divider(
            thickness: 10,
          ),
          // SuggestedList(anime: data[4], size: size),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
