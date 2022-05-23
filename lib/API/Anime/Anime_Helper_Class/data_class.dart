import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/list_status_class.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/node_class.dart';
import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/ranking_class.dart';

class Data {
  Node? node;
  Ranking? ranking;
  ListStatus? list;

  Data({this.node, this.ranking, this.list});

  Data.fromJson(Map<String, dynamic> json) {
    node = json['node'] != null ? Node.fromJson(json['node']) : null;
    ranking =
        json['ranking'] != null ? Ranking.fromJson(json['ranking']) : null;
    list = json['list_status'] != null
        ? ListStatus.fromJson(json['list_status'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (node != null) {
      data['node'] = node!.toJson();
    }
    if (ranking != null) {
      data['ranking'] = ranking!.toJson();
    }

    if (list != null) {
      data['list_status'] = list!.toJson();
    }
    return data;
  }

  String toString() {
    return toJson().toString();
  }
}
