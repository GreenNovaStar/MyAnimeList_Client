import 'package:mal_client_v2/API/Authorization/user_authorization.dart';

extension StringExtension on String {
  String capitalizeFirstLetter() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String prettifyString() {
    int? underscoreLocation = indexOf('_');
    int? whitespaceLocation = indexOf(' ');
    if (underscoreLocation == -1 && whitespaceLocation == -1) {
      return capitalizeFirstLetter();
    } else if (whitespaceLocation == -1) {
      String firstWord = substring(0, underscoreLocation);
      String secondWord = substring(underscoreLocation + 1);
      return firstWord.capitalizeFirstLetter().prettifyString() +
          " " +
          secondWord.capitalizeFirstLetter().prettifyString();
    } else {
      String firstWord = substring(0, whitespaceLocation);
      String secondWord = substring(whitespaceLocation + 1);
      return firstWord.capitalizeFirstLetter().prettifyString() +
          " " +
          secondWord.capitalizeFirstLetter().prettifyString();
    }
  }

  String capitalizeAbbreviations() {
    int stringLength = length;
    if (stringLength > 3) {
      return capitalizeFirstLetter();
    } else {
      return toUpperCase();
    }
  }

  String dateSubString() {
    int spaceIndex = indexOf(" ");
    if (spaceIndex == -1) return this;
    return substring(0, spaceIndex);
  }

  bool isDateExpired() {
    return DateTime.now().difference(DateTime.parse(this)) +
            const Duration(hours: 6) >=
        Duration.zero;
  }
}
