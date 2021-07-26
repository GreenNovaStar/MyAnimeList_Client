class Broadcast {
  late String dayOfTheWeek;
  late String startTime;

  Broadcast({required this.dayOfTheWeek, required this.startTime});

  Broadcast.fromJson(Map<String, dynamic> json) {
    dayOfTheWeek = json['day_of_the_week'];
    startTime = json['start_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day_of_the_week'] = dayOfTheWeek;
    data['start_time'] = startTime;
    return data;
  }

  String toString() {
    return toJson().toString();
  }
}
