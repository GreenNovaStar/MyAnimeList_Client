import 'package:myanimelist_client/API/User/anime_statistics_class.dart';

class User {
  late String id;
  late String name;
  late String location;
  late String joinedAt;
  late String picture;
  late AnimeStatistics statistics;

  User({
    required this.id,
    required this.name,
    required this.location,
    required this.joinedAt,
    required this.picture,
    required this.statistics
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'];
    joinedAt = json['joined_at'];
    picture = json['picture'];
    statistics = AnimeStatistics.fromJson(json['anime_statistics']);
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
}