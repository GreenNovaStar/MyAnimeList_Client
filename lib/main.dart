import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:oauth2/oauth2.dart' as oauth2;

import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class HomePage extends StatelessWidget {
  /// #1. Generate a new Code Verifier / Code Challenge.
  String generateCodeVerifier() {
    var random = Random.secure();
    var values = List<int>.generate(100, (i) => random.nextInt(255));
    print(base64UrlEncode(values).substring(0, 128));
    return base64UrlEncode(values).substring(0, 128);
  }

  /// #2. Print the URL needed to authorise your application.
  void printNewAuthorizationUrl() {
    String _clientID = "a89850dc68b67d40d2d91988cbb0c4e5";
    String _codeChallenge =
        "C8tH7kXlJ7vRvHmwlt5zIGtcTr1TjFeWrWl0XZtkBbfGAvriadvr38r5NNiWHfhMfVwmOL5t5EehKYtF-yJY07YUj5G2KwkyUXQ1X4x0IkF7AYDOyzCyKhV9Xj9lDuel";
    var url =
        'https://api.myanimelist.net/v2/oauth2/authorize?response_type=code&client_id=$_clientID&code_challenge=$_codeChallenge';
    print("Authorise your application by clicking here: $url\n");
  }

  void GetAnimeRanking() async {
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    var url = Uri.https('https://api.myanimelist.net/v2', '/anime/ranking',
        {'q': '{http}', 'Authorization': 'a89850dc68b67d40d2d91988cbb0c4e5'});

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  // void GetAnimeRanking() async {
  //   // This example uses the Google Books API to search for books about http.
  //   // https://developers.google.com/books/docs/overview
  //   var url = Uri.https('https://api.myanimelist.net/v2', '/anime/ranking',
  //       {'q': '{http}', 'Authorization': 'a89850dc68b67d40d2d91988cbb0c4e5'});
  //
  //   // Await the http get response, then decode the json-formatted response.
  //   var response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     var jsonResponse =
  //         convert.jsonDecode(response.body) as Map<String, dynamic>;
  //     var itemCount = jsonResponse['totalItems'];
  //     print('Number of books about http: $itemCount.');
  //   } else {
  //     print('Request failed with status: ${response.statusCode}.');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("[Logo]"),
      ),
      body: Center(
        child: Text("Hello World"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => printNewAuthorizationUrl(),
      ),
    );
  }
}
