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

  String toString() {
    return toJson().toString();
  }
}
