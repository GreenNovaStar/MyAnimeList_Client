import 'package:flutter/material.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/data_class.dart';
import 'package:mal_client_v2/API/User/user_api_calls.dart';
import 'package:mal_client_v2/Extension_Methods/string_extension.dart';

class UpdateModalHeader extends StatelessWidget {
  Data anime;
  UpdateModalHeader({Key? key, required this.anime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, left: 4),
      child: Stack(
        children: [
          Positioned(
            top: -10,
            right: -5,
            child: IconButton(
              tooltip: "Remove from list",
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Remove Anime from list?"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("No")),
                          TextButton(
                              onPressed: () {
                                if (anime.node?.id != null) {
                                  deleteAnimeFromList(anime.node?.id ?? 0)
                                      .then((value) {
                                    Navigator.pop(context);
                                    Navigator.pop(context, value);
                                  });
                                }
                              },
                              child: const Text("Yes")),
                        ],
                      );
                    });
              },
              icon: Icon(
                Icons.delete_forever_rounded,
                color: Colors.red[700],
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                height: 120,
                width: MediaQuery.of(context).size.width * 0.3,
                child: Image.network(anime.node?.mainPicture?.medium ?? ""),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      anime.node?.title ?? "No Title Provided",
                      maxLines: 3,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: [
                        //Broadcast type
                        TextSpan(
                          text: anime.node?.mediaType
                                  .toString()
                                  .capitalizeAbbreviations() ??
                              "N/A",
                        ),
                        const TextSpan(
                          text: " • ",
                        ),
                        //Broadcast season
                        TextSpan(
                          text:
                              "${anime.node?.startSeason?.season.toString().capitalizeFirstLetter()} ${anime.node?.startSeason?.year}",
                        ),

                        //If it is airing
                        if (anime.node?.status?.contains("currently_airing") ??
                            false)
                          const TextSpan(
                            text: " • Airing",
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
