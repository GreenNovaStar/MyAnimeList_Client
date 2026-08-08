import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AuthorizationWebView extends StatefulWidget {
  final Uri uri;
  const AuthorizationWebView({super.key, required this.uri});

  @override
  State<AuthorizationWebView> createState() => _AuthorizationWebViewState();
}

class _AuthorizationWebViewState extends State<AuthorizationWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith("https://myanimelist.net/?code=")) {
              final String code =
                  Uri.parse(request.url).queryParameters['code'] ?? '';
              Navigator.pop(context, code);
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(widget.uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Authenticate with MyAnimeList')),
      body: WebViewWidget(controller: _controller),
    );
  }
}
