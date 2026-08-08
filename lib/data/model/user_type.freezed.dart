// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserType {

 String get userType;
/// Create a copy of UserType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserTypeCopyWith<UserType> get copyWith => _$UserTypeCopyWithImpl<UserType>(this as UserType, _$identity);

  /// Serializes this UserType to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserType&&(identical(other.userType, userType) || other.userType == userType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userType);

@override
String toString() {
  return 'UserType(userType: $userType)';
}


}

/// @nodoc
abstract mixin class $UserTypeCopyWith<$Res>  {
  factory $UserTypeCopyWith(UserType value, $Res Function(UserType) _then) = _$UserTypeCopyWithImpl;
@useResult
$Res call({
 String userType
});




}
/// @nodoc
class _$UserTypeCopyWithImpl<$Res>
    implements $UserTypeCopyWith<$Res> {
  _$UserTypeCopyWithImpl(this._self, this._then);

  final UserType _self;
  final $Res Function(UserType) _then;

/// Create a copy of UserType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userType = null,}) {
  return _then(_self.copyWith(
userType: null == userType ? _self.userType : userType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserType].
extension UserTypePatterns on UserType {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserType value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserType() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserType value)  $default,){
final _that = this;
switch (_that) {
case _UserType():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserType value)?  $default,){
final _that = this;
switch (_that) {
case _UserType() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserType() when $default != null:
return $default(_that.userType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userType)  $default,) {final _that = this;
switch (_that) {
case _UserType():
return $default(_that.userType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userType)?  $default,) {final _that = this;
switch (_that) {
case _UserType() when $default != null:
return $default(_that.userType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserType implements UserType {
  const _UserType({required this.userType});
  factory _UserType.fromJson(Map<String, dynamic> json) => _$UserTypeFromJson(json);

@override final  String userType;

/// Create a copy of UserType
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserTypeCopyWith<_UserType> get copyWith => __$UserTypeCopyWithImpl<_UserType>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserTypeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserType&&(identical(other.userType, userType) || other.userType == userType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userType);

@override
String toString() {
  return 'UserType(userType: $userType)';
}


}

/// @nodoc
abstract mixin class _$UserTypeCopyWith<$Res> implements $UserTypeCopyWith<$Res> {
  factory _$UserTypeCopyWith(_UserType value, $Res Function(_UserType) _then) = __$UserTypeCopyWithImpl;
@override @useResult
$Res call({
 String userType
});




}
/// @nodoc
class __$UserTypeCopyWithImpl<$Res>
    implements _$UserTypeCopyWith<$Res> {
  __$UserTypeCopyWithImpl(this._self, this._then);

  final _UserType _self;
  final $Res Function(_UserType) _then;

/// Create a copy of UserType
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userType = null,}) {
  return _then(_UserType(
userType: null == userType ? _self.userType : userType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
