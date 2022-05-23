import 'package:flutter/material.dart';

Map<String, List<Color>> statusLabelColors = {
  "All": [
    Colors.cyan,
    Colors.cyan[700] ?? Colors.black,
    Colors.cyan[200] ?? Colors.black
  ],
  "Watching": [
    Colors.green,
    Colors.green[700] ?? Colors.black,
    Colors.green[100] ?? Colors.black
  ],
  "Completed": [
    Colors.blue,
    Colors.blue[700] ?? Colors.black,
    Colors.blue[100] ?? Colors.black
  ],
  "On Hold": [
    Colors.amber,
    Colors.amber[700] ?? Colors.black,
    Colors.amber[100] ?? Colors.black
  ],
  "Dropped": [
    Colors.red,
    Colors.red[700] ?? Colors.black,
    Colors.red[50] ?? Colors.black
  ],
  "Plan to Watch": [
    Colors.grey,
    Colors.grey[700] ?? Colors.black,
    Colors.grey[300] ?? Colors.black
  ],
  "Rewatching": [
    Colors.teal,
    Colors.teal[700] ?? Colors.black,
    Colors.teal[100] ?? Colors.black
  ],
};
