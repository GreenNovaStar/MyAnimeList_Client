// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Node {

 int? get id;// Nullable: most nodes carry a title, but person/author nodes (returned in
// manga authors[]) instead have first_name/last_name and no title.
 String? get title; Picture? get mainPicture; AlternativeTitles? get alternativeTitles;// Person-node fields (manga authors).
 String? get firstName; String? get lastName;// Optional fields present when a richer `fields` set is requested (and for
// manga nodes). Nullable so plain anime nodes are unaffected.
// json_serializable coerces JSON num -> double automatically, so an
// integer `mean` from the API no longer crashes (the old hand-written bug).
 double? get mean; String? get mediaType; String? get status; int? get numEpisodes;// anime
 int? get numChapters;// manga
 int? get numVolumes;
/// Create a copy of Node
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NodeCopyWith<Node> get copyWith => _$NodeCopyWithImpl<Node>(this as Node, _$identity);

  /// Serializes this Node to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Node&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.mainPicture, mainPicture) || other.mainPicture == mainPicture)&&(identical(other.alternativeTitles, alternativeTitles) || other.alternativeTitles == alternativeTitles)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.mean, mean) || other.mean == mean)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.status, status) || other.status == status)&&(identical(other.numEpisodes, numEpisodes) || other.numEpisodes == numEpisodes)&&(identical(other.numChapters, numChapters) || other.numChapters == numChapters)&&(identical(other.numVolumes, numVolumes) || other.numVolumes == numVolumes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,mainPicture,alternativeTitles,firstName,lastName,mean,mediaType,status,numEpisodes,numChapters,numVolumes);

@override
String toString() {
  return 'Node(id: $id, title: $title, mainPicture: $mainPicture, alternativeTitles: $alternativeTitles, firstName: $firstName, lastName: $lastName, mean: $mean, mediaType: $mediaType, status: $status, numEpisodes: $numEpisodes, numChapters: $numChapters, numVolumes: $numVolumes)';
}


}

/// @nodoc
abstract mixin class $NodeCopyWith<$Res>  {
  factory $NodeCopyWith(Node value, $Res Function(Node) _then) = _$NodeCopyWithImpl;
@useResult
$Res call({
 int? id, String? title, Picture? mainPicture, AlternativeTitles? alternativeTitles, String? firstName, String? lastName, double? mean, String? mediaType, String? status, int? numEpisodes, int? numChapters, int? numVolumes
});


$PictureCopyWith<$Res>? get mainPicture;$AlternativeTitlesCopyWith<$Res>? get alternativeTitles;

}
/// @nodoc
class _$NodeCopyWithImpl<$Res>
    implements $NodeCopyWith<$Res> {
  _$NodeCopyWithImpl(this._self, this._then);

  final Node _self;
  final $Res Function(Node) _then;

/// Create a copy of Node
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,Object? mainPicture = freezed,Object? alternativeTitles = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? mean = freezed,Object? mediaType = freezed,Object? status = freezed,Object? numEpisodes = freezed,Object? numChapters = freezed,Object? numVolumes = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,mainPicture: freezed == mainPicture ? _self.mainPicture : mainPicture // ignore: cast_nullable_to_non_nullable
as Picture?,alternativeTitles: freezed == alternativeTitles ? _self.alternativeTitles : alternativeTitles // ignore: cast_nullable_to_non_nullable
as AlternativeTitles?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,mean: freezed == mean ? _self.mean : mean // ignore: cast_nullable_to_non_nullable
as double?,mediaType: freezed == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,numEpisodes: freezed == numEpisodes ? _self.numEpisodes : numEpisodes // ignore: cast_nullable_to_non_nullable
as int?,numChapters: freezed == numChapters ? _self.numChapters : numChapters // ignore: cast_nullable_to_non_nullable
as int?,numVolumes: freezed == numVolumes ? _self.numVolumes : numVolumes // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of Node
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PictureCopyWith<$Res>? get mainPicture {
    if (_self.mainPicture == null) {
    return null;
  }

  return $PictureCopyWith<$Res>(_self.mainPicture!, (value) {
    return _then(_self.copyWith(mainPicture: value));
  });
}/// Create a copy of Node
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AlternativeTitlesCopyWith<$Res>? get alternativeTitles {
    if (_self.alternativeTitles == null) {
    return null;
  }

  return $AlternativeTitlesCopyWith<$Res>(_self.alternativeTitles!, (value) {
    return _then(_self.copyWith(alternativeTitles: value));
  });
}
}


/// Adds pattern-matching-related methods to [Node].
extension NodePatterns on Node {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Node value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Node() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Node value)  $default,){
final _that = this;
switch (_that) {
case _Node():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Node value)?  $default,){
final _that = this;
switch (_that) {
case _Node() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? title,  Picture? mainPicture,  AlternativeTitles? alternativeTitles,  String? firstName,  String? lastName,  double? mean,  String? mediaType,  String? status,  int? numEpisodes,  int? numChapters,  int? numVolumes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Node() when $default != null:
return $default(_that.id,_that.title,_that.mainPicture,_that.alternativeTitles,_that.firstName,_that.lastName,_that.mean,_that.mediaType,_that.status,_that.numEpisodes,_that.numChapters,_that.numVolumes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? title,  Picture? mainPicture,  AlternativeTitles? alternativeTitles,  String? firstName,  String? lastName,  double? mean,  String? mediaType,  String? status,  int? numEpisodes,  int? numChapters,  int? numVolumes)  $default,) {final _that = this;
switch (_that) {
case _Node():
return $default(_that.id,_that.title,_that.mainPicture,_that.alternativeTitles,_that.firstName,_that.lastName,_that.mean,_that.mediaType,_that.status,_that.numEpisodes,_that.numChapters,_that.numVolumes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? title,  Picture? mainPicture,  AlternativeTitles? alternativeTitles,  String? firstName,  String? lastName,  double? mean,  String? mediaType,  String? status,  int? numEpisodes,  int? numChapters,  int? numVolumes)?  $default,) {final _that = this;
switch (_that) {
case _Node() when $default != null:
return $default(_that.id,_that.title,_that.mainPicture,_that.alternativeTitles,_that.firstName,_that.lastName,_that.mean,_that.mediaType,_that.status,_that.numEpisodes,_that.numChapters,_that.numVolumes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Node implements Node {
  const _Node({this.id, this.title, this.mainPicture, this.alternativeTitles, this.firstName, this.lastName, this.mean, this.mediaType, this.status, this.numEpisodes, this.numChapters, this.numVolumes});
  factory _Node.fromJson(Map<String, dynamic> json) => _$NodeFromJson(json);

@override final  int? id;
// Nullable: most nodes carry a title, but person/author nodes (returned in
// manga authors[]) instead have first_name/last_name and no title.
@override final  String? title;
@override final  Picture? mainPicture;
@override final  AlternativeTitles? alternativeTitles;
// Person-node fields (manga authors).
@override final  String? firstName;
@override final  String? lastName;
// Optional fields present when a richer `fields` set is requested (and for
// manga nodes). Nullable so plain anime nodes are unaffected.
// json_serializable coerces JSON num -> double automatically, so an
// integer `mean` from the API no longer crashes (the old hand-written bug).
@override final  double? mean;
@override final  String? mediaType;
@override final  String? status;
@override final  int? numEpisodes;
// anime
@override final  int? numChapters;
// manga
@override final  int? numVolumes;

/// Create a copy of Node
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NodeCopyWith<_Node> get copyWith => __$NodeCopyWithImpl<_Node>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NodeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Node&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.mainPicture, mainPicture) || other.mainPicture == mainPicture)&&(identical(other.alternativeTitles, alternativeTitles) || other.alternativeTitles == alternativeTitles)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.mean, mean) || other.mean == mean)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.status, status) || other.status == status)&&(identical(other.numEpisodes, numEpisodes) || other.numEpisodes == numEpisodes)&&(identical(other.numChapters, numChapters) || other.numChapters == numChapters)&&(identical(other.numVolumes, numVolumes) || other.numVolumes == numVolumes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,mainPicture,alternativeTitles,firstName,lastName,mean,mediaType,status,numEpisodes,numChapters,numVolumes);

@override
String toString() {
  return 'Node(id: $id, title: $title, mainPicture: $mainPicture, alternativeTitles: $alternativeTitles, firstName: $firstName, lastName: $lastName, mean: $mean, mediaType: $mediaType, status: $status, numEpisodes: $numEpisodes, numChapters: $numChapters, numVolumes: $numVolumes)';
}


}

/// @nodoc
abstract mixin class _$NodeCopyWith<$Res> implements $NodeCopyWith<$Res> {
  factory _$NodeCopyWith(_Node value, $Res Function(_Node) _then) = __$NodeCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? title, Picture? mainPicture, AlternativeTitles? alternativeTitles, String? firstName, String? lastName, double? mean, String? mediaType, String? status, int? numEpisodes, int? numChapters, int? numVolumes
});


@override $PictureCopyWith<$Res>? get mainPicture;@override $AlternativeTitlesCopyWith<$Res>? get alternativeTitles;

}
/// @nodoc
class __$NodeCopyWithImpl<$Res>
    implements _$NodeCopyWith<$Res> {
  __$NodeCopyWithImpl(this._self, this._then);

  final _Node _self;
  final $Res Function(_Node) _then;

/// Create a copy of Node
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,Object? mainPicture = freezed,Object? alternativeTitles = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? mean = freezed,Object? mediaType = freezed,Object? status = freezed,Object? numEpisodes = freezed,Object? numChapters = freezed,Object? numVolumes = freezed,}) {
  return _then(_Node(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,mainPicture: freezed == mainPicture ? _self.mainPicture : mainPicture // ignore: cast_nullable_to_non_nullable
as Picture?,alternativeTitles: freezed == alternativeTitles ? _self.alternativeTitles : alternativeTitles // ignore: cast_nullable_to_non_nullable
as AlternativeTitles?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,mean: freezed == mean ? _self.mean : mean // ignore: cast_nullable_to_non_nullable
as double?,mediaType: freezed == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,numEpisodes: freezed == numEpisodes ? _self.numEpisodes : numEpisodes // ignore: cast_nullable_to_non_nullable
as int?,numChapters: freezed == numChapters ? _self.numChapters : numChapters // ignore: cast_nullable_to_non_nullable
as int?,numVolumes: freezed == numVolumes ? _self.numVolumes : numVolumes // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of Node
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PictureCopyWith<$Res>? get mainPicture {
    if (_self.mainPicture == null) {
    return null;
  }

  return $PictureCopyWith<$Res>(_self.mainPicture!, (value) {
    return _then(_self.copyWith(mainPicture: value));
  });
}/// Create a copy of Node
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AlternativeTitlesCopyWith<$Res>? get alternativeTitles {
    if (_self.alternativeTitles == null) {
    return null;
  }

  return $AlternativeTitlesCopyWith<$Res>(_self.alternativeTitles!, (value) {
    return _then(_self.copyWith(alternativeTitles: value));
  });
}
}

// dart format on
