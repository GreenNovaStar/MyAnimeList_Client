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

  String toString() {
    return "[medium: $medium, large: $large]";
  }
}
