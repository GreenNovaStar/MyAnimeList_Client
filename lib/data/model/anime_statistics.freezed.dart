// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_statistics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnimeStatistics {

 int? get numItemsWatching; int? get numItemsCompleted; int? get numItemsOnHold; int? get numItemsDropped; int? get numItemsPlanToWatch; int? get numItems; double? get numDaysWatched; double? get numDaysWatching; double? get numDaysCompleted; double? get numDaysOnHold; double? get numDaysDropped; double? get numDays; int? get numEpisodes; int? get numTimesRewatched; double? get meanScore;
/// Create a copy of AnimeStatistics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnimeStatisticsCopyWith<AnimeStatistics> get copyWith => _$AnimeStatisticsCopyWithImpl<AnimeStatistics>(this as AnimeStatistics, _$identity);

  /// Serializes this AnimeStatistics to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnimeStatistics&&(identical(other.numItemsWatching, numItemsWatching) || other.numItemsWatching == numItemsWatching)&&(identical(other.numItemsCompleted, numItemsCompleted) || other.numItemsCompleted == numItemsCompleted)&&(identical(other.numItemsOnHold, numItemsOnHold) || other.numItemsOnHold == numItemsOnHold)&&(identical(other.numItemsDropped, numItemsDropped) || other.numItemsDropped == numItemsDropped)&&(identical(other.numItemsPlanToWatch, numItemsPlanToWatch) || other.numItemsPlanToWatch == numItemsPlanToWatch)&&(identical(other.numItems, numItems) || other.numItems == numItems)&&(identical(other.numDaysWatched, numDaysWatched) || other.numDaysWatched == numDaysWatched)&&(identical(other.numDaysWatching, numDaysWatching) || other.numDaysWatching == numDaysWatching)&&(identical(other.numDaysCompleted, numDaysCompleted) || other.numDaysCompleted == numDaysCompleted)&&(identical(other.numDaysOnHold, numDaysOnHold) || other.numDaysOnHold == numDaysOnHold)&&(identical(other.numDaysDropped, numDaysDropped) || other.numDaysDropped == numDaysDropped)&&(identical(other.numDays, numDays) || other.numDays == numDays)&&(identical(other.numEpisodes, numEpisodes) || other.numEpisodes == numEpisodes)&&(identical(other.numTimesRewatched, numTimesRewatched) || other.numTimesRewatched == numTimesRewatched)&&(identical(other.meanScore, meanScore) || other.meanScore == meanScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,numItemsWatching,numItemsCompleted,numItemsOnHold,numItemsDropped,numItemsPlanToWatch,numItems,numDaysWatched,numDaysWatching,numDaysCompleted,numDaysOnHold,numDaysDropped,numDays,numEpisodes,numTimesRewatched,meanScore);

@override
String toString() {
  return 'AnimeStatistics(numItemsWatching: $numItemsWatching, numItemsCompleted: $numItemsCompleted, numItemsOnHold: $numItemsOnHold, numItemsDropped: $numItemsDropped, numItemsPlanToWatch: $numItemsPlanToWatch, numItems: $numItems, numDaysWatched: $numDaysWatched, numDaysWatching: $numDaysWatching, numDaysCompleted: $numDaysCompleted, numDaysOnHold: $numDaysOnHold, numDaysDropped: $numDaysDropped, numDays: $numDays, numEpisodes: $numEpisodes, numTimesRewatched: $numTimesRewatched, meanScore: $meanScore)';
}


}

/// @nodoc
abstract mixin class $AnimeStatisticsCopyWith<$Res>  {
  factory $AnimeStatisticsCopyWith(AnimeStatistics value, $Res Function(AnimeStatistics) _then) = _$AnimeStatisticsCopyWithImpl;
@useResult
$Res call({
 int? numItemsWatching, int? numItemsCompleted, int? numItemsOnHold, int? numItemsDropped, int? numItemsPlanToWatch, int? numItems, double? numDaysWatched, double? numDaysWatching, double? numDaysCompleted, double? numDaysOnHold, double? numDaysDropped, double? numDays, int? numEpisodes, int? numTimesRewatched, double? meanScore
});




}
/// @nodoc
class _$AnimeStatisticsCopyWithImpl<$Res>
    implements $AnimeStatisticsCopyWith<$Res> {
  _$AnimeStatisticsCopyWithImpl(this._self, this._then);

  final AnimeStatistics _self;
  final $Res Function(AnimeStatistics) _then;

/// Create a copy of AnimeStatistics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? numItemsWatching = freezed,Object? numItemsCompleted = freezed,Object? numItemsOnHold = freezed,Object? numItemsDropped = freezed,Object? numItemsPlanToWatch = freezed,Object? numItems = freezed,Object? numDaysWatched = freezed,Object? numDaysWatching = freezed,Object? numDaysCompleted = freezed,Object? numDaysOnHold = freezed,Object? numDaysDropped = freezed,Object? numDays = freezed,Object? numEpisodes = freezed,Object? numTimesRewatched = freezed,Object? meanScore = freezed,}) {
  return _then(_self.copyWith(
numItemsWatching: freezed == numItemsWatching ? _self.numItemsWatching : numItemsWatching // ignore: cast_nullable_to_non_nullable
as int?,numItemsCompleted: freezed == numItemsCompleted ? _self.numItemsCompleted : numItemsCompleted // ignore: cast_nullable_to_non_nullable
as int?,numItemsOnHold: freezed == numItemsOnHold ? _self.numItemsOnHold : numItemsOnHold // ignore: cast_nullable_to_non_nullable
as int?,numItemsDropped: freezed == numItemsDropped ? _self.numItemsDropped : numItemsDropped // ignore: cast_nullable_to_non_nullable
as int?,numItemsPlanToWatch: freezed == numItemsPlanToWatch ? _self.numItemsPlanToWatch : numItemsPlanToWatch // ignore: cast_nullable_to_non_nullable
as int?,numItems: freezed == numItems ? _self.numItems : numItems // ignore: cast_nullable_to_non_nullable
as int?,numDaysWatched: freezed == numDaysWatched ? _self.numDaysWatched : numDaysWatched // ignore: cast_nullable_to_non_nullable
as double?,numDaysWatching: freezed == numDaysWatching ? _self.numDaysWatching : numDaysWatching // ignore: cast_nullable_to_non_nullable
as double?,numDaysCompleted: freezed == numDaysCompleted ? _self.numDaysCompleted : numDaysCompleted // ignore: cast_nullable_to_non_nullable
as double?,numDaysOnHold: freezed == numDaysOnHold ? _self.numDaysOnHold : numDaysOnHold // ignore: cast_nullable_to_non_nullable
as double?,numDaysDropped: freezed == numDaysDropped ? _self.numDaysDropped : numDaysDropped // ignore: cast_nullable_to_non_nullable
as double?,numDays: freezed == numDays ? _self.numDays : numDays // ignore: cast_nullable_to_non_nullable
as double?,numEpisodes: freezed == numEpisodes ? _self.numEpisodes : numEpisodes // ignore: cast_nullable_to_non_nullable
as int?,numTimesRewatched: freezed == numTimesRewatched ? _self.numTimesRewatched : numTimesRewatched // ignore: cast_nullable_to_non_nullable
as int?,meanScore: freezed == meanScore ? _self.meanScore : meanScore // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [AnimeStatistics].
extension AnimeStatisticsPatterns on AnimeStatistics {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnimeStatistics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnimeStatistics() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnimeStatistics value)  $default,){
final _that = this;
switch (_that) {
case _AnimeStatistics():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnimeStatistics value)?  $default,){
final _that = this;
switch (_that) {
case _AnimeStatistics() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? numItemsWatching,  int? numItemsCompleted,  int? numItemsOnHold,  int? numItemsDropped,  int? numItemsPlanToWatch,  int? numItems,  double? numDaysWatched,  double? numDaysWatching,  double? numDaysCompleted,  double? numDaysOnHold,  double? numDaysDropped,  double? numDays,  int? numEpisodes,  int? numTimesRewatched,  double? meanScore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnimeStatistics() when $default != null:
return $default(_that.numItemsWatching,_that.numItemsCompleted,_that.numItemsOnHold,_that.numItemsDropped,_that.numItemsPlanToWatch,_that.numItems,_that.numDaysWatched,_that.numDaysWatching,_that.numDaysCompleted,_that.numDaysOnHold,_that.numDaysDropped,_that.numDays,_that.numEpisodes,_that.numTimesRewatched,_that.meanScore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? numItemsWatching,  int? numItemsCompleted,  int? numItemsOnHold,  int? numItemsDropped,  int? numItemsPlanToWatch,  int? numItems,  double? numDaysWatched,  double? numDaysWatching,  double? numDaysCompleted,  double? numDaysOnHold,  double? numDaysDropped,  double? numDays,  int? numEpisodes,  int? numTimesRewatched,  double? meanScore)  $default,) {final _that = this;
switch (_that) {
case _AnimeStatistics():
return $default(_that.numItemsWatching,_that.numItemsCompleted,_that.numItemsOnHold,_that.numItemsDropped,_that.numItemsPlanToWatch,_that.numItems,_that.numDaysWatched,_that.numDaysWatching,_that.numDaysCompleted,_that.numDaysOnHold,_that.numDaysDropped,_that.numDays,_that.numEpisodes,_that.numTimesRewatched,_that.meanScore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? numItemsWatching,  int? numItemsCompleted,  int? numItemsOnHold,  int? numItemsDropped,  int? numItemsPlanToWatch,  int? numItems,  double? numDaysWatched,  double? numDaysWatching,  double? numDaysCompleted,  double? numDaysOnHold,  double? numDaysDropped,  double? numDays,  int? numEpisodes,  int? numTimesRewatched,  double? meanScore)?  $default,) {final _that = this;
switch (_that) {
case _AnimeStatistics() when $default != null:
return $default(_that.numItemsWatching,_that.numItemsCompleted,_that.numItemsOnHold,_that.numItemsDropped,_that.numItemsPlanToWatch,_that.numItems,_that.numDaysWatched,_that.numDaysWatching,_that.numDaysCompleted,_that.numDaysOnHold,_that.numDaysDropped,_that.numDays,_that.numEpisodes,_that.numTimesRewatched,_that.meanScore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnimeStatistics implements AnimeStatistics {
  const _AnimeStatistics({this.numItemsWatching, this.numItemsCompleted, this.numItemsOnHold, this.numItemsDropped, this.numItemsPlanToWatch, this.numItems, this.numDaysWatched, this.numDaysWatching, this.numDaysCompleted, this.numDaysOnHold, this.numDaysDropped, this.numDays, this.numEpisodes, this.numTimesRewatched, this.meanScore});
  factory _AnimeStatistics.fromJson(Map<String, dynamic> json) => _$AnimeStatisticsFromJson(json);

@override final  int? numItemsWatching;
@override final  int? numItemsCompleted;
@override final  int? numItemsOnHold;
@override final  int? numItemsDropped;
@override final  int? numItemsPlanToWatch;
@override final  int? numItems;
@override final  double? numDaysWatched;
@override final  double? numDaysWatching;
@override final  double? numDaysCompleted;
@override final  double? numDaysOnHold;
@override final  double? numDaysDropped;
@override final  double? numDays;
@override final  int? numEpisodes;
@override final  int? numTimesRewatched;
@override final  double? meanScore;

/// Create a copy of AnimeStatistics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnimeStatisticsCopyWith<_AnimeStatistics> get copyWith => __$AnimeStatisticsCopyWithImpl<_AnimeStatistics>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnimeStatisticsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnimeStatistics&&(identical(other.numItemsWatching, numItemsWatching) || other.numItemsWatching == numItemsWatching)&&(identical(other.numItemsCompleted, numItemsCompleted) || other.numItemsCompleted == numItemsCompleted)&&(identical(other.numItemsOnHold, numItemsOnHold) || other.numItemsOnHold == numItemsOnHold)&&(identical(other.numItemsDropped, numItemsDropped) || other.numItemsDropped == numItemsDropped)&&(identical(other.numItemsPlanToWatch, numItemsPlanToWatch) || other.numItemsPlanToWatch == numItemsPlanToWatch)&&(identical(other.numItems, numItems) || other.numItems == numItems)&&(identical(other.numDaysWatched, numDaysWatched) || other.numDaysWatched == numDaysWatched)&&(identical(other.numDaysWatching, numDaysWatching) || other.numDaysWatching == numDaysWatching)&&(identical(other.numDaysCompleted, numDaysCompleted) || other.numDaysCompleted == numDaysCompleted)&&(identical(other.numDaysOnHold, numDaysOnHold) || other.numDaysOnHold == numDaysOnHold)&&(identical(other.numDaysDropped, numDaysDropped) || other.numDaysDropped == numDaysDropped)&&(identical(other.numDays, numDays) || other.numDays == numDays)&&(identical(other.numEpisodes, numEpisodes) || other.numEpisodes == numEpisodes)&&(identical(other.numTimesRewatched, numTimesRewatched) || other.numTimesRewatched == numTimesRewatched)&&(identical(other.meanScore, meanScore) || other.meanScore == meanScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,numItemsWatching,numItemsCompleted,numItemsOnHold,numItemsDropped,numItemsPlanToWatch,numItems,numDaysWatched,numDaysWatching,numDaysCompleted,numDaysOnHold,numDaysDropped,numDays,numEpisodes,numTimesRewatched,meanScore);

@override
String toString() {
  return 'AnimeStatistics(numItemsWatching: $numItemsWatching, numItemsCompleted: $numItemsCompleted, numItemsOnHold: $numItemsOnHold, numItemsDropped: $numItemsDropped, numItemsPlanToWatch: $numItemsPlanToWatch, numItems: $numItems, numDaysWatched: $numDaysWatched, numDaysWatching: $numDaysWatching, numDaysCompleted: $numDaysCompleted, numDaysOnHold: $numDaysOnHold, numDaysDropped: $numDaysDropped, numDays: $numDays, numEpisodes: $numEpisodes, numTimesRewatched: $numTimesRewatched, meanScore: $meanScore)';
}


}

/// @nodoc
abstract mixin class _$AnimeStatisticsCopyWith<$Res> implements $AnimeStatisticsCopyWith<$Res> {
  factory _$AnimeStatisticsCopyWith(_AnimeStatistics value, $Res Function(_AnimeStatistics) _then) = __$AnimeStatisticsCopyWithImpl;
@override @useResult
$Res call({
 int? numItemsWatching, int? numItemsCompleted, int? numItemsOnHold, int? numItemsDropped, int? numItemsPlanToWatch, int? numItems, double? numDaysWatched, double? numDaysWatching, double? numDaysCompleted, double? numDaysOnHold, double? numDaysDropped, double? numDays, int? numEpisodes, int? numTimesRewatched, double? meanScore
});




}
/// @nodoc
class __$AnimeStatisticsCopyWithImpl<$Res>
    implements _$AnimeStatisticsCopyWith<$Res> {
  __$AnimeStatisticsCopyWithImpl(this._self, this._then);

  final _AnimeStatistics _self;
  final $Res Function(_AnimeStatistics) _then;

/// Create a copy of AnimeStatistics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? numItemsWatching = freezed,Object? numItemsCompleted = freezed,Object? numItemsOnHold = freezed,Object? numItemsDropped = freezed,Object? numItemsPlanToWatch = freezed,Object? numItems = freezed,Object? numDaysWatched = freezed,Object? numDaysWatching = freezed,Object? numDaysCompleted = freezed,Object? numDaysOnHold = freezed,Object? numDaysDropped = freezed,Object? numDays = freezed,Object? numEpisodes = freezed,Object? numTimesRewatched = freezed,Object? meanScore = freezed,}) {
  return _then(_AnimeStatistics(
numItemsWatching: freezed == numItemsWatching ? _self.numItemsWatching : numItemsWatching // ignore: cast_nullable_to_non_nullable
as int?,numItemsCompleted: freezed == numItemsCompleted ? _self.numItemsCompleted : numItemsCompleted // ignore: cast_nullable_to_non_nullable
as int?,numItemsOnHold: freezed == numItemsOnHold ? _self.numItemsOnHold : numItemsOnHold // ignore: cast_nullable_to_non_nullable
as int?,numItemsDropped: freezed == numItemsDropped ? _self.numItemsDropped : numItemsDropped // ignore: cast_nullable_to_non_nullable
as int?,numItemsPlanToWatch: freezed == numItemsPlanToWatch ? _self.numItemsPlanToWatch : numItemsPlanToWatch // ignore: cast_nullable_to_non_nullable
as int?,numItems: freezed == numItems ? _self.numItems : numItems // ignore: cast_nullable_to_non_nullable
as int?,numDaysWatched: freezed == numDaysWatched ? _self.numDaysWatched : numDaysWatched // ignore: cast_nullable_to_non_nullable
as double?,numDaysWatching: freezed == numDaysWatching ? _self.numDaysWatching : numDaysWatching // ignore: cast_nullable_to_non_nullable
as double?,numDaysCompleted: freezed == numDaysCompleted ? _self.numDaysCompleted : numDaysCompleted // ignore: cast_nullable_to_non_nullable
as double?,numDaysOnHold: freezed == numDaysOnHold ? _self.numDaysOnHold : numDaysOnHold // ignore: cast_nullable_to_non_nullable
as double?,numDaysDropped: freezed == numDaysDropped ? _self.numDaysDropped : numDaysDropped // ignore: cast_nullable_to_non_nullable
as double?,numDays: freezed == numDays ? _self.numDays : numDays // ignore: cast_nullable_to_non_nullable
as double?,numEpisodes: freezed == numEpisodes ? _self.numEpisodes : numEpisodes // ignore: cast_nullable_to_non_nullable
as int?,numTimesRewatched: freezed == numTimesRewatched ? _self.numTimesRewatched : numTimesRewatched // ignore: cast_nullable_to_non_nullable
as int?,meanScore: freezed == meanScore ? _self.meanScore : meanScore // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
