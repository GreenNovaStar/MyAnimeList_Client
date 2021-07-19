import 'package:dio/dio.dart';
import 'package:myanimelist_client/API/Anime/Anime_Helper_Class/anime_ranking_class.dart';
import 'package:myanimelist_client/API/User/user_class.dart';
import '../Authorization/user_authorization.dart';

BaseOptions _baseOptions = BaseOptions(headers: {"Authorization": "Bearer ${tokenResponse.access_token}"},);

Future<User> getUserDetails() async {
  tokenResponse = await retrieveTokens();
  final Dio dio = Dio(_baseOptions);
  Response response;
  late User userInfo;

  response = await dio.get("https://api.myanimelist.net/v2/users/@me",
    queryParameters: {
      "fields": "anime_statistics",
    },
  );

  if(response.statusCode == 200){
    userInfo = User.fromJson(response.data);
  }else{
    //todo: refresh access token
  }
  return userInfo;
}
