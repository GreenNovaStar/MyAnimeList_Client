import 'package:android_app/providers/media_mode_provider.dart';
import 'package:android_app/ui/components/app_drawer.dart';
import 'package:android_app/ui/components/media_mode_toggle.dart';
import 'package:android_app/ui/screens/home/home_body.dart';
import 'package:android_app/ui/screens/my_list_screen.dart';
import 'package:android_app/ui/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePageUser extends ConsumerStatefulWidget {
  const HomePageUser({super.key});

  @override
  ConsumerState<HomePageUser> createState() => _HomePageUserState();
}

class _HomePageUserState extends ConsumerState<HomePageUser> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const MediaModeToggle(),
        leading: IconButton(
          onPressed: () => scaffoldKey.currentState?.openDrawer(),
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      MyListScreen(kind: ref.read(mediaModeProvider)),
                ),
              );
            },
            icon: Icon(Icons.list),
          ),
        ],
      ),
      body: const HomeBody(),
    );
  }
}
