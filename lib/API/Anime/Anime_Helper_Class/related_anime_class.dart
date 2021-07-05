import 'package:myanimelist_client/API/Anime/Anime_Helper_Class/node_class.dart';

class RelatedAnime {
  late Node node;
  late String relationType;
  late String relationTypeFormatted;

  RelatedAnime.fromJson(Map<String, dynamic> json) {
    node = Node.fromJson(json['node']);
    relationType = json['relation_type'];
    relationTypeFormatted = json['relation_type_formatted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['relation_type'] = node;
    data['relation_type'] = relationType;
    data['relation_type_formatted'] = relationTypeFormatted;
    return data;
  }
}