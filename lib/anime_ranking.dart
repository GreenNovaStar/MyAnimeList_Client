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
}

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

class Node {
  int? id;
  String? title;
  MainPicture? mainPicture;

  Node({this.id, this.title, this.mainPicture});

  Node.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    mainPicture = json['main_picture'] != null
        ? new MainPicture.fromJson(json['main_picture'])
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

class MainPicture {
  String? medium;
  String? large;

  MainPicture({this.medium, this.large});

  MainPicture.fromJson(Map<String, dynamic> json) {
    medium = json['medium'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['medium'] = medium;
    data['large'] = large;
    return data;
  }
}

class Ranking {
  int? rank;

  Ranking({this.rank});

  Ranking.fromJson(Map<String, dynamic> json) {
    rank = json['rank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rank'] = rank;
    return data;
  }
}

class Paging {
  String? next;

  Paging({this.next});

  Paging.fromJson(Map<String, dynamic> json) {
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['next'] = next;
    return data;
  }
}
