// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfile {

 int? get id; String? get name; String? get picture; String? get gender; String? get birthday; String? get location; String? get joinedAt; String? get timeZone; bool? get isSupporter; AnimeStatistics? get animeStatistics;
/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileCopyWith<UserProfile> get copyWith => _$UserProfileCopyWithImpl<UserProfile>(this as UserProfile, _$identity);

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.picture, picture) || other.picture == picture)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.location, location) || other.location == location)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt)&&(identical(other.timeZone, timeZone) || other.timeZone == timeZone)&&(identical(other.isSupporter, isSupporter) || other.isSupporter == isSupporter)&&(identical(other.animeStatistics, animeStatistics) || other.animeStatistics == animeStatistics));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,picture,gender,birthday,location,joinedAt,timeZone,isSupporter,animeStatistics);

@override
String toString() {
  return 'UserProfile(id: $id, name: $name, picture: $picture, gender: $gender, birthday: $birthday, location: $location, joinedAt: $joinedAt, timeZone: $timeZone, isSupporter: $isSupporter, animeStatistics: $animeStatistics)';
}


}

/// @nodoc
abstract mixin class $UserProfileCopyWith<$Res>  {
  factory $UserProfileCopyWith(UserProfile value, $Res Function(UserProfile) _then) = _$UserProfileCopyWithImpl;
@useResult
$Res call({
 int? id, String? name, String? picture, String? gender, String? birthday, String? location, String? joinedAt, String? timeZone, bool? isSupporter, AnimeStatistics? animeStatistics
});


$AnimeStatisticsCopyWith<$Res>? get animeStatistics;

}
/// @nodoc
class _$UserProfileCopyWithImpl<$Res>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._self, this._then);

  final UserProfile _self;
  final $Res Function(UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? picture = freezed,Object? gender = freezed,Object? birthday = freezed,Object? location = freezed,Object? joinedAt = freezed,Object? timeZone = freezed,Object? isSupporter = freezed,Object? animeStatistics = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,picture: freezed == picture ? _self.picture : picture // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,joinedAt: freezed == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as String?,timeZone: freezed == timeZone ? _self.timeZone : timeZone // ignore: cast_nullable_to_non_nullable
as String?,isSupporter: freezed == isSupporter ? _self.isSupporter : isSupporter // ignore: cast_nullable_to_non_nullable
as bool?,animeStatistics: freezed == animeStatistics ? _self.animeStatistics : animeStatistics // ignore: cast_nullable_to_non_nullable
as AnimeStatistics?,
  ));
}
/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnimeStatisticsCopyWith<$Res>? get animeStatistics {
    if (_self.animeStatistics == null) {
    return null;
  }

  return $AnimeStatisticsCopyWith<$Res>(_self.animeStatistics!, (value) {
    return _then(_self.copyWith(animeStatistics: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserProfile].
extension UserProfilePatterns on UserProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfile value)  $default,){
final _that = this;
switch (_that) {
case _UserProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfile value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? name,  String? picture,  String? gender,  String? birthday,  String? location,  String? joinedAt,  String? timeZone,  bool? isSupporter,  AnimeStatistics? animeStatistics)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.id,_that.name,_that.picture,_that.gender,_that.birthday,_that.location,_that.joinedAt,_that.timeZone,_that.isSupporter,_that.animeStatistics);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? name,  String? picture,  String? gender,  String? birthday,  String? location,  String? joinedAt,  String? timeZone,  bool? isSupporter,  AnimeStatistics? animeStatistics)  $default,) {final _that = this;
switch (_that) {
case _UserProfile():
return $default(_that.id,_that.name,_that.picture,_that.gender,_that.birthday,_that.location,_that.joinedAt,_that.timeZone,_that.isSupporter,_that.animeStatistics);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? name,  String? picture,  String? gender,  String? birthday,  String? location,  String? joinedAt,  String? timeZone,  bool? isSupporter,  AnimeStatistics? animeStatistics)?  $default,) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.id,_that.name,_that.picture,_that.gender,_that.birthday,_that.location,_that.joinedAt,_that.timeZone,_that.isSupporter,_that.animeStatistics);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProfile implements UserProfile {
  const _UserProfile({this.id, this.name, this.picture, this.gender, this.birthday, this.location, this.joinedAt, this.timeZone, this.isSupporter, this.animeStatistics});
  factory _UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

@override final  int? id;
@override final  String? name;
@override final  String? picture;
@override final  String? gender;
@override final  String? birthday;
@override final  String? location;
@override final  String? joinedAt;
@override final  String? timeZone;
@override final  bool? isSupporter;
@override final  AnimeStatistics? animeStatistics;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileCopyWith<_UserProfile> get copyWith => __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.picture, picture) || other.picture == picture)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.location, location) || other.location == location)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt)&&(identical(other.timeZone, timeZone) || other.timeZone == timeZone)&&(identical(other.isSupporter, isSupporter) || other.isSupporter == isSupporter)&&(identical(other.animeStatistics, animeStatistics) || other.animeStatistics == animeStatistics));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,picture,gender,birthday,location,joinedAt,timeZone,isSupporter,animeStatistics);

@override
String toString() {
  return 'UserProfile(id: $id, name: $name, picture: $picture, gender: $gender, birthday: $birthday, location: $location, joinedAt: $joinedAt, timeZone: $timeZone, isSupporter: $isSupporter, animeStatistics: $animeStatistics)';
}


}

/// @nodoc
abstract mixin class _$UserProfileCopyWith<$Res> implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(_UserProfile value, $Res Function(_UserProfile) _then) = __$UserProfileCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? name, String? picture, String? gender, String? birthday, String? location, String? joinedAt, String? timeZone, bool? isSupporter, AnimeStatistics? animeStatistics
});


@override $AnimeStatisticsCopyWith<$Res>? get animeStatistics;

}
/// @nodoc
class __$UserProfileCopyWithImpl<$Res>
    implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(this._self, this._then);

  final _UserProfile _self;
  final $Res Function(_UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? picture = freezed,Object? gender = freezed,Object? birthday = freezed,Object? location = freezed,Object? joinedAt = freezed,Object? timeZone = freezed,Object? isSupporter = freezed,Object? animeStatistics = freezed,}) {
  return _then(_UserProfile(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,picture: freezed == picture ? _self.picture : picture // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,joinedAt: freezed == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as String?,timeZone: freezed == timeZone ? _self.timeZone : timeZone // ignore: cast_nullable_to_non_nullable
as String?,isSupporter: freezed == isSupporter ? _self.isSupporter : isSupporter // ignore: cast_nullable_to_non_nullable
as bool?,animeStatistics: freezed == animeStatistics ? _self.animeStatistics : animeStatistics // ignore: cast_nullable_to_non_nullable
as AnimeStatistics?,
  ));
}

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnimeStatisticsCopyWith<$Res>? get animeStatistics {
    if (_self.animeStatistics == null) {
    return null;
  }

  return $AnimeStatisticsCopyWith<$Res>(_self.animeStatistics!, (value) {
    return _then(_self.copyWith(animeStatistics: value));
  });
}
}

// dart format on
