import 'package:android_app/data/auth/authentication.dart';
import 'package:android_app/data/model/token.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() {
    // authentication.dart reads CLIENT_ID via getEnv; load a fake env
    // in-memory instead of the real config.env asset.
    dotenv.loadFromString(envString: 'CLIENT_ID=test-client-id');
  });

  group('generateCodeVerifier', () {
    test('is 128 characters (PKCE max length)', () {
      expect(generateCodeVerifier().length, 128);
    });

    test('only contains URL-safe base64 characters', () {
      final verifier = generateCodeVerifier();
      expect(RegExp(r'^[A-Za-z0-9\-_=]+$').hasMatch(verifier), isTrue);
    });

    test('is random per call', () {
      expect(generateCodeVerifier(), isNot(generateCodeVerifier()));
    });
  });

  group('getAuthorizationUri', () {
    test('targets the MAL OAuth authorize endpoint', () {
      final uri = getAuthorizationUri('challenge123');
      expect(uri.scheme, 'https');
      expect(uri.host, 'myanimelist.net');
      expect(uri.path, '/v1/oauth2/authorize');
    });

    test('carries response_type, client_id and code_challenge', () {
      final uri = getAuthorizationUri('challenge123');
      expect(uri.queryParameters['response_type'], 'code');
      expect(uri.queryParameters['client_id'], 'test-client-id');
      expect(uri.queryParameters['code_challenge'], 'challenge123');
    });
  });

  group('refreshTokenIfNeeded', () {
    OAuthToken tokenExpiring(String expireDate) => OAuthToken(
      tokenType: 'Bearer',
      expiresIn: 100,
      accessToken: 'a',
      refreshToken: 'r',
      expireDate: expireDate,
    );

    test('returns null when no expire date is stored', () async {
      expect(await refreshTokenIfNeeded(tokenExpiring('')), isNull);
    });

    test('returns null when the token is not near expiry', () async {
      // Refresh triggers within 3 days of expiry; 30 days out is safe.
      final farFuture = DateTime.now().add(const Duration(days: 30));
      expect(
        await refreshTokenIfNeeded(tokenExpiring(farFuture.toString())),
        isNull,
      );
    });
  });
}
