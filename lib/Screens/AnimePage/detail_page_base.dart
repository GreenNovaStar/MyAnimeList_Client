import 'package:flutter/material.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/anime_details_class.dart';
import 'package:mal_client_v2/Anime_Page/information.dart';
import 'package:mal_client_v2/Screens/AnimePage/Components/minimalistic_button.dart';

class DetailPage extends StatelessWidget {
  AnimeDetails animeDetails;
  DetailPage({Key? key, required this.animeDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.network(animeDetails.mainPicture.large ?? "",
                  fit: BoxFit.cover),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MinimalisticButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                MinimalisticButton(
                  onTap: () {
                    print("Need to add favorite");
                  },
                  child: const Icon(
                    Icons.favorite_border_rounded,
                    color: Colors.white,
                  ),
                ),
                MinimalisticButton(
                  onTap: () {
                    print("Need to add open in browser");
                  },
                  child: const Icon(
                    Icons.open_in_browser_rounded,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.1,
              minChildSize: 0.04,
              maxChildSize: 0.9,
              snap: true,
              snapSizes: [0.1, 0.5, 0.8],
              builder: (context, scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18.0),
                        topRight: Radius.circular(18.0)),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            height: 10,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        Align(
                          child: Text(animeDetails.title),
                          alignment: Alignment.center,
                        ),
                        AnimeSynoposis(context, animeDetails),
                        AnimeInfo(context, animeDetails),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
