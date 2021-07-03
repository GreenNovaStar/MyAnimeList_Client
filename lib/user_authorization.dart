import 'dart:convert' as convert;
// import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'dart:io';
// import 'package:oauth2/oauth2.dart' as oauth2;
// import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:myanimelist_client/oauth_authentication.dart';

String clientID = "a89850dc68b67d40d2d91988cbb0c4e5";

// void authorizeUser(BuildContext context) async {
//   String _codeChallenge = generateCodeVerifier();
//   String _url = printNewAuthorizationUrl(_codeChallenge);
//
//   // authenticate();
//
//   // launch(_url);
//
//   // if (await canLaunch(_url)) {
//   //   launch(_url);
//   //   // await launch(_url).then((_) {
//   //   //   // var url = window.location.href;
//   //   //   var url = Uri.base.origin;
//   //   //   String auth_code = "";
//   //   //   if (url.contains('?code=')) {
//   //   //     int index = url.indexOf('=');
//   //   //     auth_code = url.substring(index);
//   //   //   } else {
//   //   //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//   //   //       content: Text("Unable to authenticate user."),
//   //   //     ));
//   //   //   }
//   //   //   return auth_code.isNotEmpty ? auth_code : null;
//   //   // });
//   // } else {
//   //   print("could not launch url");
//   // }
//
//   // await Navigator.push(
//   //   context,
//   //   MaterialPageRoute(
//   //     builder: (context) => AuthorizationWebView(
//   //       url: _url,
//   //     ),
//   //   ),
//   // ).then((value) => getUserToken(_codeChallenge));
//   // getUserToken(_codeChallenge);
//   //return _url;
// }

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

void getUserToken(String code) async {
  String _authorizationCode =
      "def5020071d326c9a7e7057eb110f7b874ddfb39980edf715600285e558bff40d02461cf509c07f501e732f09703c3c784341cc0178f8ca8668755fd9df56dc3158edcbcb69f7e929ac29a6b2c66eddc45694e26f83a13c1d2e43edac0adf3e94038e1de1b94c97455f8ff94944ab3ecb4883e22c93d8727ebf34694aa7af43a387606ce483fe443a56baf7c5b3be44cbea9c233bacf732cb183334ddffb410fd80352cc84a598664e95285b9bf0439642cceb40050f28bd9be13e2773b76ea970e1b9320818146f9d10269c4b40b17d2736b6b2beb8e9e6cb7e4afa7ff8bbe59d5026ac80554d2a7204f754f85f5761af5886e1e849dea55d2ebe366de2b55ba0ab4e36d7a48911d51bff1d980534f0ff9df7a69d4b22d13ec3b81729b24f81af8b52d54e1b3272c6d9d289eee58d2cb34f422be9331cc1e4d0ecf87940733f1abc319db1012791ba4157460119569a760133a133ea9bd18fd78ca9b93588c005748e3bf3a8d09e20a818093de9627c48b7e6cc177db59253dad128702e7851d3e3bc5f2b661c95d86bfada32a230061168c3ab2f9af353d841c7a6ae3dc9a465d0a4503f8640df22d5cc1868729fdf9c1aadc11c614595b9a612edc25f518d502e2b230ad87164fda1c215d270bf30c27082611b5bfeb9b083c991be1ce101da8f7289d3e83dbb8c";
  print(code);
  var url = Uri.https('myanimelist.net', '/v1/oauth2/token', {
    'client_id': clientID,
    'code': _authorizationCode,
    'code_verifier': code,
    'grant_type': 'authorization_code'
  });

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    var accessToken = jsonResponse['access_token'];
    print('Top Anime: $accessToken.');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

void GetAnimeRanking() async {
  // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview
  var url = Uri.https('api.myanimelist.net', '/v2/anime/ranking', {
    'Authorization':
        'def5020071d326c9a7e7057eb110f7b874ddfb39980edf715600285e558bff40d02461cf509c07f501e732f09703c3c784341cc0178f8ca8668755fd9df56dc3158edcbcb69f7e929ac29a6b2c66eddc45694e26f83a13c1d2e43edac0adf3e94038e1de1b94c97455f8ff94944ab3ecb4883e22c93d8727ebf34694aa7af43a387606ce483fe443a56baf7c5b3be44cbea9c233bacf732cb183334ddffb410fd80352cc84a598664e95285b9bf0439642cceb40050f28bd9be13e2773b76ea970e1b9320818146f9d10269c4b40b17d2736b6b2beb8e9e6cb7e4afa7ff8bbe59d5026ac80554d2a7204f754f85f5761af5886e1e849dea55d2ebe366de2b55ba0ab4e36d7a48911d51bff1d980534f0ff9df7a69d4b22d13ec3b81729b24f81af8b52d54e1b3272c6d9d289eee58d2cb34f422be9331cc1e4d0ecf87940733f1abc319db1012791ba4157460119569a760133a133ea9bd18fd78ca9b93588c005748e3bf3a8d09e20a818093de9627c48b7e6cc177db59253dad128702e7851d3e3bc5f2b661c95d86bfada32a230061168c3ab2f9af353d841c7a6ae3dc9a465d0a4503f8640df22d5cc1868729fdf9c1aadc11c614595b9a612edc25f518d502e2b230ad87164fda1c215d270bf30c27082611b5bfeb9b083c991be1ce101da8f7289d3e83dbb8c'
  });
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    var topAnime = jsonResponse['data']['node']['title'];
    print('Top Anime: $topAnime.');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

// class AuthorizationWebView extends StatefulWidget {
//   String url;
//   AuthorizationWebView({required this.url});
//   @override
//   _AuthorizationWebViewState createState() => _AuthorizationWebViewState();
// }
//
// class _AuthorizationWebViewState extends State<AuthorizationWebView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: WebView(
//           initialUrl: widget.url,
//         ),
//       ),
//     );
//   }
// }
