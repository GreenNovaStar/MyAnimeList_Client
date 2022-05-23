class Ranking {
  /// Anime rank
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

  String toString() {
    return toJson().toString();
  }
}
