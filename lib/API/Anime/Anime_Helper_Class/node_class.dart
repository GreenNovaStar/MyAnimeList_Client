import 'package:myanimelist_client/API/Anime/Anime_Helper_Class/main_picture_class.dart';

class Node {
  int? id;
  String? title;
  MainPicture? mainPicture;

  Node({this.id, this.title, this.mainPicture});

  Node.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    mainPicture = json['main_picture'] != null
        ? MainPicture.fromJson(json['main_picture'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    if (mainPicture != null) {
      data['main_picture'] = mainPicture!.toJson();
    }
    return data;
  }
}