import 'dart:async';
import 'package:flutter/material.dart';
import 'package:myanimelist_client/API/User/user_class.dart';
import 'package:myanimelist_client/Anime_Page/search_page.dart';
import 'package:myanimelist_client/page1.dart';
import 'package:myanimelist_client/profile_page.dart';
import 'API/Authorization/user_authorization.dart';
import 'package:myanimelist_client/User/user_const.dart';

import 'API/User/user_anime_statistics_class.dart';
import 'API/User/user_api_calls.dart';

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
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User userInfo = defaultUser;

  @override
  void initState() {
    super.initState();
    getUserDetails().then((value) => userInfo = value).whenComplete(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // getUserDetails().then((value) => userInfo = value);
    return Scaffold(
      appBar: AppBar(
        title: const Text("[Logo]"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded),
            onPressed: () => showSearch(
              context: context,
              delegate: AnimeSearch(),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.bookmark_border_rounded),
            onPressed: () {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: const Text(
                        "To Be Implemented:\nAbility to view your anime list"),
                    action: SnackBarAction(
                      label: "Dismiss",
                      onPressed: () =>
                          ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                    )),
              );
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: InkWell(
                onTap: () async {
                  Navigator.pop(context);
                  getUserDetails().then(
                    (value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(user: value),
                      ),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: CircleAvatar(
                        // child: Icon(Icons.person),
                        foregroundImage: NetworkImage(userInfo.picture),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(userInfo.name),
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                getUserDetails().then(
                  (value) => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(user: value),
                    ),
                  ),
                );
              },
              child: const Text("View Profile"),
            ),
            TextButton(
              onPressed: () => UserSignOut(context),
              child: const Text("Sign Out"),
            )
          ],
        ),
      ),
      body: Page1(),
      // body: const Center(child: Text("Hello World")),
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
              SizedBox(
                height: size.height * 0.05,
              ),
              Container(
                width: size.width / 1.5,
                height: size.width / 1.5,
                color: Colors.greenAccent,
                child: Center(
                  child: GestureDetector(
                    onDoubleTap: () {
                      saveTokens(devToken);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              "Bypassed Authorization through Dev Backdoor"),
                        ),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                    child: Text("[Logo]"),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  authorizeUser(context);
                },
                child: const Text("Login to MyAnimeList"),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
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
  void initState() {
    // TODO: implement initState
    super.initState();
    isUserAuthenticated().then((value) {
      loggedIn = value;
    });
    Timer(const Duration(seconds: 2), onClose);
  }

  void onClose() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => loggedIn ? HomePage() : LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        // child: Text("Loading"),
        child: CircularProgressIndicator(),
      ),
    );
  }
}
