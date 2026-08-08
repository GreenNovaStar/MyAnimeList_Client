// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_picture.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Picture {

 String? get medium; String? get large;
/// Create a copy of Picture
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PictureCopyWith<Picture> get copyWith => _$PictureCopyWithImpl<Picture>(this as Picture, _$identity);

  /// Serializes this Picture to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Picture&&(identical(other.medium, medium) || other.medium == medium)&&(identical(other.large, large) || other.large == large));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,medium,large);

@override
String toString() {
  return 'Picture(medium: $medium, large: $large)';
}


}

/// @nodoc
abstract mixin class $PictureCopyWith<$Res>  {
  factory $PictureCopyWith(Picture value, $Res Function(Picture) _then) = _$PictureCopyWithImpl;
@useResult
$Res call({
 String? medium, String? large
});




}
/// @nodoc
class _$PictureCopyWithImpl<$Res>
    implements $PictureCopyWith<$Res> {
  _$PictureCopyWithImpl(this._self, this._then);

  final Picture _self;
  final $Res Function(Picture) _then;

/// Create a copy of Picture
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? medium = freezed,Object? large = freezed,}) {
  return _then(_self.copyWith(
medium: freezed == medium ? _self.medium : medium // ignore: cast_nullable_to_non_nullable
as String?,large: freezed == large ? _self.large : large // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Picture].
extension PicturePatterns on Picture {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Picture value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Picture() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Picture value)  $default,){
final _that = this;
switch (_that) {
case _Picture():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Picture value)?  $default,){
final _that = this;
switch (_that) {
case _Picture() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? medium,  String? large)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Picture() when $default != null:
return $default(_that.medium,_that.large);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? medium,  String? large)  $default,) {final _that = this;
switch (_that) {
case _Picture():
return $default(_that.medium,_that.large);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? medium,  String? large)?  $default,) {final _that = this;
switch (_that) {
case _Picture() when $default != null:
return $default(_that.medium,_that.large);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Picture implements Picture {
  const _Picture({this.medium, this.large});
  factory _Picture.fromJson(Map<String, dynamic> json) => _$PictureFromJson(json);

@override final  String? medium;
@override final  String? large;

/// Create a copy of Picture
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PictureCopyWith<_Picture> get copyWith => __$PictureCopyWithImpl<_Picture>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PictureToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Picture&&(identical(other.medium, medium) || other.medium == medium)&&(identical(other.large, large) || other.large == large));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,medium,large);

@override
String toString() {
  return 'Picture(medium: $medium, large: $large)';
}


}

/// @nodoc
abstract mixin class _$PictureCopyWith<$Res> implements $PictureCopyWith<$Res> {
  factory _$PictureCopyWith(_Picture value, $Res Function(_Picture) _then) = __$PictureCopyWithImpl;
@override @useResult
$Res call({
 String? medium, String? large
});




}
/// @nodoc
class __$PictureCopyWithImpl<$Res>
    implements _$PictureCopyWith<$Res> {
  __$PictureCopyWithImpl(this._self, this._then);

  final _Picture _self;
  final $Res Function(_Picture) _then;

/// Create a copy of Picture
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? medium = freezed,Object? large = freezed,}) {
  return _then(_Picture(
medium: freezed == medium ? _self.medium : medium // ignore: cast_nullable_to_non_nullable
as String?,large: freezed == large ? _self.large : large // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
