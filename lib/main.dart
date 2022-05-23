import 'package:flutter/material.dart';
import 'package:mal_client_v2/Screens/HomePage/Guest/guest_page.dart';
import 'package:mal_client_v2/Screens/HomePage/User/home_page.dart';
import 'package:mal_client_v2/Screens/Settings/Header/header_provider.dart';
import 'package:mal_client_v2/Theme_Data/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'API/Authorization/user_authorization.dart';
import 'package:mal_client_v2/User/user_const.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "FLUTTER_ENV.env");
  clientID = dotenv.env['CLIENT_ID'] ?? "";
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int _themeIndex = prefs.getInt('themeIndex') ?? 0;
  bool _isHeaderVisible = prefs.getBool('headerVisibility') ?? true;
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (BuildContext context) {
          return ThemeProvider(themeIndex: _themeIndex);
        },
      ),
      ChangeNotifierProvider(
        create: (BuildContext context) {
          return HeaderProvider(headerVisible: _isHeaderVisible);
        },
      ),
    ],
    child: const MyApp(),
  ));
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: themeProvider.getTheme,
        home: LoadingPage(),
      );
    });
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              Container(
                width: size.width / 1.5,
                height: size.width / 1.5,
                color: Colors.greenAccent,
                child: const Center(
                  child: FittedBox(child: Text("[Logo]")),
                ),
              ),
              TextButton(
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setBool("skippedLogin", false);
                  authorizeUser(context);
                },
                child: const Text("Login to MyAnimeList"),
              ),
              TextButton(
                onPressed: () async {
                  skippedLogin = true;
                  HeaderProvider headerProvider =
                      Provider.of<HeaderProvider>(context, listen: false);
                  bool isHeaderVisible = false;
                  headerProvider.setHeader(isHeaderVisible);

                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setBool("skippedLogin", true);

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePageGuest(),
                    ),
                  );
                },
                child: const Text("Sign in as Guest"),
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
  // late bool skippedLogin;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isUserAuthenticated().then((value) {
      loggedIn = value;
      skippedLoginPrev();
    }).then((value) => onClose());
    // Timer(const Duration(seconds: 2), onClose);
  }

  void skippedLoginPrev() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    skippedLogin = prefs.getBool("skippedLogin") ?? false;
  }

  void onClose() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) =>
            (loggedIn || skippedLogin) ? const HomePageUser() : LoginPage()));
    // (loggedIn || skippedLogin) ? const HomePageV2() : LoginPage()));
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
