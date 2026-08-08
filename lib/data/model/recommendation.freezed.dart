// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommendation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Recommendations {

 Node? get node; int? get numRecommendations;
/// Create a copy of Recommendations
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecommendationsCopyWith<Recommendations> get copyWith => _$RecommendationsCopyWithImpl<Recommendations>(this as Recommendations, _$identity);

  /// Serializes this Recommendations to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Recommendations&&(identical(other.node, node) || other.node == node)&&(identical(other.numRecommendations, numRecommendations) || other.numRecommendations == numRecommendations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,node,numRecommendations);

@override
String toString() {
  return 'Recommendations(node: $node, numRecommendations: $numRecommendations)';
}


}

/// @nodoc
abstract mixin class $RecommendationsCopyWith<$Res>  {
  factory $RecommendationsCopyWith(Recommendations value, $Res Function(Recommendations) _then) = _$RecommendationsCopyWithImpl;
@useResult
$Res call({
 Node? node, int? numRecommendations
});


$NodeCopyWith<$Res>? get node;

}
/// @nodoc
class _$RecommendationsCopyWithImpl<$Res>
    implements $RecommendationsCopyWith<$Res> {
  _$RecommendationsCopyWithImpl(this._self, this._then);

  final Recommendations _self;
  final $Res Function(Recommendations) _then;

/// Create a copy of Recommendations
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? node = freezed,Object? numRecommendations = freezed,}) {
  return _then(_self.copyWith(
node: freezed == node ? _self.node : node // ignore: cast_nullable_to_non_nullable
as Node?,numRecommendations: freezed == numRecommendations ? _self.numRecommendations : numRecommendations // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of Recommendations
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NodeCopyWith<$Res>? get node {
    if (_self.node == null) {
    return null;
  }

  return $NodeCopyWith<$Res>(_self.node!, (value) {
    return _then(_self.copyWith(node: value));
  });
}
}


/// Adds pattern-matching-related methods to [Recommendations].
extension RecommendationsPatterns on Recommendations {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Recommendations value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Recommendations() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Recommendations value)  $default,){
final _that = this;
switch (_that) {
case _Recommendations():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Recommendations value)?  $default,){
final _that = this;
switch (_that) {
case _Recommendations() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Node? node,  int? numRecommendations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Recommendations() when $default != null:
return $default(_that.node,_that.numRecommendations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Node? node,  int? numRecommendations)  $default,) {final _that = this;
switch (_that) {
case _Recommendations():
return $default(_that.node,_that.numRecommendations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Node? node,  int? numRecommendations)?  $default,) {final _that = this;
switch (_that) {
case _Recommendations() when $default != null:
return $default(_that.node,_that.numRecommendations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Recommendations implements Recommendations {
  const _Recommendations({this.node, this.numRecommendations});
  factory _Recommendations.fromJson(Map<String, dynamic> json) => _$RecommendationsFromJson(json);

@override final  Node? node;
@override final  int? numRecommendations;

/// Create a copy of Recommendations
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecommendationsCopyWith<_Recommendations> get copyWith => __$RecommendationsCopyWithImpl<_Recommendations>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecommendationsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Recommendations&&(identical(other.node, node) || other.node == node)&&(identical(other.numRecommendations, numRecommendations) || other.numRecommendations == numRecommendations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,node,numRecommendations);

@override
String toString() {
  return 'Recommendations(node: $node, numRecommendations: $numRecommendations)';
}


}

/// @nodoc
abstract mixin class _$RecommendationsCopyWith<$Res> implements $RecommendationsCopyWith<$Res> {
  factory _$RecommendationsCopyWith(_Recommendations value, $Res Function(_Recommendations) _then) = __$RecommendationsCopyWithImpl;
@override @useResult
$Res call({
 Node? node, int? numRecommendations
});


@override $NodeCopyWith<$Res>? get node;

}
/// @nodoc
class __$RecommendationsCopyWithImpl<$Res>
    implements _$RecommendationsCopyWith<$Res> {
  __$RecommendationsCopyWithImpl(this._self, this._then);

  final _Recommendations _self;
  final $Res Function(_Recommendations) _then;

/// Create a copy of Recommendations
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? node = freezed,Object? numRecommendations = freezed,}) {
  return _then(_Recommendations(
node: freezed == node ? _self.node : node // ignore: cast_nullable_to_non_nullable
as Node?,numRecommendations: freezed == numRecommendations ? _self.numRecommendations : numRecommendations // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of Recommendations
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NodeCopyWith<$Res>? get node {
    if (_self.node == null) {
    return null;
  }

  return $NodeCopyWith<$Res>(_self.node!, (value) {
    return _then(_self.copyWith(node: value));
  });
}
}

// dart format on
