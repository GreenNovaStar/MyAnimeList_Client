import 'package:flutter/material.dart';
import 'package:mal_client_v2/Utils/chip_colors_const.dart';
import 'package:mal_client_v2/Utils/status_chip_const.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class StatusChip extends StatefulWidget {
  String label;
  int index;
  List<bool> selectedStatus;
  PageController pageController;
  Map<String, List<Color>> colors = statusLabelColors;
  StatusChip({
    Key? key,
    required this.label,
    required this.index,
    required this.selectedStatus,
    required this.pageController,
  }) : super(key: key);

  @override
  State<StatusChip> createState() => _StatusChipState();
}

class _StatusChipState extends State<StatusChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(chipRadius)),
        onTap: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setInt('animeListPageIndex', widget.index);
          setState(() {
            widget.pageController.jumpToPage(widget.index);
            for (int i = 0; i < widget.selectedStatus.length; i++) {
              widget.selectedStatus[i] = i == widget.index;
            }
          });
        },
        child: Container(
          // margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          decoration: BoxDecoration(
              color: widget.selectedStatus[widget.index]
                  ? (widget.colors[widget.label]?[0]) ?? Colors.black
                  : (widget.colors[widget.label]?[2]) ?? Colors.black26,
              border: Border.all(
                color: widget.selectedStatus[widget.index]
                    ? (widget.colors[widget.label]?[1]) ?? Colors.black
                    : (widget.colors[widget.label]?[0]) ?? Colors.black,
                width: 2,
              ),
              borderRadius: BorderRadius.all(Radius.circular(chipRadius))),
          child: Text(
            widget.label,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color:
                  // widget.selectedStatus[widget.index]
                  //     ? widget.index != 3
                  //         ? Colors.white
                  //         : Colors.black
                  //     : (widget.colors[widget.label]?[2]) ?? Colors.black,
                  (widget.index != 3 && widget.selectedStatus[widget.index])
                      ? Colors.white
                      : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
