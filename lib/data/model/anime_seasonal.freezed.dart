// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_seasonal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnimeSeasonal {

 List<Data> get data; Paging get paging; Season get season;
/// Create a copy of AnimeSeasonal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnimeSeasonalCopyWith<AnimeSeasonal> get copyWith => _$AnimeSeasonalCopyWithImpl<AnimeSeasonal>(this as AnimeSeasonal, _$identity);

  /// Serializes this AnimeSeasonal to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnimeSeasonal&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.paging, paging) || other.paging == paging)&&(identical(other.season, season) || other.season == season));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),paging,season);

@override
String toString() {
  return 'AnimeSeasonal(data: $data, paging: $paging, season: $season)';
}


}

/// @nodoc
abstract mixin class $AnimeSeasonalCopyWith<$Res>  {
  factory $AnimeSeasonalCopyWith(AnimeSeasonal value, $Res Function(AnimeSeasonal) _then) = _$AnimeSeasonalCopyWithImpl;
@useResult
$Res call({
 List<Data> data, Paging paging, Season season
});


$PagingCopyWith<$Res> get paging;$SeasonCopyWith<$Res> get season;

}
/// @nodoc
class _$AnimeSeasonalCopyWithImpl<$Res>
    implements $AnimeSeasonalCopyWith<$Res> {
  _$AnimeSeasonalCopyWithImpl(this._self, this._then);

  final AnimeSeasonal _self;
  final $Res Function(AnimeSeasonal) _then;

/// Create a copy of AnimeSeasonal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? paging = null,Object? season = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<Data>,paging: null == paging ? _self.paging : paging // ignore: cast_nullable_to_non_nullable
as Paging,season: null == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as Season,
  ));
}
/// Create a copy of AnimeSeasonal
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PagingCopyWith<$Res> get paging {
  
  return $PagingCopyWith<$Res>(_self.paging, (value) {
    return _then(_self.copyWith(paging: value));
  });
}/// Create a copy of AnimeSeasonal
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeasonCopyWith<$Res> get season {
  
  return $SeasonCopyWith<$Res>(_self.season, (value) {
    return _then(_self.copyWith(season: value));
  });
}
}


/// Adds pattern-matching-related methods to [AnimeSeasonal].
extension AnimeSeasonalPatterns on AnimeSeasonal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnimeSeasonal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnimeSeasonal() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnimeSeasonal value)  $default,){
final _that = this;
switch (_that) {
case _AnimeSeasonal():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnimeSeasonal value)?  $default,){
final _that = this;
switch (_that) {
case _AnimeSeasonal() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Data> data,  Paging paging,  Season season)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnimeSeasonal() when $default != null:
return $default(_that.data,_that.paging,_that.season);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Data> data,  Paging paging,  Season season)  $default,) {final _that = this;
switch (_that) {
case _AnimeSeasonal():
return $default(_that.data,_that.paging,_that.season);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Data> data,  Paging paging,  Season season)?  $default,) {final _that = this;
switch (_that) {
case _AnimeSeasonal() when $default != null:
return $default(_that.data,_that.paging,_that.season);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnimeSeasonal implements AnimeSeasonal {
  const _AnimeSeasonal({final  List<Data> data = const <Data>[], required this.paging, required this.season}): _data = data;
  factory _AnimeSeasonal.fromJson(Map<String, dynamic> json) => _$AnimeSeasonalFromJson(json);

 final  List<Data> _data;
@override@JsonKey() List<Data> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  Paging paging;
@override final  Season season;

/// Create a copy of AnimeSeasonal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnimeSeasonalCopyWith<_AnimeSeasonal> get copyWith => __$AnimeSeasonalCopyWithImpl<_AnimeSeasonal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnimeSeasonalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnimeSeasonal&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.paging, paging) || other.paging == paging)&&(identical(other.season, season) || other.season == season));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),paging,season);

@override
String toString() {
  return 'AnimeSeasonal(data: $data, paging: $paging, season: $season)';
}


}

/// @nodoc
abstract mixin class _$AnimeSeasonalCopyWith<$Res> implements $AnimeSeasonalCopyWith<$Res> {
  factory _$AnimeSeasonalCopyWith(_AnimeSeasonal value, $Res Function(_AnimeSeasonal) _then) = __$AnimeSeasonalCopyWithImpl;
@override @useResult
$Res call({
 List<Data> data, Paging paging, Season season
});


@override $PagingCopyWith<$Res> get paging;@override $SeasonCopyWith<$Res> get season;

}
/// @nodoc
class __$AnimeSeasonalCopyWithImpl<$Res>
    implements _$AnimeSeasonalCopyWith<$Res> {
  __$AnimeSeasonalCopyWithImpl(this._self, this._then);

  final _AnimeSeasonal _self;
  final $Res Function(_AnimeSeasonal) _then;

/// Create a copy of AnimeSeasonal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? paging = null,Object? season = null,}) {
  return _then(_AnimeSeasonal(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Data>,paging: null == paging ? _self.paging : paging // ignore: cast_nullable_to_non_nullable
as Paging,season: null == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as Season,
  ));
}

/// Create a copy of AnimeSeasonal
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PagingCopyWith<$Res> get paging {
  
  return $PagingCopyWith<$Res>(_self.paging, (value) {
    return _then(_self.copyWith(paging: value));
  });
}/// Create a copy of AnimeSeasonal
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeasonCopyWith<$Res> get season {
  
  return $SeasonCopyWith<$Res>(_self.season, (value) {
    return _then(_self.copyWith(season: value));
  });
}
}

// dart format on
