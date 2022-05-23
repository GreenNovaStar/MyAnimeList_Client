import 'package:flutter/material.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/data_class.dart';
import 'package:mal_client_v2/API/Anime/anime_api_calls.dart';
import 'package:mal_client_v2/API/User/user_api_calls.dart';
import 'package:mal_client_v2/Anime_Page/anime_details_page.dart';
import 'package:mal_client_v2/Extension_Methods/string_extension.dart';
import 'package:mal_client_v2/Screens/List/Components/update_modal_card.dart';
import 'package:mal_client_v2/Utils/status_mapping_const.dart';

// ignore: must_be_immutable
class AnimeListTile extends StatefulWidget {
  List<Data> animeList;
  Data anime;
  bool showDivider;
  AnimeListTile(
      {Key? key,
      required this.anime,
      required this.animeList,
      required this.showDivider})
      : super(key: key);

  @override
  State<AnimeListTile> createState() => _AnimeListTileState();
}

class _AnimeListTileState extends State<AnimeListTile> {
  // Map<String, String> cleanedStatusLabels = {
  Map<String, Color> statusLabelColors = {
    "watching": Colors.green,
    "completed": Colors.blue,
    "on_hold": Colors.amber,
    "dropped": Colors.red,
    "plan_to_watch": Colors.grey
  };

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.animeList.contains(widget.anime),
      child: Column(
        children: [
          InkWell(
            onTap: () => getAnimeDetails(widget.anime.node?.id).then(
              (value) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AnimeDetailsPage(
                    animeDetails: value,
                  ),
                ),
              ),
            ),
            child: SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  // Image on the left
                  SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Image.network(
                        widget.anime.node?.mainPicture?.medium ?? ""),
                  ),

                  // Anime Details on the right
                  Container(
                    margin: const EdgeInsets.only(left: 3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Anime Title & Edit button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //Anime Title
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.69,
                              child: Text(
                                widget.anime.node?.title ??
                                    "No Title Available",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),

                            //Edit button
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.1,
                              width: MediaQuery.of(context).size.width * 0.1,
                              child: IconButton(
                                tooltip: "Update list status",
                                splashRadius: 16,
                                onPressed: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return UpdateAnimeModalCard(
                                          anime: widget.anime);
                                    },
                                  ).then((value) {
                                    if (value != null) {
                                      if (value is List) {
                                        setState(() {
                                          widget.animeList.remove(widget.anime);
                                        });
                                      } else {
                                        setState(() {
                                          widget.anime = value;
                                        });
                                      }
                                    }
                                  });
                                },
                                icon: Icon(
                                  Icons.mode_edit_outline,
                                  size: 22,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.79,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Broadcast information
                                  RichText(
                                    text: TextSpan(
                                      style: DefaultTextStyle.of(context).style,
                                      children: [
                                        //Broadcast type
                                        TextSpan(
                                          text: widget.anime.node?.mediaType
                                                  .toString()
                                                  .capitalizeAbbreviations() ??
                                              "N/A",
                                        ),
                                        //Broadcast season
                                        TextSpan(
                                          text: widget.anime.node
                                                      ?.startSeason !=
                                                  null
                                              ? " • ${widget.anime.node?.startSeason?.season.toString().capitalizeFirstLetter()} ${widget.anime.node?.startSeason?.year}"
                                              : "",
                                        ),

                                        //If it is airing
                                        if (widget.anime.node?.status?.contains(
                                                "currently_airing") ??
                                            false)
                                          const TextSpan(
                                            text: " • Airing",
                                          ),
                                        //If it aired yet
                                        if (widget.anime.node?.status
                                                ?.contains("not_yet_aired") ??
                                            false)
                                          const TextSpan(
                                            text: " • Not Yet Aired",
                                          ),
                                        //If it is rewatching
                                        if (widget.anime.list?.isRewatching ??
                                            false)
                                          const TextSpan(
                                            text: " • Rewatching",
                                          ),
                                      ],
                                    ),
                                  ),

                                  // Anime rating and number of episodes watched
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, bottom: 8),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 35,
                                            child: RichText(
                                              text: TextSpan(
                                                style:
                                                    DefaultTextStyle.of(context)
                                                        .style,
                                                children: [
                                                  // Anime rating
                                                  const WidgetSpan(
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 1.5,
                                                          right: 3),
                                                      child: Icon(
                                                        Icons.star_rate_rounded,
                                                        size: 14,
                                                        color: Colors.amber,
                                                      ),
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: (widget.anime.list
                                                                ?.score !=
                                                            null)
                                                        ? ("${widget.anime.list?.score}")
                                                        : "N/A",
                                                    // text: "0",
                                                  ),
                                                ],
                                                // Number of episodes watched
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 80,
                                            child: RichText(
                                              text: TextSpan(
                                                  style: DefaultTextStyle.of(
                                                          context)
                                                      .style,
                                                  children: [
                                                    WidgetSpan(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                bottom: 1.5,
                                                                right: 5,
                                                                left: 5),
                                                        child: Icon(
                                                          Icons
                                                              .playlist_add_check_rounded,
                                                          size: 15,
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                        ),
                                                      ),
                                                    ),
                                                    TextSpan(
                                                        text:
                                                            "${widget.anime.list?.numEpisodesWatched} / ${widget.anime.node?.numEpisodes != 0 ? widget.anime.node?.numEpisodes ?? 0 : "?"}"),
                                                    // text: "40/100"),
                                                  ]),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 120,
                                            child: RichText(
                                              text: TextSpan(
                                                  style: DefaultTextStyle.of(
                                                          context)
                                                      .style,
                                                  children: [
                                                    WidgetSpan(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                bottom: 1.5,
                                                                right: 5,
                                                                left: 5),
                                                        child: Icon(
                                                          Icons
                                                              .bookmark_rounded,
                                                          size: 15,
                                                          color:
                                                              statusLabelColors[
                                                                  widget
                                                                      .anime
                                                                      .list
                                                                      ?.status],
                                                        ),
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: cleanedStatusLabels[
                                                          widget.anime.list
                                                              ?.status],
                                                      // text: "Plan to Watch",
                                                    ),
                                                  ]),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              if (cleanedStatusLabels[
                                          widget.anime.list?.status] !=
                                      "Completed" &&
                                  (widget.anime.node?.numEpisodes !=
                                      widget.anime.list?.numEpisodesWatched))
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                      tooltip: "Quick add 1 episode to list",
                                      onPressed: () {
                                        if (widget.anime.node?.numEpisodes !=
                                            widget.anime.list
                                                ?.numEpisodesWatched) {
                                          widget.anime.list
                                              ?.numEpisodesWatched += 1;
                                          if (widget.anime.node?.numEpisodes ==
                                              widget.anime.list
                                                  ?.numEpisodesWatched) {
                                            widget.anime.list?.status =
                                                "completed";
                                          }
                                          updateAnimeList(
                                              widget.anime.node!.id!.toInt(),
                                              widget.anime.list?.status,
                                              widget.anime.list?.isRewatching,
                                              widget.anime.list
                                                  ?.numEpisodesWatched,
                                              widget.anime.list?.score,
                                              widget.anime.list?.startDate,
                                              widget.anime.list?.finishDate);
                                          setState(() {});
                                        }
                                      },
                                      splashRadius: 16,
                                      icon: Icon(
                                        Icons.plus_one_rounded,
                                        color: Theme.of(context).primaryColor,
                                      )),
                                ),
                            ],
                          ),
                        ),

                        // Amount of episodes watched out of the total
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.76,
                          child: LinearProgressIndicator(
                            minHeight: 2,
                            value: (widget.anime.list?.numEpisodesWatched
                                        .toDouble() ??
                                    0) /
                                (widget.anime.node?.numEpisodes != 0
                                    ? widget.anime.node?.numEpisodes
                                            ?.toDouble() ??
                                        0
                                    : widget.anime.list!.numEpisodesWatched < 12
                                        ? 12
                                        : 24),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (widget.showDivider) const Divider(),
        ],
      ),
    );
  }
}
