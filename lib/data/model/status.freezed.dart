// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StatusDistribution {

 String? get watching; String? get completed; String? get onHold; String? get dropped; String? get planToWatch;
/// Create a copy of StatusDistribution
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatusDistributionCopyWith<StatusDistribution> get copyWith => _$StatusDistributionCopyWithImpl<StatusDistribution>(this as StatusDistribution, _$identity);

  /// Serializes this StatusDistribution to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatusDistribution&&(identical(other.watching, watching) || other.watching == watching)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.onHold, onHold) || other.onHold == onHold)&&(identical(other.dropped, dropped) || other.dropped == dropped)&&(identical(other.planToWatch, planToWatch) || other.planToWatch == planToWatch));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,watching,completed,onHold,dropped,planToWatch);

@override
String toString() {
  return 'StatusDistribution(watching: $watching, completed: $completed, onHold: $onHold, dropped: $dropped, planToWatch: $planToWatch)';
}


}

/// @nodoc
abstract mixin class $StatusDistributionCopyWith<$Res>  {
  factory $StatusDistributionCopyWith(StatusDistribution value, $Res Function(StatusDistribution) _then) = _$StatusDistributionCopyWithImpl;
@useResult
$Res call({
 String? watching, String? completed, String? onHold, String? dropped, String? planToWatch
});




}
/// @nodoc
class _$StatusDistributionCopyWithImpl<$Res>
    implements $StatusDistributionCopyWith<$Res> {
  _$StatusDistributionCopyWithImpl(this._self, this._then);

  final StatusDistribution _self;
  final $Res Function(StatusDistribution) _then;

/// Create a copy of StatusDistribution
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? watching = freezed,Object? completed = freezed,Object? onHold = freezed,Object? dropped = freezed,Object? planToWatch = freezed,}) {
  return _then(_self.copyWith(
watching: freezed == watching ? _self.watching : watching // ignore: cast_nullable_to_non_nullable
as String?,completed: freezed == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as String?,onHold: freezed == onHold ? _self.onHold : onHold // ignore: cast_nullable_to_non_nullable
as String?,dropped: freezed == dropped ? _self.dropped : dropped // ignore: cast_nullable_to_non_nullable
as String?,planToWatch: freezed == planToWatch ? _self.planToWatch : planToWatch // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StatusDistribution].
extension StatusDistributionPatterns on StatusDistribution {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StatusDistribution value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StatusDistribution() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StatusDistribution value)  $default,){
final _that = this;
switch (_that) {
case _StatusDistribution():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StatusDistribution value)?  $default,){
final _that = this;
switch (_that) {
case _StatusDistribution() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? watching,  String? completed,  String? onHold,  String? dropped,  String? planToWatch)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StatusDistribution() when $default != null:
return $default(_that.watching,_that.completed,_that.onHold,_that.dropped,_that.planToWatch);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? watching,  String? completed,  String? onHold,  String? dropped,  String? planToWatch)  $default,) {final _that = this;
switch (_that) {
case _StatusDistribution():
return $default(_that.watching,_that.completed,_that.onHold,_that.dropped,_that.planToWatch);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? watching,  String? completed,  String? onHold,  String? dropped,  String? planToWatch)?  $default,) {final _that = this;
switch (_that) {
case _StatusDistribution() when $default != null:
return $default(_that.watching,_that.completed,_that.onHold,_that.dropped,_that.planToWatch);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StatusDistribution implements StatusDistribution {
  const _StatusDistribution({this.watching, this.completed, this.onHold, this.dropped, this.planToWatch});
  factory _StatusDistribution.fromJson(Map<String, dynamic> json) => _$StatusDistributionFromJson(json);

@override final  String? watching;
@override final  String? completed;
@override final  String? onHold;
@override final  String? dropped;
@override final  String? planToWatch;

/// Create a copy of StatusDistribution
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatusDistributionCopyWith<_StatusDistribution> get copyWith => __$StatusDistributionCopyWithImpl<_StatusDistribution>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StatusDistributionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatusDistribution&&(identical(other.watching, watching) || other.watching == watching)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.onHold, onHold) || other.onHold == onHold)&&(identical(other.dropped, dropped) || other.dropped == dropped)&&(identical(other.planToWatch, planToWatch) || other.planToWatch == planToWatch));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,watching,completed,onHold,dropped,planToWatch);

@override
String toString() {
  return 'StatusDistribution(watching: $watching, completed: $completed, onHold: $onHold, dropped: $dropped, planToWatch: $planToWatch)';
}


}

/// @nodoc
abstract mixin class _$StatusDistributionCopyWith<$Res> implements $StatusDistributionCopyWith<$Res> {
  factory _$StatusDistributionCopyWith(_StatusDistribution value, $Res Function(_StatusDistribution) _then) = __$StatusDistributionCopyWithImpl;
@override @useResult
$Res call({
 String? watching, String? completed, String? onHold, String? dropped, String? planToWatch
});




}
/// @nodoc
class __$StatusDistributionCopyWithImpl<$Res>
    implements _$StatusDistributionCopyWith<$Res> {
  __$StatusDistributionCopyWithImpl(this._self, this._then);

  final _StatusDistribution _self;
  final $Res Function(_StatusDistribution) _then;

/// Create a copy of StatusDistribution
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? watching = freezed,Object? completed = freezed,Object? onHold = freezed,Object? dropped = freezed,Object? planToWatch = freezed,}) {
  return _then(_StatusDistribution(
watching: freezed == watching ? _self.watching : watching // ignore: cast_nullable_to_non_nullable
as String?,completed: freezed == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as String?,onHold: freezed == onHold ? _self.onHold : onHold // ignore: cast_nullable_to_non_nullable
as String?,dropped: freezed == dropped ? _self.dropped : dropped // ignore: cast_nullable_to_non_nullable
as String?,planToWatch: freezed == planToWatch ? _self.planToWatch : planToWatch // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
