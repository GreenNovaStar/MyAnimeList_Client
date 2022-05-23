import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/anime_details_class.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/genre_class.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/studios_class.dart';
import 'package:mal_client_v2/Extension_Methods/string_extension.dart';

Widget AnimeInfo(BuildContext context, AnimeDetails animeDetails) {
  Size size = MediaQuery.of(context).size;
  double height = size.height;
  double width = size.width;
  DateFormat dateFormat = DateFormat.yMMMMd('en_US');
  return Column(
    children: [
      Text("Anime Information"),
      Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.5,
          ),
        ),
        // height: height * 0.25,
        width: width * 0.75,
        // color: Colors.teal[100],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Type: ${animeDetails.mediaType!.capitalizeAbbreviations()}"),
              animeDetails.numEpisodes != 0
                  ? Text(
                      "${animeDetails.numEpisodes == 1 ? "Episode" : "Episodes"}: ${animeDetails.numEpisodes}")
                  : const Text("Episodes: Unknown"),
              animeDetails.averageEpisodeDuration != 0
                  ? Text(
                      "Duration: ${Duration(seconds: animeDetails.averageEpisodeDuration ?? 0).inMinutes} minutes")
                  : const Text("Duration: Unknown"),
              Text("Status: ${animeDetails.status!.prettifyString()}"),
              Text(
                  "Aired: ${animeDetails.startDate ?? "?"} to ${animeDetails.endDate ?? '?'}"),
              Text(
                  "Premiered: ${animeDetails.startSeason?.season.capitalizeFirstLetter()} ${animeDetails.startSeason?.year}"),
              animeDetails.broadcast != null
                  ? animeDetails.broadcast!.dayOfTheWeek
                          .toLowerCase()
                          .contains("other")
                      ? const Text("Broadcast: Not scheduled once per week")
                      : Text(
                          "Broadcast: ${animeDetails.broadcast?.dayOfTheWeek.capitalizeFirstLetter()}s at ${animeDetails.broadcast?.startTime} (JST)")
                  : const Text("Broadcast: Unknown"),
              Text("Studios: ${listStudios(animeDetails.studios)}"),
              Text("Source: ${animeDetails.source?.prettifyString()}"),
              Text(
                  "Rating: ${prettifyRatings(animeDetails.rating ?? "Unknown")}"),
              Text("Genres: ${listGenres(animeDetails.genre)}")
            ],
          ),
        ),
      )
    ],
  );
}

Widget AnimeSynoposis(BuildContext context, AnimeDetails animeDetails) {
  return Container(
    // color: Colors.red[50],
    child: Column(
      children: [
        animeDetails.synopsis!.isNotEmpty
            ? const Text("Synoposis")
            : const SizedBox.shrink(),
        animeDetails.synopsis!.isNotEmpty
            ? DescriptionTextWidget(text: animeDetails.synopsis ?? "None")
            : const SizedBox.shrink(),
        animeDetails.background!.isNotEmpty
            ? const Text("Background")
            : const SizedBox.shrink(),
        animeDetails.background!.isNotEmpty
            ? DescriptionTextWidget(text: animeDetails.background ?? "None")
            : const SizedBox.shrink(),
      ],
    ),
  );
}

class DescriptionTextWidget extends StatefulWidget {
  final String text;

  const DescriptionTextWidget({required this.text});

  @override
  _DescriptionTextWidgetState createState() => _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > 170) {
      firstHalf = widget.text.substring(0, 170);
      secondHalf = widget.text.substring(170, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: secondHalf.isEmpty
          ? Text(
              firstHalf,
              maxLines: 3,
            )
          : Column(
              children: <Widget>[
                flag
                    ? Text(
                        firstHalf + " ...",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        softWrap: false,
                      )
                    : Text(firstHalf + secondHalf),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          flag ? "show more" : "show less",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                ),
              ],
            ),
    );
  }
}

String listStudios(List<Studio>? studio) {
  String studioList = "";
  if (studio != null) {
    for (int i = 0; i < studio.length; i++) {
      studioList = studioList + studio[i].name;
      if (i + 1 != studio.length) studioList = studioList + ', ';
    }
  } else {
    studioList = "Unknown";
  }
  return studioList;
}

String listGenres(List<Genres>? genre) {
  String genreList = "";
  if (genre != null) {
    for (int i = 0; i < genre.length; i++) {
      genreList = genreList + genre[i].name;
      if (i + 1 != genre.length) genreList = genreList + ', ';
    }
  } else {
    genreList = "Unknown";
  }
  return genreList;
}

String prettifyRatings(String rating) {
  int? underscoreLocation = rating.indexOf('_');
  if (underscoreLocation != -1) {
    String firstPart =
        rating.substring(0, underscoreLocation).capitalizeAbbreviations();
    String secondPart =
        rating.substring(underscoreLocation + 1).prettifyString();
    return firstPart + "-" + secondPart;
  }
  return rating.prettifyString();
}
