import 'package:myanimelist_client/API/Authorization/authorization_class.dart';
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
    meanScore: 0);

TokenResponse devToken = TokenResponse(
    token_type: "Bearer",
    expires_in: 2678400,
    access_token:
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImNmMmUwZDM3ZTZiYTc3NWJjY2EzNjhjMDZjNzBiZTZmZGZjMzg2NmNiZGVlYzhhZjdiNjYxY2EyOTA2N2M0ODRkN2JlMjZkYjA3MmEzMDIwIn0.eyJhdWQiOiJhODk4NTBkYzY4YjY3ZDQwZDJkOTE5ODhjYmIwYzRlNSIsImp0aSI6ImNmMmUwZDM3ZTZiYTc3NWJjY2EzNjhjMDZjNzBiZTZmZGZjMzg2NmNiZGVlYzhhZjdiNjYxY2EyOTA2N2M0ODRkN2JlMjZkYjA3MmEzMDIwIiwiaWF0IjoxNjI2NzMzMjI0LCJuYmYiOjE2MjY3MzMyMjQsImV4cCI6MTYyOTQxMTYyNCwic3ViIjoiNjQ4ODUxNSIsInNjb3BlcyI6W119.KwI162LcpOxN9-V6Jd8GGKBVelgyHvSF_Mj2hJdxh0PW5OF7HrEHeCefHSxw3P8EezDWzS5A812A8X5LiXYC6hpkGkKfBA-mVfnB2977N9Z4k6gEELA5lcrkd_YPkoJuurN_m21N4cdbE7L3_4-gufBcaZbWQpVjltMqWCJlfJYKRlgyXfZvCD11i4yc6PgVz6hDFyGQnjYL_tF7K4mRof1m-m2Ffygvu5N0mS9V2HuxozHKRQjbw5iWX9cmfvj8D39H09Qn-CjSkH1b3l_GtCqkcLHYDWp4TdwmhjAWdalo4TDfM_gMvja2XLOr4yjEmDHrttT_fvg7EuOxrnZYkw",
    refresh_token:
        "def50200eb547578523b122e3c146eebbb4805c3a4507bf36d7de905220aa016a099327736bf10eaad8710bb399f5848799e9898f3ae51f0e23485308073e803ae696cd3c599811370d426a93c722f15150c31613b370fe64b4acf7b921ad543ba89d3205c8e79a9dc3a07012a95f4ccc6f4db54a8a85feb8a8b50e69915fd84d1938dcabd396837d3a948d09ab5197ce39733b14098d41411312260222ff7d7dca9c640b0b4b3361461dc8222d842dfc9dec39b12c8b0f73ce0a66451d2aeccccf5c53ed22cd013f3806a73bcfa01b32918a33a86d276afa76706c47314895e5fc41420127308b8f272a47a53a2c60148a0cb9a5c8bcf87c06388dcd66aa9144196120e3c28bc11922ec98244cc5860ecbbd9ce33697291bac0b81984ba3e967155e3859c07930524ffdd03df8affe744edf9a143bc505ff308279aa9c1a29f12379bb149372244988c0710c759fefd6147cd5645affc5f23e1a06ca5ca1066d54579c92ef770b35cc12c76ee0b87d5ba48e7529e31686bead19eeb210b53f32240e4ec1093a65f");
