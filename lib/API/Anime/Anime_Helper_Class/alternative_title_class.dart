class AlternativeTitle {
  /// Alternate names for the anime
  late List<String> synonyms;
  /// English name for the anime
  late String en;
  /// Japanese name for the anime
  late String? ja;

  AlternativeTitle({
    required this.synonyms,
    required this.en,
    required this.ja
  });

  AlternativeTitle.fromJson(Map<String, dynamic> json) {
    if (json['synonyms'] != null) {
      synonyms = List<String>.from(json['synonyms'].map((x) => x));
    }
    en = json['en'];
    ja = json['ja'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['synonyms'] = List<String>.from(synonyms.map((x) => x));
    data['en'] = en;
    data['ja'] = ja;
    return data;
  }


}