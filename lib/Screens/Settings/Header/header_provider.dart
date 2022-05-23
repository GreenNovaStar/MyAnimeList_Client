import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HeaderProvider extends ChangeNotifier {
  bool? _headerVisibility;
  bool headerVisible;

  HeaderProvider({required this.headerVisible});

  bool get getVisiblity {
    return _headerVisibility ?? headerVisible;
  }

  void setHeader(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("headerVisibility", value);
    _headerVisibility = value;
    notifyListeners();
  }
}
