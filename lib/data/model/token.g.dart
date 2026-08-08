// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OAuthToken _$OAuthTokenFromJson(Map<String, dynamic> json) => _OAuthToken(
  tokenType: json['token_type'] as String,
  expiresIn: (json['expires_in'] as num).toInt(),
  accessToken: json['access_token'] as String,
  refreshToken: json['refresh_token'] as String,
  expireDate: json['expire_date'] as String? ?? '',
);

Map<String, dynamic> _$OAuthTokenToJson(_OAuthToken instance) =>
    <String, dynamic>{
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'expire_date': instance.expireDate,
    };
