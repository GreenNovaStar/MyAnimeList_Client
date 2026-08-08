// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'season.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Season {

 int get year; String get season;
/// Create a copy of Season
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeasonCopyWith<Season> get copyWith => _$SeasonCopyWithImpl<Season>(this as Season, _$identity);

  /// Serializes this Season to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Season&&(identical(other.year, year) || other.year == year)&&(identical(other.season, season) || other.season == season));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,year,season);

@override
String toString() {
  return 'Season(year: $year, season: $season)';
}


}

/// @nodoc
abstract mixin class $SeasonCopyWith<$Res>  {
  factory $SeasonCopyWith(Season value, $Res Function(Season) _then) = _$SeasonCopyWithImpl;
@useResult
$Res call({
 int year, String season
});




}
/// @nodoc
class _$SeasonCopyWithImpl<$Res>
    implements $SeasonCopyWith<$Res> {
  _$SeasonCopyWithImpl(this._self, this._then);

  final Season _self;
  final $Res Function(Season) _then;

/// Create a copy of Season
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? year = null,Object? season = null,}) {
  return _then(_self.copyWith(
year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,season: null == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Season].
extension SeasonPatterns on Season {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Season value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Season() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Season value)  $default,){
final _that = this;
switch (_that) {
case _Season():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Season value)?  $default,){
final _that = this;
switch (_that) {
case _Season() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int year,  String season)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Season() when $default != null:
return $default(_that.year,_that.season);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int year,  String season)  $default,) {final _that = this;
switch (_that) {
case _Season():
return $default(_that.year,_that.season);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int year,  String season)?  $default,) {final _that = this;
switch (_that) {
case _Season() when $default != null:
return $default(_that.year,_that.season);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Season implements Season {
  const _Season({required this.year, required this.season});
  factory _Season.fromJson(Map<String, dynamic> json) => _$SeasonFromJson(json);

@override final  int year;
@override final  String season;

/// Create a copy of Season
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeasonCopyWith<_Season> get copyWith => __$SeasonCopyWithImpl<_Season>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeasonToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Season&&(identical(other.year, year) || other.year == year)&&(identical(other.season, season) || other.season == season));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,year,season);

@override
String toString() {
  return 'Season(year: $year, season: $season)';
}


}

/// @nodoc
abstract mixin class _$SeasonCopyWith<$Res> implements $SeasonCopyWith<$Res> {
  factory _$SeasonCopyWith(_Season value, $Res Function(_Season) _then) = __$SeasonCopyWithImpl;
@override @useResult
$Res call({
 int year, String season
});




}
/// @nodoc
class __$SeasonCopyWithImpl<$Res>
    implements _$SeasonCopyWith<$Res> {
  __$SeasonCopyWithImpl(this._self, this._then);

  final _Season _self;
  final $Res Function(_Season) _then;

/// Create a copy of Season
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? year = null,Object? season = null,}) {
  return _then(_Season(
year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,season: null == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
