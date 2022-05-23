import 'package:mal_client_v2/API/User/User_Helper_Class/user_anime_statistics_class.dart';

class User {
  late int id;
  late String name;
  late String location;
  late String joinedAt;
  late String picture;
  late UserAnimeStatistics statistics;

  User(
      {required this.id,
      required this.name,
      required this.location,
      required this.joinedAt,
      required this.picture,
      required this.statistics});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'];
    joinedAt = json['joined_at'];
    picture = json['picture'];
    statistics = UserAnimeStatistics.fromJson(json['anime_statistics']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['location'] = location;
    data['joined_at'] = joinedAt;
    data['picture'] = picture;
    data['anime_statistics'] = statistics.toJson();
    return data;
  }

  String toString() {
    return toJson().toString();
  }
}
