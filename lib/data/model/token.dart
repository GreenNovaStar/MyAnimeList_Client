import 'package:freezed_annotation/freezed_annotation.dart';

part 'token.freezed.dart';
part 'token.g.dart';

/// OAuth2 token set. `expireDate` is not part of the MAL token response — it is
/// computed locally (now + expiresIn) and persisted, so it defaults to "".
@freezed
abstract class OAuthToken with _$OAuthToken {
  const factory OAuthToken({
    required String tokenType,
    required int expiresIn,
    required String accessToken,
    required String refreshToken,
    @Default('') String expireDate,
  }) = _OAuthToken;

  factory OAuthToken.fromJson(Map<String, dynamic> json) =>
      _$OAuthTokenFromJson(json);
}
