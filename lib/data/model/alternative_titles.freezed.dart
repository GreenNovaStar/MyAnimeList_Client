// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alternative_titles.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AlternativeTitles {

 List<String> get synonyms; String? get en; String? get ja;
/// Create a copy of AlternativeTitles
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlternativeTitlesCopyWith<AlternativeTitles> get copyWith => _$AlternativeTitlesCopyWithImpl<AlternativeTitles>(this as AlternativeTitles, _$identity);

  /// Serializes this AlternativeTitles to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlternativeTitles&&const DeepCollectionEquality().equals(other.synonyms, synonyms)&&(identical(other.en, en) || other.en == en)&&(identical(other.ja, ja) || other.ja == ja));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(synonyms),en,ja);

@override
String toString() {
  return 'AlternativeTitles(synonyms: $synonyms, en: $en, ja: $ja)';
}


}

/// @nodoc
abstract mixin class $AlternativeTitlesCopyWith<$Res>  {
  factory $AlternativeTitlesCopyWith(AlternativeTitles value, $Res Function(AlternativeTitles) _then) = _$AlternativeTitlesCopyWithImpl;
@useResult
$Res call({
 List<String> synonyms, String? en, String? ja
});




}
/// @nodoc
class _$AlternativeTitlesCopyWithImpl<$Res>
    implements $AlternativeTitlesCopyWith<$Res> {
  _$AlternativeTitlesCopyWithImpl(this._self, this._then);

  final AlternativeTitles _self;
  final $Res Function(AlternativeTitles) _then;

/// Create a copy of AlternativeTitles
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? synonyms = null,Object? en = freezed,Object? ja = freezed,}) {
  return _then(_self.copyWith(
synonyms: null == synonyms ? _self.synonyms : synonyms // ignore: cast_nullable_to_non_nullable
as List<String>,en: freezed == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as String?,ja: freezed == ja ? _self.ja : ja // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AlternativeTitles].
extension AlternativeTitlesPatterns on AlternativeTitles {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlternativeTitles value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlternativeTitles() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlternativeTitles value)  $default,){
final _that = this;
switch (_that) {
case _AlternativeTitles():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlternativeTitles value)?  $default,){
final _that = this;
switch (_that) {
case _AlternativeTitles() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> synonyms,  String? en,  String? ja)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlternativeTitles() when $default != null:
return $default(_that.synonyms,_that.en,_that.ja);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> synonyms,  String? en,  String? ja)  $default,) {final _that = this;
switch (_that) {
case _AlternativeTitles():
return $default(_that.synonyms,_that.en,_that.ja);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> synonyms,  String? en,  String? ja)?  $default,) {final _that = this;
switch (_that) {
case _AlternativeTitles() when $default != null:
return $default(_that.synonyms,_that.en,_that.ja);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AlternativeTitles implements AlternativeTitles {
  const _AlternativeTitles({final  List<String> synonyms = const <String>[], this.en, this.ja}): _synonyms = synonyms;
  factory _AlternativeTitles.fromJson(Map<String, dynamic> json) => _$AlternativeTitlesFromJson(json);

 final  List<String> _synonyms;
@override@JsonKey() List<String> get synonyms {
  if (_synonyms is EqualUnmodifiableListView) return _synonyms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_synonyms);
}

@override final  String? en;
@override final  String? ja;

/// Create a copy of AlternativeTitles
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlternativeTitlesCopyWith<_AlternativeTitles> get copyWith => __$AlternativeTitlesCopyWithImpl<_AlternativeTitles>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AlternativeTitlesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlternativeTitles&&const DeepCollectionEquality().equals(other._synonyms, _synonyms)&&(identical(other.en, en) || other.en == en)&&(identical(other.ja, ja) || other.ja == ja));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_synonyms),en,ja);

@override
String toString() {
  return 'AlternativeTitles(synonyms: $synonyms, en: $en, ja: $ja)';
}


}

/// @nodoc
abstract mixin class _$AlternativeTitlesCopyWith<$Res> implements $AlternativeTitlesCopyWith<$Res> {
  factory _$AlternativeTitlesCopyWith(_AlternativeTitles value, $Res Function(_AlternativeTitles) _then) = __$AlternativeTitlesCopyWithImpl;
@override @useResult
$Res call({
 List<String> synonyms, String? en, String? ja
});




}
/// @nodoc
class __$AlternativeTitlesCopyWithImpl<$Res>
    implements _$AlternativeTitlesCopyWith<$Res> {
  __$AlternativeTitlesCopyWithImpl(this._self, this._then);

  final _AlternativeTitles _self;
  final $Res Function(_AlternativeTitles) _then;

/// Create a copy of AlternativeTitles
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? synonyms = null,Object? en = freezed,Object? ja = freezed,}) {
  return _then(_AlternativeTitles(
synonyms: null == synonyms ? _self._synonyms : synonyms // ignore: cast_nullable_to_non_nullable
as List<String>,en: freezed == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as String?,ja: freezed == ja ? _self.ja : ja // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
