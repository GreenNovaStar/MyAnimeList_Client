import 'package:android_app/ui/components/media_mode_toggle.dart';
import 'package:android_app/ui/screens/home/home_body.dart';
import 'package:android_app/ui/screens/landing_page.dart';
import 'package:android_app/ui/screens/search_screen.dart';
import 'package:flutter/material.dart';

class HomePageGuest extends StatelessWidget {
  const HomePageGuest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const MediaModeToggle(),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LandingPage()),
              );
            },
            icon: const Icon(Icons.exit_to_app_outlined),
          ),
        ],
      ),
      body: const HomeBody(),
    );
  }
}
