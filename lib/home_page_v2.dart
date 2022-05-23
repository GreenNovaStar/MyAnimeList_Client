import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mal_client_v2/API/Authorization/user_authorization.dart';
import 'package:mal_client_v2/Anime_Page/search_page.dart';
import 'package:mal_client_v2/Screens/Drawer/home_drawer.dart';
import 'package:mal_client_v2/Screens/HomePage/User/body.dart';
import 'package:mal_client_v2/Screens/Settings/settings.dart';
import 'package:mal_client_v2/User/user_const.dart';
import 'package:mal_client_v2/page1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageV2 extends StatefulWidget {
  const HomePageV2({Key? key}) : super(key: key);

  @override
  State<HomePageV2> createState() => _HomePageV2State();
}

class _HomePageV2State extends State<HomePageV2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLoginState();
  }

  void getLoginState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    skippedLogin = prefs.getBool("skippedLogin") ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const FaIcon(FontAwesomeIcons.equals));
        }),
        actions: [
          IconButton(
            onPressed: () => showSearch(
              context: context,
              delegate: AnimeSearch(),
            ),
            icon: const FaIcon(FontAwesomeIcons.search),
          ),
          if (skippedLogin)
            IconButton(
              onPressed: () {
                authorizeUser(context);
              },
              icon: const FaIcon(FontAwesomeIcons.user),
              // icon: FaIcon(FontAwesomeIcons.clipboardList),
            ),
          if (!skippedLogin)
            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: const Text(
                          "To Be Implemented:\nAbility to view your anime list"),
                      action: SnackBarAction(
                        label: "Dismiss",
                        onPressed: () =>
                            ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                      )),
                );
              },
              icon: const FaIcon(FontAwesomeIcons.listUl),
              // icon: FaIcon(FontAwesomeIcons.clipboardList),
            ),
        ],
        elevation: 0,
      ),
      drawer: const HomeDrawer(),
      body: const Body(),
    );
  }
}
