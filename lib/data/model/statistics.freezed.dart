// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statistics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Statistics {

 StatusDistribution? get status; int? get numListUsers;
/// Create a copy of Statistics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatisticsCopyWith<Statistics> get copyWith => _$StatisticsCopyWithImpl<Statistics>(this as Statistics, _$identity);

  /// Serializes this Statistics to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Statistics&&(identical(other.status, status) || other.status == status)&&(identical(other.numListUsers, numListUsers) || other.numListUsers == numListUsers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,numListUsers);

@override
String toString() {
  return 'Statistics(status: $status, numListUsers: $numListUsers)';
}


}

/// @nodoc
abstract mixin class $StatisticsCopyWith<$Res>  {
  factory $StatisticsCopyWith(Statistics value, $Res Function(Statistics) _then) = _$StatisticsCopyWithImpl;
@useResult
$Res call({
 StatusDistribution? status, int? numListUsers
});


$StatusDistributionCopyWith<$Res>? get status;

}
/// @nodoc
class _$StatisticsCopyWithImpl<$Res>
    implements $StatisticsCopyWith<$Res> {
  _$StatisticsCopyWithImpl(this._self, this._then);

  final Statistics _self;
  final $Res Function(Statistics) _then;

/// Create a copy of Statistics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? numListUsers = freezed,}) {
  return _then(_self.copyWith(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StatusDistribution?,numListUsers: freezed == numListUsers ? _self.numListUsers : numListUsers // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of Statistics
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatusDistributionCopyWith<$Res>? get status {
    if (_self.status == null) {
    return null;
  }

  return $StatusDistributionCopyWith<$Res>(_self.status!, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// Adds pattern-matching-related methods to [Statistics].
extension StatisticsPatterns on Statistics {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Statistics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Statistics() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Statistics value)  $default,){
final _that = this;
switch (_that) {
case _Statistics():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Statistics value)?  $default,){
final _that = this;
switch (_that) {
case _Statistics() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StatusDistribution? status,  int? numListUsers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Statistics() when $default != null:
return $default(_that.status,_that.numListUsers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StatusDistribution? status,  int? numListUsers)  $default,) {final _that = this;
switch (_that) {
case _Statistics():
return $default(_that.status,_that.numListUsers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StatusDistribution? status,  int? numListUsers)?  $default,) {final _that = this;
switch (_that) {
case _Statistics() when $default != null:
return $default(_that.status,_that.numListUsers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Statistics implements Statistics {
  const _Statistics({this.status, this.numListUsers});
  factory _Statistics.fromJson(Map<String, dynamic> json) => _$StatisticsFromJson(json);

@override final  StatusDistribution? status;
@override final  int? numListUsers;

/// Create a copy of Statistics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatisticsCopyWith<_Statistics> get copyWith => __$StatisticsCopyWithImpl<_Statistics>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StatisticsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Statistics&&(identical(other.status, status) || other.status == status)&&(identical(other.numListUsers, numListUsers) || other.numListUsers == numListUsers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,numListUsers);

@override
String toString() {
  return 'Statistics(status: $status, numListUsers: $numListUsers)';
}


}

/// @nodoc
abstract mixin class _$StatisticsCopyWith<$Res> implements $StatisticsCopyWith<$Res> {
  factory _$StatisticsCopyWith(_Statistics value, $Res Function(_Statistics) _then) = __$StatisticsCopyWithImpl;
@override @useResult
$Res call({
 StatusDistribution? status, int? numListUsers
});


@override $StatusDistributionCopyWith<$Res>? get status;

}
/// @nodoc
class __$StatisticsCopyWithImpl<$Res>
    implements _$StatisticsCopyWith<$Res> {
  __$StatisticsCopyWithImpl(this._self, this._then);

  final _Statistics _self;
  final $Res Function(_Statistics) _then;

/// Create a copy of Statistics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? numListUsers = freezed,}) {
  return _then(_Statistics(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StatusDistribution?,numListUsers: freezed == numListUsers ? _self.numListUsers : numListUsers // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of Statistics
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatusDistributionCopyWith<$Res>? get status {
    if (_self.status == null) {
    return null;
  }

  return $StatusDistributionCopyWith<$Res>(_self.status!, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}

// dart format on
