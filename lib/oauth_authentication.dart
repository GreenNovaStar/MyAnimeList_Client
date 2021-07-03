import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myanimelist_client/user_authorization.dart';
import 'package:uni_links/uni_links.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';

class OAuthAuthentication extends StatelessWidget {
  void authorizeUser() async {
    String _codeChallenge = generateCodeVerifier();
    String _url = printNewAuthorizationUrl(_codeChallenge);
    await createClient(_url);
    //authenticate(_url);
  }

  void authenticate(String url) async {
    // Present the dialog to the user
    final result = await FlutterWebAuth.authenticate(
      url: url,
      callbackUrlScheme: "malc",
    );

// Extract token from resulting url
    final token = Uri.parse(result);
    String at = token.fragment;
    at = "http://website/index.html?$at"; // Just for easy persing
    var accesstoken = Uri.parse(at).queryParameters['code'];
    print('token');
    print(accesstoken);
  }

  var authorizationEndpoint =
      Uri.parse('https://myanimelist.net/v1/oauth2/authorize');
  final tokenEndpoint = Uri.parse('https://myanimelist.net/v1/oauth2/token');
  final identifier = clientID;
  // final secret = 'my client secret';

  final redirectUrl = Uri.parse('https://myanimelist.net');

  // final credentialsFile = File('~/.myapp/credentials.json');

  Future<oauth2.Client> createClient(String url) async {
    // var exists = await credentialsFile.exists();
    // authorizationEndpoint = Uri.parse(url);
    // If the OAuth2 credentials have already been saved from a previous run, we
    // just want to reload them.
    // if (exists) {
    //   var credentials =
    //       oauth2.Credentials.fromJson(await credentialsFile.readAsString());
    //   return oauth2.Client(credentials, identifier: identifier);
    // }

    // If we don't have OAuth2 credentials yet, we need to get the resource owner
    // to authorize us. We're assuming here that we're a command-line application.
    var grant = oauth2.AuthorizationCodeGrant(
        identifier, authorizationEndpoint, tokenEndpoint);

    // A URL on the authorization server (authorizationEndpoint with some additional
    // query parameters). Scopes and state can optionally be passed into this method.
    var authorizationUrl = grant.getAuthorizationUrl(redirectUrl);

    // Redirect the resource owner to the authorization URL. Once the resource
    // owner has authorized, they'll be redirected to `redirectUrl` with an
    // authorization code. The `redirect` should cause the browser to redirect to
    // another URL which should also have a listener.
    //
    // `redirect` and `listen` are not shown implemented here. See below for the
    // details.
    await redirect(authorizationUrl);
    var responseUrl = await listen(redirectUrl);

    // Once the user is redirected to `redirectUrl`, pass the query parameters to
    // the AuthorizationCodeGrant. It will validate them and extract the
    // authorization code to create a new Client.
    print(
        "Before grant.handleAuthorizationResponse(responseUrl.queryParameters)");
    return await grant.handleAuthorizationResponse(responseUrl.queryParameters);
  }

  Future<void> redirect(Uri url) async {
    print("In redirect function, url is $url");
  }

  Future<Uri> listen(Uri url) async {
    print("In listen function, url is $url");
    final linksStream = linkStream.listen((String? link) {
      if (link != null || link!.isNotEmpty) {
        print("link = " + link);
      }
    }, onError: (err) {
      print("Error: $err");
    });
    //         (Uri uri) async {
    //   if (uri.toString().startsWith(redirectUrl)) {
    //     responseUrl = uri;
    //   }
    // });
    return url;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text("Authorize User"),
      onPressed: () => authorizeUser(),
    );
  }
}
