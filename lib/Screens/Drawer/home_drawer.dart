import 'package:flutter/material.dart';
import 'package:mal_client_v2/API/Authorization/user_authorization.dart';
import 'package:mal_client_v2/Screens/About/about.dart';
import 'package:mal_client_v2/Screens/Profile/profile.dart';
import 'package:mal_client_v2/Screens/Settings/settings.dart';
import 'package:mal_client_v2/User/user_const.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).canvasColor,
      child: ListView(
        children: [
          const DrawerHeader(child: Text("MyAnimeList Client v2")),
          if (skippedLogin)
            StatefulBuilder(builder: (context, setState) {
              return ListTile(
                leading: const Icon(Icons.person),
                title: const Text("Login to MyAnimeList"),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    authorizeUser(context);
                  });
                },
              );
            }),
          if (!skippedLogin)
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()));
              },
            ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Settings()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_rounded),
            title: const Text("About"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const About()));
            },
          ),
          if (!skippedLogin)
            ListTile(
              leading: const Icon(
                Icons.exit_to_app_rounded,
                color: Colors.red,
              ),
              title:
                  const Text("Sign Out", style: TextStyle(color: Colors.red)),
              onTap: () => UserSignOut(context),
            ),
        ],
      ),
    );
  }
}
