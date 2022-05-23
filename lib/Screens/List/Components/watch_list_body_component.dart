import 'package:flutter/material.dart';
import 'package:mal_client_v2/API/User/User_Helper_Class/user_anime_list_class.dart';
import 'package:mal_client_v2/API/User/user_api_calls.dart';
import 'package:mal_client_v2/Screens/List/Components/anime_list_page.dart';
import 'package:mal_client_v2/Screens/List/Components/status_chip_component.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable, camel_case_types
class buildBody extends StatefulWidget {
  List<UserAnimeList> data;
  int pageIndex;
  double scrollOffset;
  buildBody(
      {Key? key, required this.data, this.pageIndex = 0, this.scrollOffset = 0})
      : super(key: key);

  @override
  State<buildBody> createState() => buildBodyState();
}

// ignore: camel_case_types
class buildBodyState extends State<buildBody> {
  List<bool> selectedStatus = List.generate(6, (index) => false);
  late PageController _pageController;
  late ScrollController _scrollController;
  final contextKey = GlobalKey();
  List<GlobalKey> statusKeys = List.generate(6, (index) => GlobalKey());

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.pageIndex);
    selectedStatus[widget.pageIndex] = true;

    _scrollController =
        ScrollController(initialScrollOffset: widget.scrollOffset);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          color: Theme.of(context).colorScheme.primary,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              // height: 30,
              // width: size.width,
              child: IntrinsicHeight(
                child: SizedBox(
                  height: 55,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      StatusChip(
                        label: "All",
                        index: 0,
                        selectedStatus: selectedStatus,
                        pageController: _pageController,
                        key: statusKeys[0],
                        // colors: statusLabelColors,
                      ),
                      const VerticalDivider(
                        width: 3,
                        thickness: 1,
                        color: Colors.white12,
                        indent: 10,
                        endIndent: 10,
                      ),
                      StatusChip(
                        label: "Watching",
                        index: 1,
                        selectedStatus: selectedStatus,
                        pageController: _pageController,
                        key: statusKeys[1],
                        // colors: statusLabelColors,
                      ),
                      StatusChip(
                        label: "Completed",
                        index: 2,
                        selectedStatus: selectedStatus,
                        pageController: _pageController,
                        key: statusKeys[2],
                        // colors: statusLabelColors,
                      ),
                      StatusChip(
                        label: "On Hold",
                        index: 3,
                        selectedStatus: selectedStatus,
                        pageController: _pageController,
                        key: statusKeys[3],
                        // colors: statusLabelColors,
                      ),
                      StatusChip(
                        label: "Dropped",
                        index: 4,
                        selectedStatus: selectedStatus,
                        pageController: _pageController,
                        key: statusKeys[4],
                        // colors: statusLabelColors,
                      ),
                      StatusChip(
                        label: "Plan to Watch",
                        index: 5,
                        selectedStatus: selectedStatus,
                        pageController: _pageController,
                        key: statusKeys[5],
                        // colors: statusLabelColors,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: PageView(
            controller: _pageController,
            onPageChanged: (value) async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setInt('animeListPageIndex', value);
              _scrollController.position.ensureVisible(
                statusKeys[value].currentContext!.findRenderObject()!,
                alignment:
                    0.5, // How far into view the item should be scrolled (between 0 and 1).
                duration: const Duration(milliseconds: 500),
              );
              prefs.setDouble(
                  'statusChipsScrollOffset', _scrollController.offset);
              setState(() {
                for (int i = 0; i < selectedStatus.length; i++) {
                  selectedStatus[i] = i == value;
                }
              });
            },
            children: [
              AnimeListPage(
                initialData: widget.data[0],
                animeListStatus: "",
              ),
              AnimeListPage(
                initialData: widget.data[1],
                animeListStatus: "watching",
              ),
              AnimeListPage(
                initialData: widget.data[2],
                animeListStatus: "completed",
              ),
              AnimeListPage(
                initialData: widget.data[3],
                animeListStatus: "on_hold",
              ),
              AnimeListPage(
                initialData: widget.data[4],
                animeListStatus: "dropped",
              ),
              AnimeListPage(
                initialData: widget.data[5],
                animeListStatus: "plan_to_watch",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
