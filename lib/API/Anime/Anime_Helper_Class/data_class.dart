import 'package:myanimelist_client/API/Anime/Anime_Helper_Class/node_class.dart';
import 'package:myanimelist_client/API/Anime/Anime_Helper_Class/ranking_class.dart';

class Data {
  Node? node;
  Ranking? ranking;

  Data({this.node, this.ranking});

  Data.fromJson(Map<String, dynamic> json) {
    node = json['node'] != null ? Node.fromJson(json['node']) : null;
    ranking =
    json['ranking'] != null ? Ranking.fromJson(json['ranking']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (node != null) {
      data['node'] = node!.toJson();
    }
    if (ranking != null) {
      data['ranking'] = ranking!.toJson();
    }
    return data;
  }
}