// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ranking.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Ranking {

 int get rank; int? get previousRank;
/// Create a copy of Ranking
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RankingCopyWith<Ranking> get copyWith => _$RankingCopyWithImpl<Ranking>(this as Ranking, _$identity);

  /// Serializes this Ranking to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Ranking&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.previousRank, previousRank) || other.previousRank == previousRank));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rank,previousRank);

@override
String toString() {
  return 'Ranking(rank: $rank, previousRank: $previousRank)';
}


}

/// @nodoc
abstract mixin class $RankingCopyWith<$Res>  {
  factory $RankingCopyWith(Ranking value, $Res Function(Ranking) _then) = _$RankingCopyWithImpl;
@useResult
$Res call({
 int rank, int? previousRank
});




}
/// @nodoc
class _$RankingCopyWithImpl<$Res>
    implements $RankingCopyWith<$Res> {
  _$RankingCopyWithImpl(this._self, this._then);

  final Ranking _self;
  final $Res Function(Ranking) _then;

/// Create a copy of Ranking
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rank = null,Object? previousRank = freezed,}) {
  return _then(_self.copyWith(
rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,previousRank: freezed == previousRank ? _self.previousRank : previousRank // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Ranking].
extension RankingPatterns on Ranking {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Ranking value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Ranking() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Ranking value)  $default,){
final _that = this;
switch (_that) {
case _Ranking():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Ranking value)?  $default,){
final _that = this;
switch (_that) {
case _Ranking() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int rank,  int? previousRank)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Ranking() when $default != null:
return $default(_that.rank,_that.previousRank);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int rank,  int? previousRank)  $default,) {final _that = this;
switch (_that) {
case _Ranking():
return $default(_that.rank,_that.previousRank);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int rank,  int? previousRank)?  $default,) {final _that = this;
switch (_that) {
case _Ranking() when $default != null:
return $default(_that.rank,_that.previousRank);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Ranking implements Ranking {
  const _Ranking({required this.rank, this.previousRank});
  factory _Ranking.fromJson(Map<String, dynamic> json) => _$RankingFromJson(json);

@override final  int rank;
@override final  int? previousRank;

/// Create a copy of Ranking
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RankingCopyWith<_Ranking> get copyWith => __$RankingCopyWithImpl<_Ranking>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RankingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ranking&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.previousRank, previousRank) || other.previousRank == previousRank));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rank,previousRank);

@override
String toString() {
  return 'Ranking(rank: $rank, previousRank: $previousRank)';
}


}

/// @nodoc
abstract mixin class _$RankingCopyWith<$Res> implements $RankingCopyWith<$Res> {
  factory _$RankingCopyWith(_Ranking value, $Res Function(_Ranking) _then) = __$RankingCopyWithImpl;
@override @useResult
$Res call({
 int rank, int? previousRank
});




}
/// @nodoc
class __$RankingCopyWithImpl<$Res>
    implements _$RankingCopyWith<$Res> {
  __$RankingCopyWithImpl(this._self, this._then);

  final _Ranking _self;
  final $Res Function(_Ranking) _then;

/// Create a copy of Ranking
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rank = null,Object? previousRank = freezed,}) {
  return _then(_Ranking(
rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,previousRank: freezed == previousRank ? _self.previousRank : previousRank // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
