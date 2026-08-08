// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MediaList {

 List<Data> get data; Paging get paging;
/// Create a copy of MediaList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaListCopyWith<MediaList> get copyWith => _$MediaListCopyWithImpl<MediaList>(this as MediaList, _$identity);

  /// Serializes this MediaList to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaList&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.paging, paging) || other.paging == paging));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),paging);

@override
String toString() {
  return 'MediaList(data: $data, paging: $paging)';
}


}

/// @nodoc
abstract mixin class $MediaListCopyWith<$Res>  {
  factory $MediaListCopyWith(MediaList value, $Res Function(MediaList) _then) = _$MediaListCopyWithImpl;
@useResult
$Res call({
 List<Data> data, Paging paging
});


$PagingCopyWith<$Res> get paging;

}
/// @nodoc
class _$MediaListCopyWithImpl<$Res>
    implements $MediaListCopyWith<$Res> {
  _$MediaListCopyWithImpl(this._self, this._then);

  final MediaList _self;
  final $Res Function(MediaList) _then;

/// Create a copy of MediaList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? paging = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<Data>,paging: null == paging ? _self.paging : paging // ignore: cast_nullable_to_non_nullable
as Paging,
  ));
}
/// Create a copy of MediaList
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PagingCopyWith<$Res> get paging {
  
  return $PagingCopyWith<$Res>(_self.paging, (value) {
    return _then(_self.copyWith(paging: value));
  });
}
}


/// Adds pattern-matching-related methods to [MediaList].
extension MediaListPatterns on MediaList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MediaList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MediaList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MediaList value)  $default,){
final _that = this;
switch (_that) {
case _MediaList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MediaList value)?  $default,){
final _that = this;
switch (_that) {
case _MediaList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Data> data,  Paging paging)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MediaList() when $default != null:
return $default(_that.data,_that.paging);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Data> data,  Paging paging)  $default,) {final _that = this;
switch (_that) {
case _MediaList():
return $default(_that.data,_that.paging);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Data> data,  Paging paging)?  $default,) {final _that = this;
switch (_that) {
case _MediaList() when $default != null:
return $default(_that.data,_that.paging);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MediaList implements MediaList {
  const _MediaList({required final  List<Data> data, required this.paging}): _data = data;
  factory _MediaList.fromJson(Map<String, dynamic> json) => _$MediaListFromJson(json);

 final  List<Data> _data;
@override List<Data> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  Paging paging;

/// Create a copy of MediaList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MediaListCopyWith<_MediaList> get copyWith => __$MediaListCopyWithImpl<_MediaList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MediaListToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MediaList&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.paging, paging) || other.paging == paging));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),paging);

@override
String toString() {
  return 'MediaList(data: $data, paging: $paging)';
}


}

/// @nodoc
abstract mixin class _$MediaListCopyWith<$Res> implements $MediaListCopyWith<$Res> {
  factory _$MediaListCopyWith(_MediaList value, $Res Function(_MediaList) _then) = __$MediaListCopyWithImpl;
@override @useResult
$Res call({
 List<Data> data, Paging paging
});


@override $PagingCopyWith<$Res> get paging;

}
/// @nodoc
class __$MediaListCopyWithImpl<$Res>
    implements _$MediaListCopyWith<$Res> {
  __$MediaListCopyWithImpl(this._self, this._then);

  final _MediaList _self;
  final $Res Function(_MediaList) _then;

/// Create a copy of MediaList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? paging = null,}) {
  return _then(_MediaList(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Data>,paging: null == paging ? _self.paging : paging // ignore: cast_nullable_to_non_nullable
as Paging,
  ));
}

/// Create a copy of MediaList
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PagingCopyWith<$Res> get paging {
  
  return $PagingCopyWith<$Res>(_self.paging, (value) {
    return _then(_self.copyWith(paging: value));
  });
}
}

// dart format on
