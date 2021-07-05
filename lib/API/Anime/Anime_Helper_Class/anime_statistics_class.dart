import 'package:myanimelist_client/API/Anime/Anime_Helper_Class/status_class.dart';

class AnimeStatistics {
  late Status? status;
  late int numListUsers;

  AnimeStatistics.fromJson(Map<String, dynamic> json) {
    status = Status.fromJson(json['status']);
    numListUsers = json['num_list_users'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['numListUsers'] = numListUsers;
    return data;
  }
}