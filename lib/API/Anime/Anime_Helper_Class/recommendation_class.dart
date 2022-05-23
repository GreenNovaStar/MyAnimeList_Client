import 'package:mal_client_v2/API/Anime/Anime_Helper_Class/node_class.dart';

class Recommendation {
  late Node node;
  late int numRecommendations;

  Recommendation.fromJson(Map<String, dynamic> json) {
    node = Node.fromJson(json['node']);
    numRecommendations = json['num_recommendations'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['relation_type'] = node;
    data['num_recommendations'] = numRecommendations;
    return data;
  }

  String toString() {
    return toJson().toString();
  }
}
