// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paging.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Paging {

 String? get next; String? get previous;
/// Create a copy of Paging
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PagingCopyWith<Paging> get copyWith => _$PagingCopyWithImpl<Paging>(this as Paging, _$identity);

  /// Serializes this Paging to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Paging&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,next,previous);

@override
String toString() {
  return 'Paging(next: $next, previous: $previous)';
}


}

/// @nodoc
abstract mixin class $PagingCopyWith<$Res>  {
  factory $PagingCopyWith(Paging value, $Res Function(Paging) _then) = _$PagingCopyWithImpl;
@useResult
$Res call({
 String? next, String? previous
});




}
/// @nodoc
class _$PagingCopyWithImpl<$Res>
    implements $PagingCopyWith<$Res> {
  _$PagingCopyWithImpl(this._self, this._then);

  final Paging _self;
  final $Res Function(Paging) _then;

/// Create a copy of Paging
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? next = freezed,Object? previous = freezed,}) {
  return _then(_self.copyWith(
next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Paging].
extension PagingPatterns on Paging {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Paging value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Paging() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Paging value)  $default,){
final _that = this;
switch (_that) {
case _Paging():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Paging value)?  $default,){
final _that = this;
switch (_that) {
case _Paging() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? next,  String? previous)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Paging() when $default != null:
return $default(_that.next,_that.previous);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? next,  String? previous)  $default,) {final _that = this;
switch (_that) {
case _Paging():
return $default(_that.next,_that.previous);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? next,  String? previous)?  $default,) {final _that = this;
switch (_that) {
case _Paging() when $default != null:
return $default(_that.next,_that.previous);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Paging implements Paging {
  const _Paging({this.next, this.previous});
  factory _Paging.fromJson(Map<String, dynamic> json) => _$PagingFromJson(json);

@override final  String? next;
@override final  String? previous;

/// Create a copy of Paging
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PagingCopyWith<_Paging> get copyWith => __$PagingCopyWithImpl<_Paging>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PagingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Paging&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,next,previous);

@override
String toString() {
  return 'Paging(next: $next, previous: $previous)';
}


}

/// @nodoc
abstract mixin class _$PagingCopyWith<$Res> implements $PagingCopyWith<$Res> {
  factory _$PagingCopyWith(_Paging value, $Res Function(_Paging) _then) = __$PagingCopyWithImpl;
@override @useResult
$Res call({
 String? next, String? previous
});




}
/// @nodoc
class __$PagingCopyWithImpl<$Res>
    implements _$PagingCopyWith<$Res> {
  __$PagingCopyWithImpl(this._self, this._then);

  final _Paging _self;
  final $Res Function(_Paging) _then;

/// Create a copy of Paging
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? next = freezed,Object? previous = freezed,}) {
  return _then(_Paging(
next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
