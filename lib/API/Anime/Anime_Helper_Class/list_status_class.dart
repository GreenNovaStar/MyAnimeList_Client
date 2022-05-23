class ListStatus {
  late String status;
  late int score;
  late int numEpisodesWatched;
  late bool isRewatching;
  String? updatedAt;
  String? startDate;
  String? finishDate;

  ListStatus(
      {required this.status,
      required this.score,
      required this.numEpisodesWatched,
      required this.isRewatching,
      this.updatedAt,
      this.startDate,
      this.finishDate});

  ListStatus.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    score = json['score'];
    numEpisodesWatched = json['num_episodes_watched'];
    isRewatching = json['is_rewatching'];
    updatedAt = json['updated_at'];
    startDate = json['start_date'];
    finishDate = json['finish_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['score'] = score;
    data['num_episodes_watched'] = numEpisodesWatched;
    data['is_rewatching'] = isRewatching;
    data['updated_at'] = updatedAt;
    data['start_date'] = startDate;
    data['finish_date'] = finishDate;
    return data;
  }

  String toString() {
    return toJson().toString();
  }
}
