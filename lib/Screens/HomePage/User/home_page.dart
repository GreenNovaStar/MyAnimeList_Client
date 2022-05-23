import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mal_client_v2/API/Anime/anime_api_calls.dart';
import 'package:mal_client_v2/Anime_Page/anime_details_page.dart';
import 'package:mal_client_v2/Anime_Page/search_page.dart';
import 'package:mal_client_v2/Screens/Drawer/home_drawer.dart';
import 'package:mal_client_v2/Screens/Drawer/home_drawer_user.dart';
import 'package:mal_client_v2/Screens/HomePage/User/body.dart';
import 'package:mal_client_v2/Screens/HomePage/User/user_body.dart';
import 'package:mal_client_v2/Screens/List/list_page.dart';

class HomePageUser extends StatelessWidget {
  const HomePageUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            splashRadius: 20,
            tooltip: "Open Drawer",
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const FaIcon(
              FontAwesomeIcons.equals,
              size: 20,
            ),
          );
        }),
        actions: [
          IconButton(
            splashRadius: 20,
            tooltip: "Search",
            onPressed: () => showSearch(
              context: context,
              delegate: AnimeSearch(),
            ),
            icon: const FaIcon(
              FontAwesomeIcons.search,
              size: 20,
            ),
          ),
          IconButton(
            splashRadius: 20,
            tooltip: "View your Anime List",
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AnimeList(),
                  ));
            },
            icon: const FaIcon(
              FontAwesomeIcons.listUl,
              size: 20,
            ),
            // icon: FaIcon(FontAwesomeIcons.clipboardList),
          ),
        ],
        elevation: 0,
      ),
      drawer: const HomeDrawerUser(),
      // body: const Body(), //Body UI v1
      body: const UserBody(), // Body UI v2
    );
  }
}
