import 'dart:async';
import 'dart:convert' as convert;
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myanimelist_client/API/Authorization/authorization_class.dart';

import '../../main.dart';

String clientID = "your_client_id_or_secret";
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
    await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AuthorizationWebView(url: _url)))
        .then((value) {
      //step 3, 4 and 5
      print("code response = " + codeResponse);
      getUserToken(codeResponse, _codeChallenge); //Step  6
      print("User authorized by webview");
      print("access token: ${tokenResponse.access_token}");
    });
  } else {
    print("User authorized by shared preferences");
    print("access token: ${tokenResponse.access_token}");
  }
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => HomePage()));
  // print("User authorized");
  // print("access token: ${tokenResponse.access_token}");
}

/// #1. Generate a new Code Verifier / Code Challenge.
String generateCodeVerifier() {
  var random = Random.secure();
  var values = List<int>.generate(100, (i) => random.nextInt(255));
  print(convert.base64UrlEncode(values).substring(0, 128));
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
  print("Authorize your application by clicking here: $url\n");
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
    // print("token response access token = ${tokenResponse.access_token}");
    saveTokens(tokenResponse);
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

void saveTokens(TokenResponse token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('tokenType', token.token_type);
  prefs.setInt('expiresIn', token.expires_in);
  prefs.setString('accessToken', token.access_token);
  prefs.setString('refreshToken', token.refresh_token);
}

Future<TokenResponse> retrieveTokens() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String tokenType = prefs.getString('tokenType') ?? "";
  int expiresIn = prefs.getInt('expiresIn') ?? 0;
  String accessToken = prefs.getString('accessToken') ?? "";
  String refreshToken = prefs.getString('refreshToken') ?? "";
  TokenResponse localData = TokenResponse(
      token_type: tokenType,
      expires_in: expiresIn,
      access_token: accessToken,
      refresh_token: refreshToken);
  return localData;
}

Future<bool> isUserAuthenticated() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String tokenType = prefs.getString('tokenType') ?? "";
  if (tokenType == "") {
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

class AuthorizationWebView extends StatefulWidget {
  String url;
  AuthorizationWebView({required this.url});
  @override
  _AuthorizationWebViewState createState() => _AuthorizationWebViewState();
}

class _AuthorizationWebViewState extends State<AuthorizationWebView> {
  @override
  Widget build(BuildContext context) {
    Uri responseUrl;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Authorize with MyAnimeList"),
      ),
      body: SafeArea(
        child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: widget.url,
          navigationDelegate: (navReq) {
            if (navReq.url.startsWith("https://myanimelist.net/?code=")) {
              // print("in here url = ${navReq.url}");
              codeResponse = navReq.url.substring(30);
              // print("codeResponse url = $codeResponse");
              responseUrl = Uri.parse(navReq.url);
              Navigator.pop(context);
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      ),
    );
  }
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
