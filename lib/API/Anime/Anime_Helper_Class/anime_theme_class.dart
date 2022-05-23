class AnimeTheme {
  late int id;
  late int animeID;
  late String songName;

  AnimeTheme({
    required this.id,
    required this.animeID,
    required this.songName,
  });

  AnimeTheme.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    animeID = json['anime_id'];
    songName = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['anime_id'] = animeID;
    data['text'] = songName;
    return data;
  }

  String toString() {
    return toJson().toString();
  }
}
