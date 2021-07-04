import 'dart:async';
import 'package:flutter/material.dart';
import 'package:myanimelist_client/page1.dart';
import 'package:myanimelist_client/user_authorization.dart';

import 'package:myanimelist_client/json_mock_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      home: LoadingPage(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("[Logo]"),
      ),
      // body: Page1(),
      body: const Center(child: Text("Hello World")),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: size.height * 0.05,),
              Container(
                width: size.width/1.5,
                height: size.width/1.5,
                color: Colors.greenAccent,
                child: const Center(child: Text("[Logo]")),
              ),
              TextButton(
                onPressed: () {
                  authorizeUser(context);
                },
                child: const Text("Login to MyAnimeList"),
              ),
              SizedBox(height: size.height * 0.05,),
            ],
          ),
        ),
      ),
    );
  }
}

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  late bool loggedIn;

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    isUserAuthenticated().then((value) {
      loggedIn = value;
    });
    Timer(const Duration(seconds: 2), onClose);
  }

  void onClose() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => loggedIn ? HomePage() : LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Loading")));
  }
}
