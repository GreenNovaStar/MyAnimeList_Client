class Studio {
  late int id;
  late String name;

  Studio({
    required this.id,
    required this.name,
  });

  Studio.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }

  String toString() {
    return toJson().toString();
  }
}
