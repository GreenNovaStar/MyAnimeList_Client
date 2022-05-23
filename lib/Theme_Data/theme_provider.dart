import 'package:flutter/material.dart';
import 'package:mal_client_v2/Theme_Data/theme_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData? _selectedTheme;
  int themeIndex;

  ThemeProvider({required this.themeIndex});

  // List<ThemeData> themes = [
  //   ThemeData(
  //     primarySwatch: Colors.deepOrange,
  //   ),
  //   ThemeData(
  //     primarySwatch: Colors.deepPurple,
  //   ),
  //   ThemeData(
  //     primarySwatch: Colors.green,
  //   ),
  //   ThemeData(
  //     primarySwatch: Colors.grey,
  //   ),
  // ];

  ThemeData get getTheme {
    return _selectedTheme ?? themes[themeIndex];
  }

  int get getThemeIndex => themeIndex;

  void setTheme(int index) async {
    _selectedTheme = themes[index];
    themeIndex = index;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('themeIndex', index);
    notifyListeners();
  }
}
