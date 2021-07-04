class AnimeStatistics {
  late String numItemsWatching;
  late String numItemsCompleted;
  late String numItemsOnHold;
  late String numItemsDropped;
  late String numItemsPlanToWatch;
  late String numItems;
  late String numDaysWatched;
  late String numDaysWatching;
  late String numDaysCompleted;
  late String numDaysOnHold;
  late String numDaysDropped;
  late String numDays;
  late String numEpisodes;
  late String numTimesRewatched;
  late String meanScore;

  AnimeStatistics({
    required this.numItemsWatching,
    required this.numItemsCompleted,
    required this.numItemsOnHold,
    required this.numItemsDropped,
    required this.numItemsPlanToWatch,
    required this.numItems,
    required this.numDaysWatching,
    required this.numDaysWatched,
    required this.numDaysCompleted,
    required this.numDaysOnHold,
    required this.numDaysDropped,
    required this.numDays,
    required this.numEpisodes,
    required this.numTimesRewatched,
    required this.meanScore
  });

  AnimeStatistics.fromJson(Map<String, dynamic> json) {
    numItemsWatching = json['num_items_watching'];
    numItemsCompleted = json['num_items_completed'];
    numItemsOnHold = json['num_items_on_hold'];
    numItemsDropped = json['num_items_dropped'];
    numItemsPlanToWatch = json['num_items_plan_to_watch'];
    numItems = json['num_items'];
    numDaysWatched = json['num_days_watched'];
    numDaysWatching = json['num_days_watching'];
    numDaysCompleted = json['num_days_completed'];
    numDaysOnHold = json['num_days_on_hold'];
    numDaysDropped = json['num_days_dropped'];
    numDays = json['num_days'];
    numEpisodes = json['num_episodes'];
    numTimesRewatched = json['num_times_rewatched'];
    meanScore = json['mean_score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['num_items_watching'] = numItemsWatching;
    data['num_items_completed'] = numItemsCompleted;
    data['num_items_on_hold'] = numItemsOnHold;
    data['num_items_dropped'] = numItemsDropped;
    data['num_items_plan_to_watch'] = numItemsPlanToWatch;
    data['num_items'] = numItems;
    data['num_days_watched'] = numDaysWatched;
    data['num_days_watching'] = numDaysWatching;
    data['num_days_completed'] = numDaysCompleted;
    data['num_days_on_hold'] = numDaysOnHold;
    data['num_days_dropped'] = numDaysDropped;
    data['num_days'] = numDays;
    data['num_episodes'] = numEpisodes;
    data['num_times_rewatched'] = numTimesRewatched;
    data['mean_score'] = meanScore;
    return data;
  }

}