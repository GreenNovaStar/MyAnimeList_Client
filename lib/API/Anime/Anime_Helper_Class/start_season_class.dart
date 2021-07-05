class StartSeason {
  late int year;
  late String season;

  StartSeason({
    required this.year,
    required this.season
  });

  StartSeason.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    season = json['season'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['year'] = year;
    data['season'] = season;
    return data;
  }
}