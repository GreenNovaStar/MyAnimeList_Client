import 'package:myanimelist_client/API/User/user_anime_statistics_class.dart';
import 'package:myanimelist_client/API/User/user_class.dart';

User defaultUser = User(
    id: 0,
    name: "",
    location: "",
    joinedAt: "",
    picture: "",
    statistics: defaultUserAnimeStatistics,
);

UserAnimeStatistics defaultUserAnimeStatistics = UserAnimeStatistics(
    numItemsWatching: 0,
    numItemsCompleted: 0,
    numItemsOnHold: 0,
    numItemsDropped: 0,
    numItemsPlanToWatch: 0,
    numItems: 0,
    numDaysWatching: 0,
    numDaysWatched: 0,
    numDaysCompleted: 0,
    numDaysOnHold: 0,
    numDaysDropped: 0,
    numDays: 0,
    numEpisodes: 0,
    numTimesRewatched: 0,
    meanScore: 0
);