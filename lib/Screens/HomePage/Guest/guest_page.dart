import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mal_client_v2/API/Authorization/user_authorization.dart';
import 'package:mal_client_v2/Anime_Page/search_page.dart';
import 'package:mal_client_v2/Screens/Drawer/home_drawer_guest.dart';
import 'package:mal_client_v2/Screens/HomePage/Guest/guest_body.dart';

class HomePageGuest extends StatelessWidget {
  const HomePageGuest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            splashRadius: 20,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const FaIcon(FontAwesomeIcons.equals, size: 20),
          );
        }),
        actions: [
          IconButton(
            splashRadius: 20,
            onPressed: () => showSearch(
              context: context,
              delegate: AnimeSearch(),
            ),
            icon: const FaIcon(FontAwesomeIcons.search, size: 20),
          ),
          IconButton(
            splashRadius: 20,
            onPressed: () {
              authorizeUser(context);
            },
            icon: const FaIcon(FontAwesomeIcons.userAlt, size: 20),
            // icon: Icon(Icons.person),
          ),
        ],
        elevation: 0,
      ),
      drawer: const HomeDrawerGuest(),
      body: const GuestBody(),
    );
  }
}
