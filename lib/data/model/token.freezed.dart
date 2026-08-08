// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OAuthToken {

 String get tokenType; int get expiresIn; String get accessToken; String get refreshToken; String get expireDate;
/// Create a copy of OAuthToken
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OAuthTokenCopyWith<OAuthToken> get copyWith => _$OAuthTokenCopyWithImpl<OAuthToken>(this as OAuthToken, _$identity);

  /// Serializes this OAuthToken to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OAuthToken&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.expireDate, expireDate) || other.expireDate == expireDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tokenType,expiresIn,accessToken,refreshToken,expireDate);

@override
String toString() {
  return 'OAuthToken(tokenType: $tokenType, expiresIn: $expiresIn, accessToken: $accessToken, refreshToken: $refreshToken, expireDate: $expireDate)';
}


}

/// @nodoc
abstract mixin class $OAuthTokenCopyWith<$Res>  {
  factory $OAuthTokenCopyWith(OAuthToken value, $Res Function(OAuthToken) _then) = _$OAuthTokenCopyWithImpl;
@useResult
$Res call({
 String tokenType, int expiresIn, String accessToken, String refreshToken, String expireDate
});




}
/// @nodoc
class _$OAuthTokenCopyWithImpl<$Res>
    implements $OAuthTokenCopyWith<$Res> {
  _$OAuthTokenCopyWithImpl(this._self, this._then);

  final OAuthToken _self;
  final $Res Function(OAuthToken) _then;

/// Create a copy of OAuthToken
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tokenType = null,Object? expiresIn = null,Object? accessToken = null,Object? refreshToken = null,Object? expireDate = null,}) {
  return _then(_self.copyWith(
tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,expireDate: null == expireDate ? _self.expireDate : expireDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OAuthToken].
extension OAuthTokenPatterns on OAuthToken {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OAuthToken value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OAuthToken() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OAuthToken value)  $default,){
final _that = this;
switch (_that) {
case _OAuthToken():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OAuthToken value)?  $default,){
final _that = this;
switch (_that) {
case _OAuthToken() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tokenType,  int expiresIn,  String accessToken,  String refreshToken,  String expireDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OAuthToken() when $default != null:
return $default(_that.tokenType,_that.expiresIn,_that.accessToken,_that.refreshToken,_that.expireDate);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tokenType,  int expiresIn,  String accessToken,  String refreshToken,  String expireDate)  $default,) {final _that = this;
switch (_that) {
case _OAuthToken():
return $default(_that.tokenType,_that.expiresIn,_that.accessToken,_that.refreshToken,_that.expireDate);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tokenType,  int expiresIn,  String accessToken,  String refreshToken,  String expireDate)?  $default,) {final _that = this;
switch (_that) {
case _OAuthToken() when $default != null:
return $default(_that.tokenType,_that.expiresIn,_that.accessToken,_that.refreshToken,_that.expireDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OAuthToken implements OAuthToken {
  const _OAuthToken({required this.tokenType, required this.expiresIn, required this.accessToken, required this.refreshToken, this.expireDate = ''});
  factory _OAuthToken.fromJson(Map<String, dynamic> json) => _$OAuthTokenFromJson(json);

@override final  String tokenType;
@override final  int expiresIn;
@override final  String accessToken;
@override final  String refreshToken;
@override@JsonKey() final  String expireDate;

/// Create a copy of OAuthToken
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OAuthTokenCopyWith<_OAuthToken> get copyWith => __$OAuthTokenCopyWithImpl<_OAuthToken>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OAuthTokenToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OAuthToken&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.expireDate, expireDate) || other.expireDate == expireDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tokenType,expiresIn,accessToken,refreshToken,expireDate);

@override
String toString() {
  return 'OAuthToken(tokenType: $tokenType, expiresIn: $expiresIn, accessToken: $accessToken, refreshToken: $refreshToken, expireDate: $expireDate)';
}


}

/// @nodoc
abstract mixin class _$OAuthTokenCopyWith<$Res> implements $OAuthTokenCopyWith<$Res> {
  factory _$OAuthTokenCopyWith(_OAuthToken value, $Res Function(_OAuthToken) _then) = __$OAuthTokenCopyWithImpl;
@override @useResult
$Res call({
 String tokenType, int expiresIn, String accessToken, String refreshToken, String expireDate
});




}
/// @nodoc
class __$OAuthTokenCopyWithImpl<$Res>
    implements _$OAuthTokenCopyWith<$Res> {
  __$OAuthTokenCopyWithImpl(this._self, this._then);

  final _OAuthToken _self;
  final $Res Function(_OAuthToken) _then;

/// Create a copy of OAuthToken
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tokenType = null,Object? expiresIn = null,Object? accessToken = null,Object? refreshToken = null,Object? expireDate = null,}) {
  return _then(_OAuthToken(
tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,expireDate: null == expireDate ? _self.expireDate : expireDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
