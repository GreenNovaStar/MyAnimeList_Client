// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_list_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MyListStatus {

 String? get status;// anime: watching|... ; manga: reading|...
 int? get score; int? get priority; List<String>? get tags; String? get comments; String? get updatedAt; String? get startDate; String? get finishDate;// Anime-specific.
 int? get numEpisodesWatched; bool? get isRewatching; int? get numTimesRewatched; int? get rewatchValue;// Manga-specific.
 int? get numChaptersRead; int? get numVolumesRead; bool? get isRereading; int? get numTimesReread; int? get rereadValue;
/// Create a copy of MyListStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyListStatusCopyWith<MyListStatus> get copyWith => _$MyListStatusCopyWithImpl<MyListStatus>(this as MyListStatus, _$identity);

  /// Serializes this MyListStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyListStatus&&(identical(other.status, status) || other.status == status)&&(identical(other.score, score) || other.score == score)&&(identical(other.priority, priority) || other.priority == priority)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.comments, comments) || other.comments == comments)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.finishDate, finishDate) || other.finishDate == finishDate)&&(identical(other.numEpisodesWatched, numEpisodesWatched) || other.numEpisodesWatched == numEpisodesWatched)&&(identical(other.isRewatching, isRewatching) || other.isRewatching == isRewatching)&&(identical(other.numTimesRewatched, numTimesRewatched) || other.numTimesRewatched == numTimesRewatched)&&(identical(other.rewatchValue, rewatchValue) || other.rewatchValue == rewatchValue)&&(identical(other.numChaptersRead, numChaptersRead) || other.numChaptersRead == numChaptersRead)&&(identical(other.numVolumesRead, numVolumesRead) || other.numVolumesRead == numVolumesRead)&&(identical(other.isRereading, isRereading) || other.isRereading == isRereading)&&(identical(other.numTimesReread, numTimesReread) || other.numTimesReread == numTimesReread)&&(identical(other.rereadValue, rereadValue) || other.rereadValue == rereadValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,score,priority,const DeepCollectionEquality().hash(tags),comments,updatedAt,startDate,finishDate,numEpisodesWatched,isRewatching,numTimesRewatched,rewatchValue,numChaptersRead,numVolumesRead,isRereading,numTimesReread,rereadValue);

@override
String toString() {
  return 'MyListStatus(status: $status, score: $score, priority: $priority, tags: $tags, comments: $comments, updatedAt: $updatedAt, startDate: $startDate, finishDate: $finishDate, numEpisodesWatched: $numEpisodesWatched, isRewatching: $isRewatching, numTimesRewatched: $numTimesRewatched, rewatchValue: $rewatchValue, numChaptersRead: $numChaptersRead, numVolumesRead: $numVolumesRead, isRereading: $isRereading, numTimesReread: $numTimesReread, rereadValue: $rereadValue)';
}


}

/// @nodoc
abstract mixin class $MyListStatusCopyWith<$Res>  {
  factory $MyListStatusCopyWith(MyListStatus value, $Res Function(MyListStatus) _then) = _$MyListStatusCopyWithImpl;
@useResult
$Res call({
 String? status, int? score, int? priority, List<String>? tags, String? comments, String? updatedAt, String? startDate, String? finishDate, int? numEpisodesWatched, bool? isRewatching, int? numTimesRewatched, int? rewatchValue, int? numChaptersRead, int? numVolumesRead, bool? isRereading, int? numTimesReread, int? rereadValue
});




}
/// @nodoc
class _$MyListStatusCopyWithImpl<$Res>
    implements $MyListStatusCopyWith<$Res> {
  _$MyListStatusCopyWithImpl(this._self, this._then);

  final MyListStatus _self;
  final $Res Function(MyListStatus) _then;

/// Create a copy of MyListStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? score = freezed,Object? priority = freezed,Object? tags = freezed,Object? comments = freezed,Object? updatedAt = freezed,Object? startDate = freezed,Object? finishDate = freezed,Object? numEpisodesWatched = freezed,Object? isRewatching = freezed,Object? numTimesRewatched = freezed,Object? rewatchValue = freezed,Object? numChaptersRead = freezed,Object? numVolumesRead = freezed,Object? isRereading = freezed,Object? numTimesReread = freezed,Object? rereadValue = freezed,}) {
  return _then(_self.copyWith(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int?,priority: freezed == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as int?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,comments: freezed == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,finishDate: freezed == finishDate ? _self.finishDate : finishDate // ignore: cast_nullable_to_non_nullable
as String?,numEpisodesWatched: freezed == numEpisodesWatched ? _self.numEpisodesWatched : numEpisodesWatched // ignore: cast_nullable_to_non_nullable
as int?,isRewatching: freezed == isRewatching ? _self.isRewatching : isRewatching // ignore: cast_nullable_to_non_nullable
as bool?,numTimesRewatched: freezed == numTimesRewatched ? _self.numTimesRewatched : numTimesRewatched // ignore: cast_nullable_to_non_nullable
as int?,rewatchValue: freezed == rewatchValue ? _self.rewatchValue : rewatchValue // ignore: cast_nullable_to_non_nullable
as int?,numChaptersRead: freezed == numChaptersRead ? _self.numChaptersRead : numChaptersRead // ignore: cast_nullable_to_non_nullable
as int?,numVolumesRead: freezed == numVolumesRead ? _self.numVolumesRead : numVolumesRead // ignore: cast_nullable_to_non_nullable
as int?,isRereading: freezed == isRereading ? _self.isRereading : isRereading // ignore: cast_nullable_to_non_nullable
as bool?,numTimesReread: freezed == numTimesReread ? _self.numTimesReread : numTimesReread // ignore: cast_nullable_to_non_nullable
as int?,rereadValue: freezed == rereadValue ? _self.rereadValue : rereadValue // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [MyListStatus].
extension MyListStatusPatterns on MyListStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyListStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyListStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyListStatus value)  $default,){
final _that = this;
switch (_that) {
case _MyListStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyListStatus value)?  $default,){
final _that = this;
switch (_that) {
case _MyListStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? status,  int? score,  int? priority,  List<String>? tags,  String? comments,  String? updatedAt,  String? startDate,  String? finishDate,  int? numEpisodesWatched,  bool? isRewatching,  int? numTimesRewatched,  int? rewatchValue,  int? numChaptersRead,  int? numVolumesRead,  bool? isRereading,  int? numTimesReread,  int? rereadValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyListStatus() when $default != null:
return $default(_that.status,_that.score,_that.priority,_that.tags,_that.comments,_that.updatedAt,_that.startDate,_that.finishDate,_that.numEpisodesWatched,_that.isRewatching,_that.numTimesRewatched,_that.rewatchValue,_that.numChaptersRead,_that.numVolumesRead,_that.isRereading,_that.numTimesReread,_that.rereadValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? status,  int? score,  int? priority,  List<String>? tags,  String? comments,  String? updatedAt,  String? startDate,  String? finishDate,  int? numEpisodesWatched,  bool? isRewatching,  int? numTimesRewatched,  int? rewatchValue,  int? numChaptersRead,  int? numVolumesRead,  bool? isRereading,  int? numTimesReread,  int? rereadValue)  $default,) {final _that = this;
switch (_that) {
case _MyListStatus():
return $default(_that.status,_that.score,_that.priority,_that.tags,_that.comments,_that.updatedAt,_that.startDate,_that.finishDate,_that.numEpisodesWatched,_that.isRewatching,_that.numTimesRewatched,_that.rewatchValue,_that.numChaptersRead,_that.numVolumesRead,_that.isRereading,_that.numTimesReread,_that.rereadValue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? status,  int? score,  int? priority,  List<String>? tags,  String? comments,  String? updatedAt,  String? startDate,  String? finishDate,  int? numEpisodesWatched,  bool? isRewatching,  int? numTimesRewatched,  int? rewatchValue,  int? numChaptersRead,  int? numVolumesRead,  bool? isRereading,  int? numTimesReread,  int? rereadValue)?  $default,) {final _that = this;
switch (_that) {
case _MyListStatus() when $default != null:
return $default(_that.status,_that.score,_that.priority,_that.tags,_that.comments,_that.updatedAt,_that.startDate,_that.finishDate,_that.numEpisodesWatched,_that.isRewatching,_that.numTimesRewatched,_that.rewatchValue,_that.numChaptersRead,_that.numVolumesRead,_that.isRereading,_that.numTimesReread,_that.rereadValue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MyListStatus implements MyListStatus {
  const _MyListStatus({this.status, this.score, this.priority, final  List<String>? tags, this.comments, this.updatedAt, this.startDate, this.finishDate, this.numEpisodesWatched, this.isRewatching, this.numTimesRewatched, this.rewatchValue, this.numChaptersRead, this.numVolumesRead, this.isRereading, this.numTimesReread, this.rereadValue}): _tags = tags;
  factory _MyListStatus.fromJson(Map<String, dynamic> json) => _$MyListStatusFromJson(json);

@override final  String? status;
// anime: watching|... ; manga: reading|...
@override final  int? score;
@override final  int? priority;
 final  List<String>? _tags;
@override List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? comments;
@override final  String? updatedAt;
@override final  String? startDate;
@override final  String? finishDate;
// Anime-specific.
@override final  int? numEpisodesWatched;
@override final  bool? isRewatching;
@override final  int? numTimesRewatched;
@override final  int? rewatchValue;
// Manga-specific.
@override final  int? numChaptersRead;
@override final  int? numVolumesRead;
@override final  bool? isRereading;
@override final  int? numTimesReread;
@override final  int? rereadValue;

/// Create a copy of MyListStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyListStatusCopyWith<_MyListStatus> get copyWith => __$MyListStatusCopyWithImpl<_MyListStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyListStatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyListStatus&&(identical(other.status, status) || other.status == status)&&(identical(other.score, score) || other.score == score)&&(identical(other.priority, priority) || other.priority == priority)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.comments, comments) || other.comments == comments)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.finishDate, finishDate) || other.finishDate == finishDate)&&(identical(other.numEpisodesWatched, numEpisodesWatched) || other.numEpisodesWatched == numEpisodesWatched)&&(identical(other.isRewatching, isRewatching) || other.isRewatching == isRewatching)&&(identical(other.numTimesRewatched, numTimesRewatched) || other.numTimesRewatched == numTimesRewatched)&&(identical(other.rewatchValue, rewatchValue) || other.rewatchValue == rewatchValue)&&(identical(other.numChaptersRead, numChaptersRead) || other.numChaptersRead == numChaptersRead)&&(identical(other.numVolumesRead, numVolumesRead) || other.numVolumesRead == numVolumesRead)&&(identical(other.isRereading, isRereading) || other.isRereading == isRereading)&&(identical(other.numTimesReread, numTimesReread) || other.numTimesReread == numTimesReread)&&(identical(other.rereadValue, rereadValue) || other.rereadValue == rereadValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,score,priority,const DeepCollectionEquality().hash(_tags),comments,updatedAt,startDate,finishDate,numEpisodesWatched,isRewatching,numTimesRewatched,rewatchValue,numChaptersRead,numVolumesRead,isRereading,numTimesReread,rereadValue);

@override
String toString() {
  return 'MyListStatus(status: $status, score: $score, priority: $priority, tags: $tags, comments: $comments, updatedAt: $updatedAt, startDate: $startDate, finishDate: $finishDate, numEpisodesWatched: $numEpisodesWatched, isRewatching: $isRewatching, numTimesRewatched: $numTimesRewatched, rewatchValue: $rewatchValue, numChaptersRead: $numChaptersRead, numVolumesRead: $numVolumesRead, isRereading: $isRereading, numTimesReread: $numTimesReread, rereadValue: $rereadValue)';
}


}

/// @nodoc
abstract mixin class _$MyListStatusCopyWith<$Res> implements $MyListStatusCopyWith<$Res> {
  factory _$MyListStatusCopyWith(_MyListStatus value, $Res Function(_MyListStatus) _then) = __$MyListStatusCopyWithImpl;
@override @useResult
$Res call({
 String? status, int? score, int? priority, List<String>? tags, String? comments, String? updatedAt, String? startDate, String? finishDate, int? numEpisodesWatched, bool? isRewatching, int? numTimesRewatched, int? rewatchValue, int? numChaptersRead, int? numVolumesRead, bool? isRereading, int? numTimesReread, int? rereadValue
});




}
/// @nodoc
class __$MyListStatusCopyWithImpl<$Res>
    implements _$MyListStatusCopyWith<$Res> {
  __$MyListStatusCopyWithImpl(this._self, this._then);

  final _MyListStatus _self;
  final $Res Function(_MyListStatus) _then;

/// Create a copy of MyListStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? score = freezed,Object? priority = freezed,Object? tags = freezed,Object? comments = freezed,Object? updatedAt = freezed,Object? startDate = freezed,Object? finishDate = freezed,Object? numEpisodesWatched = freezed,Object? isRewatching = freezed,Object? numTimesRewatched = freezed,Object? rewatchValue = freezed,Object? numChaptersRead = freezed,Object? numVolumesRead = freezed,Object? isRereading = freezed,Object? numTimesReread = freezed,Object? rereadValue = freezed,}) {
  return _then(_MyListStatus(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int?,priority: freezed == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as int?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,comments: freezed == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,finishDate: freezed == finishDate ? _self.finishDate : finishDate // ignore: cast_nullable_to_non_nullable
as String?,numEpisodesWatched: freezed == numEpisodesWatched ? _self.numEpisodesWatched : numEpisodesWatched // ignore: cast_nullable_to_non_nullable
as int?,isRewatching: freezed == isRewatching ? _self.isRewatching : isRewatching // ignore: cast_nullable_to_non_nullable
as bool?,numTimesRewatched: freezed == numTimesRewatched ? _self.numTimesRewatched : numTimesRewatched // ignore: cast_nullable_to_non_nullable
as int?,rewatchValue: freezed == rewatchValue ? _self.rewatchValue : rewatchValue // ignore: cast_nullable_to_non_nullable
as int?,numChaptersRead: freezed == numChaptersRead ? _self.numChaptersRead : numChaptersRead // ignore: cast_nullable_to_non_nullable
as int?,numVolumesRead: freezed == numVolumesRead ? _self.numVolumesRead : numVolumesRead // ignore: cast_nullable_to_non_nullable
as int?,isRereading: freezed == isRereading ? _self.isRereading : isRereading // ignore: cast_nullable_to_non_nullable
as bool?,numTimesReread: freezed == numTimesReread ? _self.numTimesReread : numTimesReread // ignore: cast_nullable_to_non_nullable
as int?,rereadValue: freezed == rereadValue ? _self.rereadValue : rereadValue // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
