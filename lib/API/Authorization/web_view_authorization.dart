import 'package:flutter/material.dart';
import 'package:mal_client_v2/API/Authorization/user_authorization.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
