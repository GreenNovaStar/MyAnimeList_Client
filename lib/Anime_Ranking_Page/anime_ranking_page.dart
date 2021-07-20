import 'package:flutter/material.dart';
import 'package:myanimelist_client/API/Anime/Anime_Helper_Class/anime_ranking_class.dart';
import 'package:myanimelist_client/API/Anime/Anime_Helper_Class/node_class.dart';
import 'package:myanimelist_client/API/Anime/anime_api_calls.dart';
import 'package:myanimelist_client/Anime_Page/anime_details_page.dart';

class AnimeRankingPage extends StatefulWidget {
  late Future<AnimeRanking> getAnime;
  late String rankingHeader;

  AnimeRankingPage({required this.getAnime, required this.rankingHeader});

  @override
  _AnimeRankingPageState createState() => _AnimeRankingPageState();
}

class _AnimeRankingPageState extends State<AnimeRankingPage> {
  AnimeRanking animeRanking = AnimeRanking();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.getAnime,
      builder: (BuildContext context, AsyncSnapshot<AnimeRanking> snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(title: Text(widget.rankingHeader),),
              body: ListView.builder(
                itemCount: snapshot.data!.data!.length,
                itemBuilder: (context, index) {
                  Node? animeData = snapshot.data!.data![index].node;
                  return ListTile(
                    onTap: () {
                      getAnimeDetails(animeData!.id).then(
                            (value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AnimeDetailsPage(
                              animeDetails: value,
                            ),
                          ),
                        ),
                      );
                    } ,
                    leading: animeData!.mainPicture!.medium != ""
                        ? Image.network(
                      animeData.mainPicture!.medium ?? "",
                      alignment: Alignment.center,
                    )
                        : Image.asset('assets/images/myanimelist_logo_short.png'),
                    title: Text(animeData.title ?? "No Title Provided"),
                    subtitle: Text(
                        "Rank: ${snapshot.data!.data![index].ranking!.rank}"),
                  );
                },
              ),
            );
          } else {
            return const Scaffold(
              body: Center(child: Text("Unable to fetch data")),
            );
          }
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          const Scaffold(
              body: Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(child: CircularProgressIndicator()),
              ),
          );
          // return Container();
        } else {
          print("no data received");
          // ignore: sized_box_for_whitespace
          return const SizedBox.shrink();
        }
        return const SizedBox.shrink();
      },
    );
  }
}
