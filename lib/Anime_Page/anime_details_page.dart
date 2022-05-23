import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/anime_details_class.dart';
import 'package:mal_client_v2/Anime_Page/anime_themes_page.dart';
import 'package:mal_client_v2/Anime_Page/header.dart';
import 'package:mal_client_v2/Anime_Page/information.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

class AnimeDetailsPage extends StatelessWidget {
  AnimeDetails animeDetails;
  AnimeDetailsPage({
    required this.animeDetails,
  });

  @override
  Widget build(BuildContext context) {
    String url = 'https://myanimelist.net/anime/${animeDetails.id}';
    return Scaffold(
      appBar: AppBar(
        // title: Text("${animeDetails.title} page."),
        actions: [
          // IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_rounded)),
          IconButton(
            tooltip: "Open in browser",
            onPressed: () async {
              // launch(url);
              await launch(
                url,
                customTabsOption: CustomTabsOption(
                  toolbarColor: Theme.of(context).primaryColor,
                  enableDefaultShare: true,
                  enableUrlBarHiding: true,
                  showPageTitle: true,
                  animation: CustomTabsSystemAnimation.slideIn(),
                  extraCustomTabs: const <String>[
                    // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
                    'org.mozilla.firefox',
                    // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
                    'com.microsoft.emmx',
                  ],
                ),
                safariVCOption: SafariViewControllerOption(
                  preferredBarTintColor: Theme.of(context).primaryColor,
                  preferredControlTintColor: Colors.white,
                  barCollapsingEnabled: true,
                  entersReaderIfAvailable: false,
                  dismissButtonStyle:
                      SafariViewControllerDismissButtonStyle.close,
                ),
              );
            },
            icon: const Icon(Icons.open_in_browser_rounded),
          )
        ],
      ),
      // body: const Center(child: Text("Hello World"),),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              animeDetails.title,
              style: const TextStyle(fontSize: 24),
            ),
          ),
          AnimeDetailsHeader(context, animeDetails),
          AnimeSynoposis(context, animeDetails),
          AnimeInfo(context, animeDetails),
          AnimeThemesCard(context, animeDetails),
          const SizedBox(
            height: 50.0,
          )
        ],
      ),
    );
  }
}
