import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/data_class.dart';

class UserAnimeList {
  late List<Data> data;

  UserAnimeList({required this.data});

  UserAnimeList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data.map((v) => v.toJson()).toList();
    return data;
  }

  String toString() {
    return toJson().toString();
  }
}
