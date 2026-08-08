// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Data {

 Node get node; Ranking? get ranking; MyListStatus? get listStatus;
/// Create a copy of Data
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DataCopyWith<Data> get copyWith => _$DataCopyWithImpl<Data>(this as Data, _$identity);

  /// Serializes this Data to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Data&&(identical(other.node, node) || other.node == node)&&(identical(other.ranking, ranking) || other.ranking == ranking)&&(identical(other.listStatus, listStatus) || other.listStatus == listStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,node,ranking,listStatus);

@override
String toString() {
  return 'Data(node: $node, ranking: $ranking, listStatus: $listStatus)';
}


}

/// @nodoc
abstract mixin class $DataCopyWith<$Res>  {
  factory $DataCopyWith(Data value, $Res Function(Data) _then) = _$DataCopyWithImpl;
@useResult
$Res call({
 Node node, Ranking? ranking, MyListStatus? listStatus
});


$NodeCopyWith<$Res> get node;$RankingCopyWith<$Res>? get ranking;$MyListStatusCopyWith<$Res>? get listStatus;

}
/// @nodoc
class _$DataCopyWithImpl<$Res>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._self, this._then);

  final Data _self;
  final $Res Function(Data) _then;

/// Create a copy of Data
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? node = null,Object? ranking = freezed,Object? listStatus = freezed,}) {
  return _then(_self.copyWith(
node: null == node ? _self.node : node // ignore: cast_nullable_to_non_nullable
as Node,ranking: freezed == ranking ? _self.ranking : ranking // ignore: cast_nullable_to_non_nullable
as Ranking?,listStatus: freezed == listStatus ? _self.listStatus : listStatus // ignore: cast_nullable_to_non_nullable
as MyListStatus?,
  ));
}
/// Create a copy of Data
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NodeCopyWith<$Res> get node {
  
  return $NodeCopyWith<$Res>(_self.node, (value) {
    return _then(_self.copyWith(node: value));
  });
}/// Create a copy of Data
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RankingCopyWith<$Res>? get ranking {
    if (_self.ranking == null) {
    return null;
  }

  return $RankingCopyWith<$Res>(_self.ranking!, (value) {
    return _then(_self.copyWith(ranking: value));
  });
}/// Create a copy of Data
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyListStatusCopyWith<$Res>? get listStatus {
    if (_self.listStatus == null) {
    return null;
  }

  return $MyListStatusCopyWith<$Res>(_self.listStatus!, (value) {
    return _then(_self.copyWith(listStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [Data].
extension DataPatterns on Data {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Data value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Data() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Data value)  $default,){
final _that = this;
switch (_that) {
case _Data():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Data value)?  $default,){
final _that = this;
switch (_that) {
case _Data() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Node node,  Ranking? ranking,  MyListStatus? listStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Data() when $default != null:
return $default(_that.node,_that.ranking,_that.listStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Node node,  Ranking? ranking,  MyListStatus? listStatus)  $default,) {final _that = this;
switch (_that) {
case _Data():
return $default(_that.node,_that.ranking,_that.listStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Node node,  Ranking? ranking,  MyListStatus? listStatus)?  $default,) {final _that = this;
switch (_that) {
case _Data() when $default != null:
return $default(_that.node,_that.ranking,_that.listStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Data implements Data {
  const _Data({required this.node, this.ranking, this.listStatus});
  factory _Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

@override final  Node node;
@override final  Ranking? ranking;
@override final  MyListStatus? listStatus;

/// Create a copy of Data
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DataCopyWith<_Data> get copyWith => __$DataCopyWithImpl<_Data>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Data&&(identical(other.node, node) || other.node == node)&&(identical(other.ranking, ranking) || other.ranking == ranking)&&(identical(other.listStatus, listStatus) || other.listStatus == listStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,node,ranking,listStatus);

@override
String toString() {
  return 'Data(node: $node, ranking: $ranking, listStatus: $listStatus)';
}


}

/// @nodoc
abstract mixin class _$DataCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) _then) = __$DataCopyWithImpl;
@override @useResult
$Res call({
 Node node, Ranking? ranking, MyListStatus? listStatus
});


@override $NodeCopyWith<$Res> get node;@override $RankingCopyWith<$Res>? get ranking;@override $MyListStatusCopyWith<$Res>? get listStatus;

}
/// @nodoc
class __$DataCopyWithImpl<$Res>
    implements _$DataCopyWith<$Res> {
  __$DataCopyWithImpl(this._self, this._then);

  final _Data _self;
  final $Res Function(_Data) _then;

/// Create a copy of Data
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? node = null,Object? ranking = freezed,Object? listStatus = freezed,}) {
  return _then(_Data(
node: null == node ? _self.node : node // ignore: cast_nullable_to_non_nullable
as Node,ranking: freezed == ranking ? _self.ranking : ranking // ignore: cast_nullable_to_non_nullable
as Ranking?,listStatus: freezed == listStatus ? _self.listStatus : listStatus // ignore: cast_nullable_to_non_nullable
as MyListStatus?,
  ));
}

/// Create a copy of Data
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NodeCopyWith<$Res> get node {
  
  return $NodeCopyWith<$Res>(_self.node, (value) {
    return _then(_self.copyWith(node: value));
  });
}/// Create a copy of Data
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RankingCopyWith<$Res>? get ranking {
    if (_self.ranking == null) {
    return null;
  }

  return $RankingCopyWith<$Res>(_self.ranking!, (value) {
    return _then(_self.copyWith(ranking: value));
  });
}/// Create a copy of Data
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyListStatusCopyWith<$Res>? get listStatus {
    if (_self.listStatus == null) {
    return null;
  }

  return $MyListStatusCopyWith<$Res>(_self.listStatus!, (value) {
    return _then(_self.copyWith(listStatus: value));
  });
}
}

// dart format on
