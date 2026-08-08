// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'themes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Themes {

 int? get id; int? get animeId; String? get text;
/// Create a copy of Themes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThemesCopyWith<Themes> get copyWith => _$ThemesCopyWithImpl<Themes>(this as Themes, _$identity);

  /// Serializes this Themes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Themes&&(identical(other.id, id) || other.id == id)&&(identical(other.animeId, animeId) || other.animeId == animeId)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,animeId,text);

@override
String toString() {
  return 'Themes(id: $id, animeId: $animeId, text: $text)';
}


}

/// @nodoc
abstract mixin class $ThemesCopyWith<$Res>  {
  factory $ThemesCopyWith(Themes value, $Res Function(Themes) _then) = _$ThemesCopyWithImpl;
@useResult
$Res call({
 int? id, int? animeId, String? text
});




}
/// @nodoc
class _$ThemesCopyWithImpl<$Res>
    implements $ThemesCopyWith<$Res> {
  _$ThemesCopyWithImpl(this._self, this._then);

  final Themes _self;
  final $Res Function(Themes) _then;

/// Create a copy of Themes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? animeId = freezed,Object? text = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,animeId: freezed == animeId ? _self.animeId : animeId // ignore: cast_nullable_to_non_nullable
as int?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Themes].
extension ThemesPatterns on Themes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Themes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Themes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Themes value)  $default,){
final _that = this;
switch (_that) {
case _Themes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Themes value)?  $default,){
final _that = this;
switch (_that) {
case _Themes() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int? animeId,  String? text)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Themes() when $default != null:
return $default(_that.id,_that.animeId,_that.text);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int? animeId,  String? text)  $default,) {final _that = this;
switch (_that) {
case _Themes():
return $default(_that.id,_that.animeId,_that.text);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int? animeId,  String? text)?  $default,) {final _that = this;
switch (_that) {
case _Themes() when $default != null:
return $default(_that.id,_that.animeId,_that.text);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Themes implements Themes {
  const _Themes({this.id, this.animeId, this.text});
  factory _Themes.fromJson(Map<String, dynamic> json) => _$ThemesFromJson(json);

@override final  int? id;
@override final  int? animeId;
@override final  String? text;

/// Create a copy of Themes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThemesCopyWith<_Themes> get copyWith => __$ThemesCopyWithImpl<_Themes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ThemesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Themes&&(identical(other.id, id) || other.id == id)&&(identical(other.animeId, animeId) || other.animeId == animeId)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,animeId,text);

@override
String toString() {
  return 'Themes(id: $id, animeId: $animeId, text: $text)';
}


}

/// @nodoc
abstract mixin class _$ThemesCopyWith<$Res> implements $ThemesCopyWith<$Res> {
  factory _$ThemesCopyWith(_Themes value, $Res Function(_Themes) _then) = __$ThemesCopyWithImpl;
@override @useResult
$Res call({
 int? id, int? animeId, String? text
});




}
/// @nodoc
class __$ThemesCopyWithImpl<$Res>
    implements _$ThemesCopyWith<$Res> {
  __$ThemesCopyWithImpl(this._self, this._then);

  final _Themes _self;
  final $Res Function(_Themes) _then;

/// Create a copy of Themes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? animeId = freezed,Object? text = freezed,}) {
  return _then(_Themes(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,animeId: freezed == animeId ? _self.animeId : animeId // ignore: cast_nullable_to_non_nullable
as int?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
