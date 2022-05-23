import 'package:flutter/material.dart';

ThemeData currentTheme = themes[3];

List<ThemeData> themes = [
  //limit is 15
  ThemeData(
    primarySwatch: Colors.deepOrange,
  ),
  ThemeData(
    primarySwatch: Colors.deepPurple,
    // primaryColorLight: Colors.white,
    // primaryColorDark: Colors.deepPurple,
  ),
  ThemeData(
    primarySwatch: Colors.green,
  ),
  ThemeData(
    primarySwatch: Colors.red,
  ),
  ThemeData(
    primarySwatch: Colors.indigo,
  ),
  ThemeData(
    primarySwatch: Colors.blue,
  ),
  ThemeData(
    primarySwatch: Colors.teal,
  ),
  ThemeData(
    //Eddies Theme
    primarySwatch: Colors.green,
    primaryColor: Colors.green[700],
    appBarTheme: AppBarTheme(
      color: Colors.green[700],
    ),
  ),
];
