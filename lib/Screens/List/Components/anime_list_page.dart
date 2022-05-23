import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mal_client_v2/API/Authorization/authorization_class.dart';
import 'package:mal_client_v2/API/Authorization/user_authorization.dart';
import 'package:mal_client_v2/API/User/User_Helper_Class/user_anime_list_class.dart';
import 'package:mal_client_v2/Screens/List/Components/anime_list_tile.dart';

// ignore: must_be_immutable
class AnimeListPage extends StatefulWidget {
  late UserAnimeList initialData;
  late String animeListStatus;
  AnimeListPage(
      {Key? key, required this.initialData, required this.animeListStatus})
      : super(key: key);

  @override
  State<AnimeListPage> createState() => _AnimeListPageState();
}

class _AnimeListPageState extends State<AnimeListPage> {
  Future<void> _refresh() async {
    TokenResponse tokenResponse = await retrieveTokens();
    checkToken(tokenResponse);

    BaseOptions _baseOptions = BaseOptions(
      headers: {"Authorization": "Bearer ${tokenResponse.access_token}"},
    );

    final Dio dio = Dio(_baseOptions);
    Response response;

    response = await dio.get(
      "https://api.myanimelist.net/v2/users/@me/animelist",
      queryParameters: {
        "fields":
            "list_status,id,title,main_picture,alternative_titles,start_date,end_date,synopsis,mean,rank,popularity,num_list_users,num_scoring_users,nsfw,created_at,updated_at,media_type,status,genres,my_list_status,num_episodes,start_season,broadcast,source,average_episode_duration,rating,pictures,background,related_anime,related_manga,recommendations,studios,statistics,opening_themes,ending_themes",
        "status": widget.animeListStatus,
        "limit": 300,
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        widget.initialData = UserAnimeList.fromJson(response.data);
      });
    } else {
      print(
          "[AnimeListPage-refresh(${widget.animeListStatus})] Error Calling API");
      print(
          "[AnimeListPage-refresh(${widget.animeListStatus})] Response Status Code = ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      onRefresh: _refresh,
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: widget.initialData.data.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                padding: index + 1 == widget.initialData.data.length
                    ? const EdgeInsets.only(bottom: 8)
                    : EdgeInsets.zero,
                child: AnimeListTile(
                  anime: widget.initialData.data[index],
                  animeList: widget.initialData.data,
                  showDivider: index + 1 != widget.initialData.data.length,
                ),
              ),
              // if (index + 1 != widget.initialData.data.length) const Divider(),
            ],
          );
        },
      ),
    );
  }
}
