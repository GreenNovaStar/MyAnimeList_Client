class Status {
  late String watching;
  late String completed;
  late String onHold;
  late String dropped;
  late String planToWatch;

  Status.fromJson(Map<String, dynamic> json) {
    watching = json['watching'];
    completed = json['completed'];
    onHold = json['on_hold'];
    dropped = json['dropped'];
    planToWatch = json['plan_to_watch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['watching'] = watching;
    data['completed'] = completed;
    data['on_hold'] = onHold;
    data['dropped'] = dropped;
    data['plan_to_watch'] = planToWatch;
    return data;
  }
}