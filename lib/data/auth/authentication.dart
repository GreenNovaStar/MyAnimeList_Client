import 'dart:io';
import 'dart:math';
import 'dart:developer' as dev;
import 'dart:convert' as convert;

import 'package:android_app/data/exceptions/backend_exception.dart';
import 'package:android_app/data/model/user_type.dart';
import 'package:android_app/providers/auth_provider.dart';
import 'package:android_app/ui/screens/home/home_guest.dart';
import 'package:android_app/ui/screens/home/home_user.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:android_app/data/model/token.dart';
import 'package:android_app/ui/screens/authorization_webview.dart';
import 'package:android_app/utils/env_helper.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

late OAuthToken tokenResponse;
Dio dio = Dio();

/// OAuth tokens are secrets, so they live in the platform keystore/keychain
/// via flutter_secure_storage rather than plaintext SharedPreferences.
/// (userType is not a secret and stays in SharedPreferences.)
const FlutterSecureStorage _secureStorage = FlutterSecureStorage();

/// The whole [OAuthToken] is persisted as one JSON string under this key.
const String _kToken = 'oauthToken';

// Legacy per-field keys from earlier builds, kept only for migration/cleanup.
const List<String> _kLegacyKeys = [
  'tokenType',
  'expiresIn',
  'accessToken',
  'refreshToken',
  'expireDate',
];

/// An empty token, signalling "not signed in".
const OAuthToken _emptyToken = OAuthToken(
  tokenType: "",
  expiresIn: 0,
  accessToken: "",
  refreshToken: "",
);

/**
 * https://myanimelist.net/blog.php?eid=835707
 * How to get the access token
 */

/// #1. Generate a new Code Verifier / Code Challenge.
String generateCodeVerifier() {
  var random = Random.secure();
  var values = List<int>.generate(100, (i) => random.nextInt(255));
  return convert.base64UrlEncode(values).substring(0, 128);
}

/// #2. Print the URL needed to authorize your application.
Uri getAuthorizationUri(String code) {
  return Uri(
    scheme: 'https',
    host: 'myanimelist.net',
    path: '/v1/oauth2/authorize',
    queryParameters: {
      'response_type': 'code',
      'client_id': getEnv("CLIENT_ID"),
      'code_challenge': code,
    },
  );
}

void authorizeUser(BuildContext context, String userType) async {
  if (userType == UserType.GUEST) {
    saveUserType(UserType.GUEST);
    // remove tokens since guest doesn't need tokens
    await removeTokens();
    // navigate to Guest home page
    if (!context.mounted) return;
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (context) => HomePageGuest()));
  } else if (userType == UserType.USER) {
    tokenResponse = await retrieveTokens();
    dev.log("Fetched token from storage: ${tokenResponse.accessToken}");

    // Check if the tokens retrieved from storage is empty
    if (tokenResponse.accessToken.isEmpty) {
      if (!context.mounted) return;
      final bool authorized = await authorizeFirstTimeUser(context);
      // User backed out of the sign-in webview; stay on the landing page.
      if (!authorized) return;
    } else {
      final refreshed = await refreshTokenIfNeeded(tokenResponse);
      if (refreshed != null) tokenResponse = refreshed;
    }

    saveUserType(UserType.USER);
    if (context.mounted) {
      ProviderScope.containerOf(context).read(tokenProvider.notifier).state =
          tokenResponse;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePageUser()),
      );
    }
  }
}

/// POSTs to the MAL token endpoint with the given grant params, stamps the
/// computed [OAuthToken.expireDate], and persists the result. Shared by the
/// initial code exchange and refresh flows. Throws on non-200.
Future<OAuthToken> _requestToken(Map<String, dynamic> grantParams) async {
  Response response = await dio.post(
    'https://myanimelist.net/v1/oauth2/token',
    data: {'client_id': getEnv("CLIENT_ID"), ...grantParams},
    options: Options(contentType: Headers.formUrlEncodedContentType),
  );

  if (response.statusCode != HttpStatus.ok) {
    throw Exception(
      'Get OAuth token failed with status: ${response.statusCode}.',
    );
  }

  OAuthToken token = OAuthToken.fromJson(response.data);
  token = token.copyWith(
    expireDate: DateTime.now()
        .add(Duration(seconds: token.expiresIn))
        .toString(),
  );
  await saveTokens(token);
  return token;
}

/// #5. Exchange authorization code for refresh and access tokens
Future<OAuthToken> getUserToken(String code, String challenge) async {
  try {
    tokenResponse = await _requestToken({
      'code': code,
      'code_verifier': challenge,
      'grant_type': 'authorization_code',
    });
    dev.log(tokenResponse.toString());
    return tokenResponse;
  } catch (e) {
    throw BackendException(message: e.toString());
  }
}

Future<OAuthToken?> refreshUserToken(String refreshToken) async {
  try {
    tokenResponse = await _requestToken({
      'refresh_token': refreshToken,
      'grant_type': 'refresh_token',
    });
    return tokenResponse;
  } catch (e) {
    dev.log('Token refresh error: $e', level: 3);
    return null;
  }
}

Future<void> saveTokens(OAuthToken token) async {
  await _secureStorage.write(
    key: _kToken,
    value: convert.jsonEncode(token.toJson()),
  );
}

Future<OAuthToken> retrieveTokens() async {
  // One-time migration: move tokens written by earlier builds (plaintext
  // SharedPreferences, or the old per-field secure-storage layout) into the
  // single JSON entry. After migration this is a no-op.
  await _migrateLegacyTokens();

  final String? json = await _secureStorage.read(key: _kToken);
  if (json == null) return _emptyToken;
  try {
    return OAuthToken.fromJson(convert.jsonDecode(json));
  } catch (e) {
    dev.log('Stored token is corrupt, discarding: $e', level: 3);
    return _emptyToken;
  }
}

/// Migrates tokens persisted by previous builds into the single JSON
/// secure-storage entry, then removes the old copies:
/// 1. plaintext SharedPreferences (oldest builds) — also a security cleanup;
/// 2. per-field secure-storage keys (previous layout).
Future<void> _migrateLegacyTokens() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  OAuthToken? legacy;
  if (prefs.getString('accessToken') != null) {
    dev.log("Migrating plaintext tokens to secure storage...");
    legacy = OAuthToken(
      tokenType: prefs.getString('tokenType') ?? "",
      expiresIn: prefs.getInt('expiresIn') ?? 0,
      accessToken: prefs.getString('accessToken') ?? "",
      refreshToken: prefs.getString('refreshToken') ?? "",
      expireDate: prefs.getString('expireDate') ?? "",
    );
  }

  // Per-field secure storage is newer than the prefs copy, so it wins.
  final String? secureAccessToken = await _secureStorage.read(
    key: 'accessToken',
  );
  if (secureAccessToken != null) {
    dev.log("Migrating per-field tokens to single JSON entry...");
    legacy = OAuthToken(
      tokenType: await _secureStorage.read(key: 'tokenType') ?? "",
      expiresIn:
          int.tryParse(await _secureStorage.read(key: 'expiresIn') ?? "") ?? 0,
      accessToken: secureAccessToken,
      refreshToken: await _secureStorage.read(key: 'refreshToken') ?? "",
      expireDate: await _secureStorage.read(key: 'expireDate') ?? "",
    );
  }

  if (legacy == null) return; // nothing to migrate

  await saveTokens(legacy);
  await _removeLegacyTokens();
}

Future<void> _removeLegacyTokens() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  for (final key in _kLegacyKeys) {
    await _secureStorage.delete(key: key);
    await prefs.remove(key);
  }
}

Future<void> removeTokens() async {
  await _secureStorage.delete(key: _kToken);
  // Also clear any lingering copies from older builds.
  await _removeLegacyTokens();
}

Future<void> signOut(BuildContext context) async {
  await removeTokens();
  saveUserType(UserType.FIRST_TIME);
  if (context.mounted) {
    ProviderScope.containerOf(context).read(tokenProvider.notifier).state =
        null;
  }
}

Future<OAuthToken?> refreshTokenIfNeeded(OAuthToken token) async {
  if (token.expireDate.isEmpty) return null;

  if (DateTime.now()
      .add(Duration(days: 3))
      .isAfter(DateTime.parse(token.expireDate))) {
    dev.log("Token is expired or nearing expiration, refreshing token...");
    return await refreshUserToken(token.refreshToken);
  }
  return null;
}

Future<OAuthToken> bootUpFetchTokens() async {
  tokenResponse = await retrieveTokens();
  final refreshed = await refreshTokenIfNeeded(tokenResponse);
  if (refreshed != null) tokenResponse = refreshed;
  return tokenResponse;
}

/// Returns true when the user completed authorization and tokens were obtained.
Future<bool> authorizeFirstTimeUser(BuildContext context) async {
  // Step 1
  String codeChallenge = generateCodeVerifier();
  // Step 2
  Uri uri = getAuthorizationUri(codeChallenge);
  // Step 3: open the webview, which pops back with the authorization code.
  final String? code = await Navigator.of(context).push<String>(
    MaterialPageRoute(builder: (context) => AuthorizationWebView(uri: uri)),
  );

  // User dismissed the webview without authorizing.
  if (code == null || code.isEmpty) {
    return false;
  }

  await getUserToken(code, codeChallenge);
  return true;
}

void saveUserType(String userType) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("userType", userType);
}

Future<UserType> retrieveUserType() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userType = prefs.getString("userType") ?? "";

  return UserType(userType: userType);
}
