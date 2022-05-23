import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/data_class.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/list_status_class.dart';
import 'package:mal_client_v2/API/User/user_api_calls.dart';
import 'package:mal_client_v2/Extension_Methods/string_extension.dart';
import 'package:mal_client_v2/Screens/List/Components/update_modal_header.dart';
import 'package:mal_client_v2/Utils/chip_colors_const.dart';
import 'package:mal_client_v2/Utils/status_chip_const.dart';
import 'package:mal_client_v2/Utils/status_mapping_const.dart';

class UpdateAnimeModalCard extends StatefulWidget {
  Data anime;
  UpdateAnimeModalCard({required this.anime, Key? key}) : super(key: key);

  @override
  _UpdateAnimeModalCardState createState() => _UpdateAnimeModalCardState();
}

class _UpdateAnimeModalCardState extends State<UpdateAnimeModalCard> {
  List<bool> selectedStatus = List.generate(6, (x) => false);
  List<String> statusLabels = [
    "watching",
    "completed",
    "on_hold",
    "dropped",
    "plan_to_watch"
  ];
  String? _status;
  double _progress = 0;
  double _score = 0;
  DateFormat dateFormat = DateFormat('MMM d, yyyy');
  DateTime? _startDateInitial;
  String? _startDate;
  String _cleanStartDate = "";
  DateTime? _finishedDateInitial;
  String? _finishedDate;
  String _cleanFinishDate = "";
  bool? _isRewatching;
  // int? rewatchCount;

  @override
  void initState() {
    super.initState();
    _status = widget.anime.list?.status ?? "";
    _progress = widget.anime.list?.numEpisodesWatched.toDouble() ?? 0;
    _score = widget.anime.list?.score.toDouble() ?? 0;
    selectedStatus[statusLabels.indexOf(widget.anime.list!.status)] = true;
    if (widget.anime.list?.startDate != null) {
      _startDateInitial = DateTime.parse(widget.anime.list?.startDate ?? "");
      _startDate = DateFormat.yMMMd().format(_startDateInitial!);
      _cleanStartDate = widget.anime.list?.startDate ?? "";
    } else {
      _startDate = "-";
      _cleanStartDate = "";
    }

    if (widget.anime.list?.finishDate != null) {
      _finishedDateInitial =
          DateTime.parse(widget.anime.list?.finishDate ?? "");
      _finishedDate = DateFormat.yMMMd().format(_finishedDateInitial!);
      _cleanFinishDate = widget.anime.list?.finishDate ?? "";
    } else {
      _finishedDate = "-";
      _cleanFinishDate = "";
    }

    if (widget.anime.list?.isRewatching != null) {
      _isRewatching = widget.anime.list?.isRewatching;
      if (_isRewatching ?? false) {
        selectedStatus[selectedStatus.length - 1] = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 555,
      // color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UpdateModalHeader(
            anime: widget.anime,
          ),
          const Divider(),
          //Select Status
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Status",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                // child: Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     const Text(
                //       "Status",
                //       style: TextStyle(fontWeight: FontWeight.bold),
                //     ),
                // if (selectedStatus[1])
                //   Padding(
                //     padding: const EdgeInsets.only(right: 8.0),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.end,
                //       children: [
                //         SizedBox(
                //           height: 10,
                //           width: 30,
                //           child: Checkbox(
                //             value: _isRewatching,
                //             onChanged: (x) => setState(() {
                //               _isRewatching = x;
                //             }),
                //           ),
                //         ),
                //         Text("Rewatching: $rewatchCount"),
                //       ],
                //     ),
                //   ),
                //   ],
                // ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child: Wrap(
                  children: [
                    StatusButton("Watching", 0),
                    StatusButton("Completed", 1),
                    StatusButton("On Hold", 2),
                    StatusButton("Dropped", 3),
                    StatusButton("Plan to Watch", 4),
                    StatusButton("Rewatching", 5),
                    // if (selectedStatus[1]) StatusButton("Rewatching", 5),
                    // if (selectedStatus[selectedStatus.length - 1])
                    //   Expanded(
                    //     child: Container(
                    //       width: 100,
                    //       height: 40,
                    //       child: Row(
                    //         children: [
                    //           IconButton(
                    //               onPressed: () {
                    //                 setState(() {
                    //                   if (rewatchCount != 0) {
                    //                     rewatchCount -= 1;
                    //                   }
                    //                 });
                    //               },
                    //               icon: Icon(Icons.remove)),
                    //           IconButton(
                    //               onPressed: () {
                    //                 setState(() {
                    //                   rewatchCount += 1;
                    //                 });
                    //               },
                    //               icon: Icon(Icons.add)),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                  ],
                ),
              ),
            ],
          ),
          // const Divider(),
          // Progress Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  left: 8.0,
                ),
                child: Text(
                  "Progress: \t ${_progress.toInt()} / ${widget.anime.node?.numEpisodes != 0 ? widget.anime.node?.numEpisodes : "?"}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    splashRadius: 20,
                    onPressed: () {
                      setState(() {
                        if (_progress != 0) {
                          _progress -= 1;
                          if (_progress <
                              (widget.anime.node?.numEpisodes?.toDouble() ??
                                  0)) {
                            for (int i = 0; i < selectedStatus.length; i++) {
                              selectedStatus[i] = i ==
                                  statusLabels
                                      .indexOf(widget.anime.list!.status);
                            }
                          }
                        }
                      });
                    },
                    icon: const Icon(Icons.remove_rounded),
                  ),
                  Expanded(
                    child: Slider(
                      label: "${_progress.toInt()}",
                      divisions: widget.anime.node?.numEpisodes != 0
                          ? widget.anime.node?.numEpisodes ?? 12
                          : null,
                      value: _progress,
                      min: 0,
                      max: widget.anime.node?.numEpisodes!.toDouble() != 0
                          ? widget.anime.node?.numEpisodes!.toDouble() ?? 12
                          : 24,
                      onChanged: (double value) {
                        setState(() {
                          _progress = value;
                          if (widget.anime.node?.numEpisodes != 0 &&
                              _progress == widget.anime.node?.numEpisodes) {
                            for (int i = 0; i < selectedStatus.length; i++) {
                              selectedStatus[i] = i == 1;
                            }
                          } else if (_progress <
                              (widget.anime.node?.numEpisodes?.toDouble() ??
                                  0)) {
                            for (int i = 0; i < selectedStatus.length; i++) {
                              selectedStatus[i] = i ==
                                  statusLabels
                                      .indexOf(widget.anime.list!.status);
                            }
                          } else if (selectedStatus[4]) {
                            selectedStatus[0] = true;
                            selectedStatus[4] = false;
                          }
                        });
                      },
                    ),
                  ),
                  IconButton(
                    splashRadius: 20,
                    onPressed: () {
                      setState(() {
                        if (_progress !=
                            (widget.anime.node?.numEpisodes!.toDouble() != 0
                                ? widget.anime.node?.numEpisodes!.toDouble() ??
                                    12
                                : 24)) {
                          _progress += 1;
                          if (_progress == widget.anime.node?.numEpisodes) {
                            for (int i = 0; i < selectedStatus.length; i++) {
                              selectedStatus[i] = i == 1;
                            }
                          } else if (selectedStatus[4]) {
                            selectedStatus[0] = true;
                            selectedStatus[4] = false;
                          }
                        }
                      });
                    },
                    icon: const Icon(Icons.add_rounded),
                  ),
                ],
              ),
            ],
          ),
          // Score Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 4.0,
                  left: 8.0,
                ),
                child: _score.toInt() != 0
                    ? Text(
                        "Score: \t ${_score.toInt()} / 10",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    : const Text(
                        "Score: \t Not yet scored",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
              ),
              Row(
                children: [
                  IconButton(
                    splashRadius: 20,
                    onPressed: () {
                      setState(() {
                        if (_score != 0) {
                          _score -= 1;
                        }
                      });
                    },
                    icon: const Icon(Icons.remove_rounded),
                  ),
                  Expanded(
                    child: Slider(
                      label: "${_score.toInt()}",
                      divisions: 10,
                      value: _score,
                      min: 0,
                      max: 10,
                      onChanged: (double value) {
                        setState(() {
                          _score = value;
                        });
                      },
                    ),
                  ),
                  IconButton(
                    splashRadius: 20,
                    onPressed: () {
                      setState(() {
                        if (_score != 10) {
                          _score += 1;
                        }
                      });
                    },
                    icon: const Icon(Icons.add_rounded),
                  ),
                ],
              ),
            ],
          ),
          const Divider(),
          // Start/Finish Date Section
          Container(
            padding: EdgeInsets.only(bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Text(
                      "Watching Start Date",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    InkWell(
                      onTap: () {
                        // print(
                        //     "start date initial is $_startDateInitial $_startDate");
                        // if (_startDate != null) {
                        //   print("start date is not null");
                        //   if (_startDate != "-") {
                        //     print("start date does not contain '-'");
                        //     if (_startDate?.isNotEmpty ?? false) {
                        //       print("start date is not empty");
                        //     }
                        //   }
                        // }

                        // if ((_startDate != null) ||
                        //     (_startDate != "-") ||
                        //     (_startDate?.isNotEmpty ?? false)) {
                        //   _startDateInitial =
                        //       DateFormat.yMMMd().parse(_startDate!);
                        // }

                        // if (!(_startDate?.contains("-") ?? false) ||
                        //     (_startDate != null) ||
                        //     (_startDate?.isNotEmpty ?? false)) {
// _startDateInitial =
//                               DateFormat.yMMMd().parse(_startDate!);
                        // }
                        _selectDate(
                            context, _startDateInitial ?? DateTime.now(), true);
                      },
                      onLongPress: () {
                        _startDate = null;
                        _cleanStartDate = "";
                        setState(() {});
                      },
                      child: Container(
                        height: 30,
                        width: 150,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        child: Container(
                          margin: const EdgeInsets.all(3),
                          padding: const EdgeInsets.only(left: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _startDate != null ||
                                      (_startDate?.isNotEmpty ?? false)
                                  ? Text(_startDate ?? "-")
                                  : const Text("-"),
                              const Icon(
                                Icons.today_rounded,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      "Completed Date",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    InkWell(
                      onTap: () {
                        // if (!_finishedDate!.contains("-")) {
                        //   _finishedDateInitial =
                        //       DateFormat.yMMMd().parse(_finishedDate!);
                        // }
                        _selectDate(context,
                            _finishedDateInitial ?? DateTime.now(), false);
                      },
                      onLongPress: () {
                        _finishedDate = null;
                        _cleanFinishDate = "";
                        setState(() {});
                      },
                      child: Container(
                        height: 30,
                        width: 150,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        child: Container(
                          margin: const EdgeInsets.all(3),
                          padding: const EdgeInsets.only(left: 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              (_finishedDate != null) ||
                                      (_finishedDate?.isNotEmpty ?? false)
                                  ? Text(_finishedDate ?? "-")
                                  : const Text("-"),
                              const Icon(
                                Icons.today_rounded,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          // Update / Cancel buttons
          const Divider(),
          Container(
            padding: const EdgeInsets.only(top: 5, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                        width: 1.0, color: Theme.of(context).primaryColorDark),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("CANCEL"),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                        width: 1.0, color: Theme.of(context).primaryColorDark),
                  ),
                  // todo: do a post on the changes
                  onPressed: () async {
                    // todo: add patch for api calls
                    await updateAnimeList(
                            widget.anime.node!.id!.toInt(),
                            _status,
                            _isRewatching,
                            _progress.toInt(),
                            _score.toInt(),
                            _cleanStartDate,
                            _cleanFinishDate)
                        .then(
                      (value) {
                        widget.anime.list?.status = value.status;
                        widget.anime.list?.score = value.score;
                        widget.anime.list?.numEpisodesWatched =
                            value.numEpisodesWatched;
                        widget.anime.list?.isRewatching = value.isRewatching;
                        widget.anime.list?.startDate = value.startDate;
                        widget.anime.list?.finishDate = value.finishDate;
                        Navigator.pop(context, widget.anime);
                      },
                    );
                  },
                  child: const Text("UPDATE"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget StatusButton(String text, int index) {
    return Container(
      margin: const EdgeInsets.all(4),
      child: InkWell(
        borderRadius: BorderRadius.circular(chipRadius),
        onTap: () {
          setState(() {
            if ((index != selectedStatus.length - 1) && selectedStatus[index]) {
              selectedStatus[index] = false;
              selectedStatus[4] = true;
            } else if ((index == selectedStatus.length - 1) &&
                selectedStatus[index]) {
              selectedStatus[index] = false;
              _isRewatching = false;
            } else {
              if (selectedStatus[1] && index != 1) {
                _progress = widget.anime.list?.numEpisodesWatched.toDouble() ??
                    _progress;
              }

              if (index != selectedStatus.length - 1) {
                _status = revertStatusLabels[text];
                for (int i = 0; i < selectedStatus.length - 1; i++) {
                  selectedStatus[i] = i == index;
                }
              } else {
                selectedStatus[selectedStatus.length - 1] = true;
                _isRewatching = true;
              }

              // if (selectedStatus[selectedStatus.length - 1]) {
              //   selectedStatus[1] = true;
              // }

              if (selectedStatus[1]) {
                _progress = widget.anime.node?.numEpisodes != 0
                    ? widget.anime.node?.numEpisodes?.toDouble() ?? 24
                    : _progress;
              }
            }
          });
        },
        child: Container(
          // margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
              color: selectedStatus[index]
                  ? (statusLabelColors[text]?[0])
                  : Colors.transparent,
              border: Border.all(
                color: (statusLabelColors[text]?[1] ?? Colors.black),
                width: 2,
              ),
              borderRadius: BorderRadius.all(Radius.circular(chipRadius))),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: (selectedStatus[index] && index != 2)
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(
      BuildContext context, DateTime initialDate, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1971),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      if (isStartDate) {
        setState(() {
          _startDate = DateFormat.yMMMd().format(picked);
          // print(picked);
          _cleanStartDate = picked.toString().dateSubString();
        });
      } else {
        setState(() {
          _finishedDate = DateFormat.yMMMd().format(picked);
          _cleanFinishDate = picked.toString().dateSubString();
        });
      }
    }
  }
}
