import 'package:myanimelist_client/API/Anime/Anime_Helper_Class/data_class.dart';
import 'package:myanimelist_client/API/Anime/Anime_Helper_Class/paging_class.dart';

class AnimeRanking {
  List<Data>? data;
  Paging? paging;

  AnimeRanking({this.data, this.paging});

  AnimeRanking.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    paging = json['paging'] != null ? Paging.fromJson(json['paging']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (paging != null) {
      data['paging'] = paging!.toJson();
    }
    return data;
  }

  String toString() {
    return toJson().toString();
  }
}
