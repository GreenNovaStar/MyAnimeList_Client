import 'dart:async';
import 'dart:convert' as convert;
// import 'dart:html' as html;
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mal_client_v2/API/Authorization/web_view_authorization.dart';
import 'package:mal_client_v2/Extension_Methods/string_extension.dart';
import 'package:mal_client_v2/Screens/HomePage/User/home_page.dart';
import 'package:mal_client_v2/Screens/Loading/loading_after_auth.dart';
import 'package:mal_client_v2/Screens/Settings/Header/header_settings.dart';
import 'package:mal_client_v2/User/user_const.dart';
import 'package:mal_client_v2/main.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mal_client_v2/API/Authorization/authorization_class.dart';

String clientID = "";
late String codeResponse;
late TokenResponse tokenResponse;

final BaseOptions _options = BaseOptions(
  baseUrl: "https://api.myanimelist.net/v2",
  connectTimeout: 5000,
  receiveTimeout: 3000,
  headers: {},
  contentType: "application/json",
);

void authorizeUser(BuildContext context) async {
  tokenResponse = await retrieveTokens();
  if (tokenResponse.token_type == "") {
    String _codeChallenge = generateCodeVerifier(); //step 1
    String _url = printNewAuthorizationUrl(_codeChallenge); //step 2
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AuthorizationWebView(url: _url);

      // if (Platform.isAndroid) {
      // } else if (kIsWeb) {
      //   html.window.open(_url, "MAL Auth");
      // }
    })).then((value) {
      //step 3, 4 and 5
      // print("code response = " + codeResponse);
      getUserToken(codeResponse, _codeChallenge); //Step  6
      // print("User authorized by webview");
      // print("access token: ${tokenResponse.access_token}");
      skippedLogin = false;
      SaveSkippedLoginValue(skippedLogin);
      setHeaderState(context, true);
    });
  } else {
    print("User authorized by shared preferences");
    checkToken(tokenResponse);
    // print("access token: ${tokenResponse.access_token}");
    skippedLogin = false;
    SaveSkippedLoginValue(skippedLogin);
    setHeaderState(context, true);
  }

  // Navigator.pushReplacement(
  //   context,
  //   MaterialPageRoute(
  //     builder: (context) => const LoadingAfterAuth(),
  //   ),
  // );

  // * IMPORTANT MUST FIX
  // todo: token response is empty after being authorized.
  if (tokenResponse.access_token.isEmpty) {
    Future.delayed(const Duration(seconds: 10));
    print("[if] Access token is ${tokenResponse.access_token}");
  } else {
    print("[else] Access token is ${tokenResponse.access_token}");
  }

  // skippedLogin = false;
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // prefs.setBool("skippedLogin", false);
  // HeaderProvider headerProvider =
  //     Provider.of<HeaderProvider>(context, listen: false);
  // headerProvider.setHeader(true);

  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const HomePageUser()));

  // print("User authorized");
  // print("access token: ${tokenResponse.access_token}");
}

/// #1. Generate a new Code Verifier / Code Challenge.
String generateCodeVerifier() {
  var random = Random.secure();
  var values = List<int>.generate(100, (i) => random.nextInt(255));
  // print(convert.base64UrlEncode(values).substring(0, 128));
  return convert.base64UrlEncode(values).substring(0, 128);
}

/// #2. Print the URL needed to authorise your application.
String printNewAuthorizationUrl(String code) {
  var url =
      'https://myanimelist.net/v1/oauth2/authorize?response_type=code&client_id=$clientID&code_challenge=$code';
  // var url = Uri.http('myanimelist.net', '/v1/oauth2/authorize', {
  //   'response_type': 'code',
  //   'client_id': clientID,
  //   'code_challenge': code,
  //   'redirect_uri': 'http',
  // });
  // print("Authorize your application by clicking here: $url\n");
  return url;
}

/// #6. Exchange authorization code for refresh and access tokens
void getUserToken(String code, String challenge) async {
  String _authorizationCode = code;
  String _codeChallenge = challenge;
  final Dio dio = Dio();
  Response response;

  response = await dio.post(
    'https://myanimelist.net/v1/oauth2/token',
    data: {
      'client_id': clientID,
      'code': _authorizationCode,
      'code_verifier': _codeChallenge,
      'grant_type': 'authorization_code'
    },
    options: Options(contentType: Headers.formUrlEncodedContentType),
  );

  if (response.statusCode == 200) {
    // print("response = " + response.data.toString());
    tokenResponse = TokenResponse.fromJson(response.data);
    tokenResponse.expire_date = DateTime.now()
        .add(Duration(seconds: tokenResponse.expires_in))
        .toString()
        .dateSubString();
    // print("token response access token = ${tokenResponse.access_token}");
    saveTokens(tokenResponse);
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

void saveTokens(TokenResponse token) async {
  ///Debug token values before sending it into shared preferences
  // print("[saveTokens] accessToken = ${token.access_token}");
  // print("[saveTokens] expiresIn = ${token.expires_in}");
  // print("[saveTokens] refreshToken = ${token.refresh_token}");
  // print("[saveTokens] expireDate = ${token.expire_date}");

  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('tokenType', token.token_type);
  prefs.setInt('expiresIn', token.expires_in);
  prefs.setString('accessToken', token.access_token);
  prefs.setString('refreshToken', token.refresh_token);
  prefs.setString('expireDate', token.expire_date);
}

Future<TokenResponse> retrieveTokens() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String tokenType = prefs.getString('tokenType') ?? "";
  int expiresIn = prefs.getInt('expiresIn') ?? 0;
  String accessToken = prefs.getString('accessToken') ?? "";
  String refreshToken = prefs.getString('refreshToken') ?? "";
  String expireDate = prefs.getString('expireDate') ?? "";

  ///Debug token values returned from shared preferences
  // print("[retrieveTokens] accessToken = $accessToken");
  // print("[retrieveTokens] expiresIn = $expiresIn");
  // print("[retrieveTokens] refreshToken = $refreshToken");
  // print("[retrieveTokens] expireDate = $expireDate");

  TokenResponse localData = TokenResponse(
      token_type: tokenType,
      expires_in: expiresIn,
      access_token: accessToken,
      refresh_token: refreshToken,
      expire_date: expireDate);
  return localData;
}

Future<bool> isUserAuthenticated() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String tokenType = prefs.getString('tokenType') ?? "";
  if (tokenType.isEmpty) {
    return false;
  } else {
    return true;
  }
}

bool isUserAuthorized() {
  bool val = false;
  isUserAuthenticated().then((value) {
    val = value;
  });
  return val;
}

void UserSignOut(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('tokenType');
  prefs.remove('expiresIn');
  prefs.remove('accessToken');
  prefs.remove('refreshToken');
  Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
}

void SaveSkippedLoginValue(bool val) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool("skippedLogin", val);
}

void refreshAccessToken() async {
  final Dio dio = Dio();
  Response response;
  print("Previous access token: ${tokenResponse.access_token}");
  response = await dio.post(
    'https://myanimelist.net/v1/oauth2/token',
    data: {
      'client_id': clientID,
      'grant_type': "refresh_token",
      'refresh_token': tokenResponse.refresh_token,
    },
    options: Options(contentType: Headers.formUrlEncodedContentType),
  );

  if (response.statusCode == 200) {
    tokenResponse = TokenResponse.fromJson(response.data);
    tokenResponse.expire_date = DateTime.now().toString().dateSubString();
    print("New access token: ${tokenResponse.access_token}");
    print("New expire date: ${tokenResponse.expire_date}");
    saveTokens(tokenResponse);
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

void checkToken(TokenResponse token) {
  if (token.expire_date.isDateExpired()) {
    print(
        "Date Now = ${DateTime.now().toString().dateSubString()} and Token Reponse Date = ${token.expire_date}");
    refreshAccessToken();
  }
}
