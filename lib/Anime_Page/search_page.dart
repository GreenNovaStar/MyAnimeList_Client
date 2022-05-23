import 'package:flutter/material.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/anime_ranking_class.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/data_class.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/node_class.dart';
import 'package:mal_client_v2/API/Anime/anime_api_calls.dart';
import 'package:mal_client_v2/Anime_Page/anime_details_page.dart';
import 'package:mal_client_v2/page1.dart';

class AnimeSearch extends SearchDelegate<Node> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: theme.toggleableActiveColor,
      primaryIconTheme: theme.primaryIconTheme,
      primaryColorBrightness: Brightness.dark,
      textTheme: theme.textTheme,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: theme.primaryColorLight,
        selectionColor: theme.primaryColorLight,
        selectionHandleColor: theme.primaryColorLight,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: theme.inputDecorationTheme.hintStyle,
        border: InputBorder.none,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = "",
        icon: const Icon(Icons.clear_rounded),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    // throw UnimplementedError();
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(Icons.arrow_back_rounded),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    // throw UnimplementedError();
    return FutureBuilder(
      future: searchAnime(query, 50, 0),
      builder: (BuildContext context, AsyncSnapshot<AnimeRanking> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            // return GridView.builder(
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 2,
            //       crossAxisSpacing: 15.0,
            //       mainAxisSpacing: 40.0,
            //     ),
            //     itemCount: snapshot.data!.data!.length,
            //     itemBuilder: (context, index) {
            //       Data? anime = snapshot.data!.data![index];
            //       return AnimeCard(
            //           anime, MediaQuery.of(context).size, context, false);
            //     });

            return ListView.builder(
              itemCount: snapshot.data!.data!.length,
              itemBuilder: (context, index) {
                Node? anime = snapshot.data!.data![index].node;
                return ListTile(
                  leading: CircleAvatar(
                    foregroundImage:
                        NetworkImage(anime!.mainPicture?.medium ?? ""),
                    // child:
                    //     Image.asset('assets/images/myanimelist_logo_short.png'),
                  ),
                  title: Text(anime.title ?? "None"),
                  onTap: () {
                    getAnimeDetails(anime.id).then(
                      (value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AnimeDetailsPage(
                            animeDetails: value,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.data.toString());
          }
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
    // return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    // throw UnimplementedError();
    return Container(
        // color: Colors.greenAccent,
        );
  }
}
