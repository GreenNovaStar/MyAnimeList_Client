// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'related_anime.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RelatedAnime {

 Node? get node; String? get relationType; String? get relationTypeFormatted;
/// Create a copy of RelatedAnime
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RelatedAnimeCopyWith<RelatedAnime> get copyWith => _$RelatedAnimeCopyWithImpl<RelatedAnime>(this as RelatedAnime, _$identity);

  /// Serializes this RelatedAnime to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RelatedAnime&&(identical(other.node, node) || other.node == node)&&(identical(other.relationType, relationType) || other.relationType == relationType)&&(identical(other.relationTypeFormatted, relationTypeFormatted) || other.relationTypeFormatted == relationTypeFormatted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,node,relationType,relationTypeFormatted);

@override
String toString() {
  return 'RelatedAnime(node: $node, relationType: $relationType, relationTypeFormatted: $relationTypeFormatted)';
}


}

/// @nodoc
abstract mixin class $RelatedAnimeCopyWith<$Res>  {
  factory $RelatedAnimeCopyWith(RelatedAnime value, $Res Function(RelatedAnime) _then) = _$RelatedAnimeCopyWithImpl;
@useResult
$Res call({
 Node? node, String? relationType, String? relationTypeFormatted
});


$NodeCopyWith<$Res>? get node;

}
/// @nodoc
class _$RelatedAnimeCopyWithImpl<$Res>
    implements $RelatedAnimeCopyWith<$Res> {
  _$RelatedAnimeCopyWithImpl(this._self, this._then);

  final RelatedAnime _self;
  final $Res Function(RelatedAnime) _then;

/// Create a copy of RelatedAnime
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? node = freezed,Object? relationType = freezed,Object? relationTypeFormatted = freezed,}) {
  return _then(_self.copyWith(
node: freezed == node ? _self.node : node // ignore: cast_nullable_to_non_nullable
as Node?,relationType: freezed == relationType ? _self.relationType : relationType // ignore: cast_nullable_to_non_nullable
as String?,relationTypeFormatted: freezed == relationTypeFormatted ? _self.relationTypeFormatted : relationTypeFormatted // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of RelatedAnime
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


/// Adds pattern-matching-related methods to [RelatedAnime].
extension RelatedAnimePatterns on RelatedAnime {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RelatedAnime value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RelatedAnime() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RelatedAnime value)  $default,){
final _that = this;
switch (_that) {
case _RelatedAnime():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RelatedAnime value)?  $default,){
final _that = this;
switch (_that) {
case _RelatedAnime() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Node? node,  String? relationType,  String? relationTypeFormatted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RelatedAnime() when $default != null:
return $default(_that.node,_that.relationType,_that.relationTypeFormatted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Node? node,  String? relationType,  String? relationTypeFormatted)  $default,) {final _that = this;
switch (_that) {
case _RelatedAnime():
return $default(_that.node,_that.relationType,_that.relationTypeFormatted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Node? node,  String? relationType,  String? relationTypeFormatted)?  $default,) {final _that = this;
switch (_that) {
case _RelatedAnime() when $default != null:
return $default(_that.node,_that.relationType,_that.relationTypeFormatted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RelatedAnime implements RelatedAnime {
  const _RelatedAnime({this.node, this.relationType, this.relationTypeFormatted});
  factory _RelatedAnime.fromJson(Map<String, dynamic> json) => _$RelatedAnimeFromJson(json);

@override final  Node? node;
@override final  String? relationType;
@override final  String? relationTypeFormatted;

/// Create a copy of RelatedAnime
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RelatedAnimeCopyWith<_RelatedAnime> get copyWith => __$RelatedAnimeCopyWithImpl<_RelatedAnime>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RelatedAnimeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RelatedAnime&&(identical(other.node, node) || other.node == node)&&(identical(other.relationType, relationType) || other.relationType == relationType)&&(identical(other.relationTypeFormatted, relationTypeFormatted) || other.relationTypeFormatted == relationTypeFormatted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,node,relationType,relationTypeFormatted);

@override
String toString() {
  return 'RelatedAnime(node: $node, relationType: $relationType, relationTypeFormatted: $relationTypeFormatted)';
}


}

/// @nodoc
abstract mixin class _$RelatedAnimeCopyWith<$Res> implements $RelatedAnimeCopyWith<$Res> {
  factory _$RelatedAnimeCopyWith(_RelatedAnime value, $Res Function(_RelatedAnime) _then) = __$RelatedAnimeCopyWithImpl;
@override @useResult
$Res call({
 Node? node, String? relationType, String? relationTypeFormatted
});


@override $NodeCopyWith<$Res>? get node;

}
/// @nodoc
class __$RelatedAnimeCopyWithImpl<$Res>
    implements _$RelatedAnimeCopyWith<$Res> {
  __$RelatedAnimeCopyWithImpl(this._self, this._then);

  final _RelatedAnime _self;
  final $Res Function(_RelatedAnime) _then;

/// Create a copy of RelatedAnime
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? node = freezed,Object? relationType = freezed,Object? relationTypeFormatted = freezed,}) {
  return _then(_RelatedAnime(
node: freezed == node ? _self.node : node // ignore: cast_nullable_to_non_nullable
as Node?,relationType: freezed == relationType ? _self.relationType : relationType // ignore: cast_nullable_to_non_nullable
as String?,relationTypeFormatted: freezed == relationTypeFormatted ? _self.relationTypeFormatted : relationTypeFormatted // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of RelatedAnime
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


/// @nodoc
mixin _$RelatedManga {

 Node? get node; String? get relationType; String? get relationTypeFormatted;
/// Create a copy of RelatedManga
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RelatedMangaCopyWith<RelatedManga> get copyWith => _$RelatedMangaCopyWithImpl<RelatedManga>(this as RelatedManga, _$identity);

  /// Serializes this RelatedManga to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RelatedManga&&(identical(other.node, node) || other.node == node)&&(identical(other.relationType, relationType) || other.relationType == relationType)&&(identical(other.relationTypeFormatted, relationTypeFormatted) || other.relationTypeFormatted == relationTypeFormatted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,node,relationType,relationTypeFormatted);

@override
String toString() {
  return 'RelatedManga(node: $node, relationType: $relationType, relationTypeFormatted: $relationTypeFormatted)';
}


}

/// @nodoc
abstract mixin class $RelatedMangaCopyWith<$Res>  {
  factory $RelatedMangaCopyWith(RelatedManga value, $Res Function(RelatedManga) _then) = _$RelatedMangaCopyWithImpl;
@useResult
$Res call({
 Node? node, String? relationType, String? relationTypeFormatted
});


$NodeCopyWith<$Res>? get node;

}
/// @nodoc
class _$RelatedMangaCopyWithImpl<$Res>
    implements $RelatedMangaCopyWith<$Res> {
  _$RelatedMangaCopyWithImpl(this._self, this._then);

  final RelatedManga _self;
  final $Res Function(RelatedManga) _then;

/// Create a copy of RelatedManga
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? node = freezed,Object? relationType = freezed,Object? relationTypeFormatted = freezed,}) {
  return _then(_self.copyWith(
node: freezed == node ? _self.node : node // ignore: cast_nullable_to_non_nullable
as Node?,relationType: freezed == relationType ? _self.relationType : relationType // ignore: cast_nullable_to_non_nullable
as String?,relationTypeFormatted: freezed == relationTypeFormatted ? _self.relationTypeFormatted : relationTypeFormatted // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of RelatedManga
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


/// Adds pattern-matching-related methods to [RelatedManga].
extension RelatedMangaPatterns on RelatedManga {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RelatedManga value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RelatedManga() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RelatedManga value)  $default,){
final _that = this;
switch (_that) {
case _RelatedManga():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RelatedManga value)?  $default,){
final _that = this;
switch (_that) {
case _RelatedManga() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Node? node,  String? relationType,  String? relationTypeFormatted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RelatedManga() when $default != null:
return $default(_that.node,_that.relationType,_that.relationTypeFormatted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Node? node,  String? relationType,  String? relationTypeFormatted)  $default,) {final _that = this;
switch (_that) {
case _RelatedManga():
return $default(_that.node,_that.relationType,_that.relationTypeFormatted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Node? node,  String? relationType,  String? relationTypeFormatted)?  $default,) {final _that = this;
switch (_that) {
case _RelatedManga() when $default != null:
return $default(_that.node,_that.relationType,_that.relationTypeFormatted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RelatedManga implements RelatedManga {
  const _RelatedManga({this.node, this.relationType, this.relationTypeFormatted});
  factory _RelatedManga.fromJson(Map<String, dynamic> json) => _$RelatedMangaFromJson(json);

@override final  Node? node;
@override final  String? relationType;
@override final  String? relationTypeFormatted;

/// Create a copy of RelatedManga
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RelatedMangaCopyWith<_RelatedManga> get copyWith => __$RelatedMangaCopyWithImpl<_RelatedManga>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RelatedMangaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RelatedManga&&(identical(other.node, node) || other.node == node)&&(identical(other.relationType, relationType) || other.relationType == relationType)&&(identical(other.relationTypeFormatted, relationTypeFormatted) || other.relationTypeFormatted == relationTypeFormatted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,node,relationType,relationTypeFormatted);

@override
String toString() {
  return 'RelatedManga(node: $node, relationType: $relationType, relationTypeFormatted: $relationTypeFormatted)';
}


}

/// @nodoc
abstract mixin class _$RelatedMangaCopyWith<$Res> implements $RelatedMangaCopyWith<$Res> {
  factory _$RelatedMangaCopyWith(_RelatedManga value, $Res Function(_RelatedManga) _then) = __$RelatedMangaCopyWithImpl;
@override @useResult
$Res call({
 Node? node, String? relationType, String? relationTypeFormatted
});


@override $NodeCopyWith<$Res>? get node;

}
/// @nodoc
class __$RelatedMangaCopyWithImpl<$Res>
    implements _$RelatedMangaCopyWith<$Res> {
  __$RelatedMangaCopyWithImpl(this._self, this._then);

  final _RelatedManga _self;
  final $Res Function(_RelatedManga) _then;

/// Create a copy of RelatedManga
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? node = freezed,Object? relationType = freezed,Object? relationTypeFormatted = freezed,}) {
  return _then(_RelatedManga(
node: freezed == node ? _self.node : node // ignore: cast_nullable_to_non_nullable
as Node?,relationType: freezed == relationType ? _self.relationType : relationType // ignore: cast_nullable_to_non_nullable
as String?,relationTypeFormatted: freezed == relationTypeFormatted ? _self.relationTypeFormatted : relationTypeFormatted // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of RelatedManga
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
