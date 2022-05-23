import 'package:flutter/material.dart';
import 'package:mal_client_v2/Screens/Settings/Header/header_settings.dart';
import 'package:mal_client_v2/Screens/Settings/Themes/theme_settings.dart';
import 'package:mal_client_v2/User/user_const.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      // backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text("Appearance"),
              leading: Icon(Icons.architecture_rounded),
              onTap: () => Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      const AppearanceSettings(),
                  transitionDuration: Duration.zero,
                ),
              ),
            )
            // const ThemeSettings(),
            // if (!skippedLogin) const ShowHeaderSwitch(),
          ],
        ),
      ),
    );
  }
}

// if (!skippedLogin) const ShowHeaderSwitch(),
// ThemeSettings(),
class AppearanceSettings extends StatelessWidget {
  const AppearanceSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Appearance"),
      ),
      body: ListView(
        children: [
          const ThemeSettings(),
          if (!skippedLogin) const ShowHeaderSwitch(),
        ],
      ),
    );
  }
}
