// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manga_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MangaDetails {

 int? get id; String? get title; Picture? get mainPicture; AlternativeTitles? get alternativeTitles; String? get startDate; String? get endDate; String? get synopsis; double? get mean; int? get rank; int? get popularity; int? get numListUsers; int? get numScoringUsers; String? get nsfw; String? get createdAt; String? get updatedAt; String? get mediaType; String? get status; List<Genres>? get genres; MyListStatus? get myListStatus; int? get numVolumes; int? get numChapters; List<Author>? get authors; List<Picture>? get pictures; String? get background; List<RelatedAnime>? get relatedAnime; List<RelatedManga>? get relatedManga; List<Recommendations>? get recommendations;@_SerializationConverter() List<String>? get serialization; Statistics? get statistics;
/// Create a copy of MangaDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MangaDetailsCopyWith<MangaDetails> get copyWith => _$MangaDetailsCopyWithImpl<MangaDetails>(this as MangaDetails, _$identity);

  /// Serializes this MangaDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MangaDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.mainPicture, mainPicture) || other.mainPicture == mainPicture)&&(identical(other.alternativeTitles, alternativeTitles) || other.alternativeTitles == alternativeTitles)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.synopsis, synopsis) || other.synopsis == synopsis)&&(identical(other.mean, mean) || other.mean == mean)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.numListUsers, numListUsers) || other.numListUsers == numListUsers)&&(identical(other.numScoringUsers, numScoringUsers) || other.numScoringUsers == numScoringUsers)&&(identical(other.nsfw, nsfw) || other.nsfw == nsfw)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.genres, genres)&&(identical(other.myListStatus, myListStatus) || other.myListStatus == myListStatus)&&(identical(other.numVolumes, numVolumes) || other.numVolumes == numVolumes)&&(identical(other.numChapters, numChapters) || other.numChapters == numChapters)&&const DeepCollectionEquality().equals(other.authors, authors)&&const DeepCollectionEquality().equals(other.pictures, pictures)&&(identical(other.background, background) || other.background == background)&&const DeepCollectionEquality().equals(other.relatedAnime, relatedAnime)&&const DeepCollectionEquality().equals(other.relatedManga, relatedManga)&&const DeepCollectionEquality().equals(other.recommendations, recommendations)&&const DeepCollectionEquality().equals(other.serialization, serialization)&&(identical(other.statistics, statistics) || other.statistics == statistics));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,mainPicture,alternativeTitles,startDate,endDate,synopsis,mean,rank,popularity,numListUsers,numScoringUsers,nsfw,createdAt,updatedAt,mediaType,status,const DeepCollectionEquality().hash(genres),myListStatus,numVolumes,numChapters,const DeepCollectionEquality().hash(authors),const DeepCollectionEquality().hash(pictures),background,const DeepCollectionEquality().hash(relatedAnime),const DeepCollectionEquality().hash(relatedManga),const DeepCollectionEquality().hash(recommendations),const DeepCollectionEquality().hash(serialization),statistics]);

@override
String toString() {
  return 'MangaDetails(id: $id, title: $title, mainPicture: $mainPicture, alternativeTitles: $alternativeTitles, startDate: $startDate, endDate: $endDate, synopsis: $synopsis, mean: $mean, rank: $rank, popularity: $popularity, numListUsers: $numListUsers, numScoringUsers: $numScoringUsers, nsfw: $nsfw, createdAt: $createdAt, updatedAt: $updatedAt, mediaType: $mediaType, status: $status, genres: $genres, myListStatus: $myListStatus, numVolumes: $numVolumes, numChapters: $numChapters, authors: $authors, pictures: $pictures, background: $background, relatedAnime: $relatedAnime, relatedManga: $relatedManga, recommendations: $recommendations, serialization: $serialization, statistics: $statistics)';
}


}

/// @nodoc
abstract mixin class $MangaDetailsCopyWith<$Res>  {
  factory $MangaDetailsCopyWith(MangaDetails value, $Res Function(MangaDetails) _then) = _$MangaDetailsCopyWithImpl;
@useResult
$Res call({
 int? id, String? title, Picture? mainPicture, AlternativeTitles? alternativeTitles, String? startDate, String? endDate, String? synopsis, double? mean, int? rank, int? popularity, int? numListUsers, int? numScoringUsers, String? nsfw, String? createdAt, String? updatedAt, String? mediaType, String? status, List<Genres>? genres, MyListStatus? myListStatus, int? numVolumes, int? numChapters, List<Author>? authors, List<Picture>? pictures, String? background, List<RelatedAnime>? relatedAnime, List<RelatedManga>? relatedManga, List<Recommendations>? recommendations,@_SerializationConverter() List<String>? serialization, Statistics? statistics
});


$PictureCopyWith<$Res>? get mainPicture;$AlternativeTitlesCopyWith<$Res>? get alternativeTitles;$MyListStatusCopyWith<$Res>? get myListStatus;$StatisticsCopyWith<$Res>? get statistics;

}
/// @nodoc
class _$MangaDetailsCopyWithImpl<$Res>
    implements $MangaDetailsCopyWith<$Res> {
  _$MangaDetailsCopyWithImpl(this._self, this._then);

  final MangaDetails _self;
  final $Res Function(MangaDetails) _then;

/// Create a copy of MangaDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,Object? mainPicture = freezed,Object? alternativeTitles = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? synopsis = freezed,Object? mean = freezed,Object? rank = freezed,Object? popularity = freezed,Object? numListUsers = freezed,Object? numScoringUsers = freezed,Object? nsfw = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? mediaType = freezed,Object? status = freezed,Object? genres = freezed,Object? myListStatus = freezed,Object? numVolumes = freezed,Object? numChapters = freezed,Object? authors = freezed,Object? pictures = freezed,Object? background = freezed,Object? relatedAnime = freezed,Object? relatedManga = freezed,Object? recommendations = freezed,Object? serialization = freezed,Object? statistics = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,mainPicture: freezed == mainPicture ? _self.mainPicture : mainPicture // ignore: cast_nullable_to_non_nullable
as Picture?,alternativeTitles: freezed == alternativeTitles ? _self.alternativeTitles : alternativeTitles // ignore: cast_nullable_to_non_nullable
as AlternativeTitles?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,synopsis: freezed == synopsis ? _self.synopsis : synopsis // ignore: cast_nullable_to_non_nullable
as String?,mean: freezed == mean ? _self.mean : mean // ignore: cast_nullable_to_non_nullable
as double?,rank: freezed == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int?,popularity: freezed == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as int?,numListUsers: freezed == numListUsers ? _self.numListUsers : numListUsers // ignore: cast_nullable_to_non_nullable
as int?,numScoringUsers: freezed == numScoringUsers ? _self.numScoringUsers : numScoringUsers // ignore: cast_nullable_to_non_nullable
as int?,nsfw: freezed == nsfw ? _self.nsfw : nsfw // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,mediaType: freezed == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,genres: freezed == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<Genres>?,myListStatus: freezed == myListStatus ? _self.myListStatus : myListStatus // ignore: cast_nullable_to_non_nullable
as MyListStatus?,numVolumes: freezed == numVolumes ? _self.numVolumes : numVolumes // ignore: cast_nullable_to_non_nullable
as int?,numChapters: freezed == numChapters ? _self.numChapters : numChapters // ignore: cast_nullable_to_non_nullable
as int?,authors: freezed == authors ? _self.authors : authors // ignore: cast_nullable_to_non_nullable
as List<Author>?,pictures: freezed == pictures ? _self.pictures : pictures // ignore: cast_nullable_to_non_nullable
as List<Picture>?,background: freezed == background ? _self.background : background // ignore: cast_nullable_to_non_nullable
as String?,relatedAnime: freezed == relatedAnime ? _self.relatedAnime : relatedAnime // ignore: cast_nullable_to_non_nullable
as List<RelatedAnime>?,relatedManga: freezed == relatedManga ? _self.relatedManga : relatedManga // ignore: cast_nullable_to_non_nullable
as List<RelatedManga>?,recommendations: freezed == recommendations ? _self.recommendations : recommendations // ignore: cast_nullable_to_non_nullable
as List<Recommendations>?,serialization: freezed == serialization ? _self.serialization : serialization // ignore: cast_nullable_to_non_nullable
as List<String>?,statistics: freezed == statistics ? _self.statistics : statistics // ignore: cast_nullable_to_non_nullable
as Statistics?,
  ));
}
/// Create a copy of MangaDetails
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
}/// Create a copy of MangaDetails
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
}/// Create a copy of MangaDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyListStatusCopyWith<$Res>? get myListStatus {
    if (_self.myListStatus == null) {
    return null;
  }

  return $MyListStatusCopyWith<$Res>(_self.myListStatus!, (value) {
    return _then(_self.copyWith(myListStatus: value));
  });
}/// Create a copy of MangaDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatisticsCopyWith<$Res>? get statistics {
    if (_self.statistics == null) {
    return null;
  }

  return $StatisticsCopyWith<$Res>(_self.statistics!, (value) {
    return _then(_self.copyWith(statistics: value));
  });
}
}


/// Adds pattern-matching-related methods to [MangaDetails].
extension MangaDetailsPatterns on MangaDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MangaDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MangaDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MangaDetails value)  $default,){
final _that = this;
switch (_that) {
case _MangaDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MangaDetails value)?  $default,){
final _that = this;
switch (_that) {
case _MangaDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? title,  Picture? mainPicture,  AlternativeTitles? alternativeTitles,  String? startDate,  String? endDate,  String? synopsis,  double? mean,  int? rank,  int? popularity,  int? numListUsers,  int? numScoringUsers,  String? nsfw,  String? createdAt,  String? updatedAt,  String? mediaType,  String? status,  List<Genres>? genres,  MyListStatus? myListStatus,  int? numVolumes,  int? numChapters,  List<Author>? authors,  List<Picture>? pictures,  String? background,  List<RelatedAnime>? relatedAnime,  List<RelatedManga>? relatedManga,  List<Recommendations>? recommendations, @_SerializationConverter()  List<String>? serialization,  Statistics? statistics)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MangaDetails() when $default != null:
return $default(_that.id,_that.title,_that.mainPicture,_that.alternativeTitles,_that.startDate,_that.endDate,_that.synopsis,_that.mean,_that.rank,_that.popularity,_that.numListUsers,_that.numScoringUsers,_that.nsfw,_that.createdAt,_that.updatedAt,_that.mediaType,_that.status,_that.genres,_that.myListStatus,_that.numVolumes,_that.numChapters,_that.authors,_that.pictures,_that.background,_that.relatedAnime,_that.relatedManga,_that.recommendations,_that.serialization,_that.statistics);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? title,  Picture? mainPicture,  AlternativeTitles? alternativeTitles,  String? startDate,  String? endDate,  String? synopsis,  double? mean,  int? rank,  int? popularity,  int? numListUsers,  int? numScoringUsers,  String? nsfw,  String? createdAt,  String? updatedAt,  String? mediaType,  String? status,  List<Genres>? genres,  MyListStatus? myListStatus,  int? numVolumes,  int? numChapters,  List<Author>? authors,  List<Picture>? pictures,  String? background,  List<RelatedAnime>? relatedAnime,  List<RelatedManga>? relatedManga,  List<Recommendations>? recommendations, @_SerializationConverter()  List<String>? serialization,  Statistics? statistics)  $default,) {final _that = this;
switch (_that) {
case _MangaDetails():
return $default(_that.id,_that.title,_that.mainPicture,_that.alternativeTitles,_that.startDate,_that.endDate,_that.synopsis,_that.mean,_that.rank,_that.popularity,_that.numListUsers,_that.numScoringUsers,_that.nsfw,_that.createdAt,_that.updatedAt,_that.mediaType,_that.status,_that.genres,_that.myListStatus,_that.numVolumes,_that.numChapters,_that.authors,_that.pictures,_that.background,_that.relatedAnime,_that.relatedManga,_that.recommendations,_that.serialization,_that.statistics);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? title,  Picture? mainPicture,  AlternativeTitles? alternativeTitles,  String? startDate,  String? endDate,  String? synopsis,  double? mean,  int? rank,  int? popularity,  int? numListUsers,  int? numScoringUsers,  String? nsfw,  String? createdAt,  String? updatedAt,  String? mediaType,  String? status,  List<Genres>? genres,  MyListStatus? myListStatus,  int? numVolumes,  int? numChapters,  List<Author>? authors,  List<Picture>? pictures,  String? background,  List<RelatedAnime>? relatedAnime,  List<RelatedManga>? relatedManga,  List<Recommendations>? recommendations, @_SerializationConverter()  List<String>? serialization,  Statistics? statistics)?  $default,) {final _that = this;
switch (_that) {
case _MangaDetails() when $default != null:
return $default(_that.id,_that.title,_that.mainPicture,_that.alternativeTitles,_that.startDate,_that.endDate,_that.synopsis,_that.mean,_that.rank,_that.popularity,_that.numListUsers,_that.numScoringUsers,_that.nsfw,_that.createdAt,_that.updatedAt,_that.mediaType,_that.status,_that.genres,_that.myListStatus,_that.numVolumes,_that.numChapters,_that.authors,_that.pictures,_that.background,_that.relatedAnime,_that.relatedManga,_that.recommendations,_that.serialization,_that.statistics);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MangaDetails implements MangaDetails {
  const _MangaDetails({this.id, this.title, this.mainPicture, this.alternativeTitles, this.startDate, this.endDate, this.synopsis, this.mean, this.rank, this.popularity, this.numListUsers, this.numScoringUsers, this.nsfw, this.createdAt, this.updatedAt, this.mediaType, this.status, final  List<Genres>? genres, this.myListStatus, this.numVolumes, this.numChapters, final  List<Author>? authors, final  List<Picture>? pictures, this.background, final  List<RelatedAnime>? relatedAnime, final  List<RelatedManga>? relatedManga, final  List<Recommendations>? recommendations, @_SerializationConverter() final  List<String>? serialization, this.statistics}): _genres = genres,_authors = authors,_pictures = pictures,_relatedAnime = relatedAnime,_relatedManga = relatedManga,_recommendations = recommendations,_serialization = serialization;
  factory _MangaDetails.fromJson(Map<String, dynamic> json) => _$MangaDetailsFromJson(json);

@override final  int? id;
@override final  String? title;
@override final  Picture? mainPicture;
@override final  AlternativeTitles? alternativeTitles;
@override final  String? startDate;
@override final  String? endDate;
@override final  String? synopsis;
@override final  double? mean;
@override final  int? rank;
@override final  int? popularity;
@override final  int? numListUsers;
@override final  int? numScoringUsers;
@override final  String? nsfw;
@override final  String? createdAt;
@override final  String? updatedAt;
@override final  String? mediaType;
@override final  String? status;
 final  List<Genres>? _genres;
@override List<Genres>? get genres {
  final value = _genres;
  if (value == null) return null;
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  MyListStatus? myListStatus;
@override final  int? numVolumes;
@override final  int? numChapters;
 final  List<Author>? _authors;
@override List<Author>? get authors {
  final value = _authors;
  if (value == null) return null;
  if (_authors is EqualUnmodifiableListView) return _authors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Picture>? _pictures;
@override List<Picture>? get pictures {
  final value = _pictures;
  if (value == null) return null;
  if (_pictures is EqualUnmodifiableListView) return _pictures;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? background;
 final  List<RelatedAnime>? _relatedAnime;
@override List<RelatedAnime>? get relatedAnime {
  final value = _relatedAnime;
  if (value == null) return null;
  if (_relatedAnime is EqualUnmodifiableListView) return _relatedAnime;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<RelatedManga>? _relatedManga;
@override List<RelatedManga>? get relatedManga {
  final value = _relatedManga;
  if (value == null) return null;
  if (_relatedManga is EqualUnmodifiableListView) return _relatedManga;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Recommendations>? _recommendations;
@override List<Recommendations>? get recommendations {
  final value = _recommendations;
  if (value == null) return null;
  if (_recommendations is EqualUnmodifiableListView) return _recommendations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _serialization;
@override@_SerializationConverter() List<String>? get serialization {
  final value = _serialization;
  if (value == null) return null;
  if (_serialization is EqualUnmodifiableListView) return _serialization;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  Statistics? statistics;

/// Create a copy of MangaDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MangaDetailsCopyWith<_MangaDetails> get copyWith => __$MangaDetailsCopyWithImpl<_MangaDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MangaDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MangaDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.mainPicture, mainPicture) || other.mainPicture == mainPicture)&&(identical(other.alternativeTitles, alternativeTitles) || other.alternativeTitles == alternativeTitles)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.synopsis, synopsis) || other.synopsis == synopsis)&&(identical(other.mean, mean) || other.mean == mean)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.numListUsers, numListUsers) || other.numListUsers == numListUsers)&&(identical(other.numScoringUsers, numScoringUsers) || other.numScoringUsers == numScoringUsers)&&(identical(other.nsfw, nsfw) || other.nsfw == nsfw)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._genres, _genres)&&(identical(other.myListStatus, myListStatus) || other.myListStatus == myListStatus)&&(identical(other.numVolumes, numVolumes) || other.numVolumes == numVolumes)&&(identical(other.numChapters, numChapters) || other.numChapters == numChapters)&&const DeepCollectionEquality().equals(other._authors, _authors)&&const DeepCollectionEquality().equals(other._pictures, _pictures)&&(identical(other.background, background) || other.background == background)&&const DeepCollectionEquality().equals(other._relatedAnime, _relatedAnime)&&const DeepCollectionEquality().equals(other._relatedManga, _relatedManga)&&const DeepCollectionEquality().equals(other._recommendations, _recommendations)&&const DeepCollectionEquality().equals(other._serialization, _serialization)&&(identical(other.statistics, statistics) || other.statistics == statistics));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,mainPicture,alternativeTitles,startDate,endDate,synopsis,mean,rank,popularity,numListUsers,numScoringUsers,nsfw,createdAt,updatedAt,mediaType,status,const DeepCollectionEquality().hash(_genres),myListStatus,numVolumes,numChapters,const DeepCollectionEquality().hash(_authors),const DeepCollectionEquality().hash(_pictures),background,const DeepCollectionEquality().hash(_relatedAnime),const DeepCollectionEquality().hash(_relatedManga),const DeepCollectionEquality().hash(_recommendations),const DeepCollectionEquality().hash(_serialization),statistics]);

@override
String toString() {
  return 'MangaDetails(id: $id, title: $title, mainPicture: $mainPicture, alternativeTitles: $alternativeTitles, startDate: $startDate, endDate: $endDate, synopsis: $synopsis, mean: $mean, rank: $rank, popularity: $popularity, numListUsers: $numListUsers, numScoringUsers: $numScoringUsers, nsfw: $nsfw, createdAt: $createdAt, updatedAt: $updatedAt, mediaType: $mediaType, status: $status, genres: $genres, myListStatus: $myListStatus, numVolumes: $numVolumes, numChapters: $numChapters, authors: $authors, pictures: $pictures, background: $background, relatedAnime: $relatedAnime, relatedManga: $relatedManga, recommendations: $recommendations, serialization: $serialization, statistics: $statistics)';
}


}

/// @nodoc
abstract mixin class _$MangaDetailsCopyWith<$Res> implements $MangaDetailsCopyWith<$Res> {
  factory _$MangaDetailsCopyWith(_MangaDetails value, $Res Function(_MangaDetails) _then) = __$MangaDetailsCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? title, Picture? mainPicture, AlternativeTitles? alternativeTitles, String? startDate, String? endDate, String? synopsis, double? mean, int? rank, int? popularity, int? numListUsers, int? numScoringUsers, String? nsfw, String? createdAt, String? updatedAt, String? mediaType, String? status, List<Genres>? genres, MyListStatus? myListStatus, int? numVolumes, int? numChapters, List<Author>? authors, List<Picture>? pictures, String? background, List<RelatedAnime>? relatedAnime, List<RelatedManga>? relatedManga, List<Recommendations>? recommendations,@_SerializationConverter() List<String>? serialization, Statistics? statistics
});


@override $PictureCopyWith<$Res>? get mainPicture;@override $AlternativeTitlesCopyWith<$Res>? get alternativeTitles;@override $MyListStatusCopyWith<$Res>? get myListStatus;@override $StatisticsCopyWith<$Res>? get statistics;

}
/// @nodoc
class __$MangaDetailsCopyWithImpl<$Res>
    implements _$MangaDetailsCopyWith<$Res> {
  __$MangaDetailsCopyWithImpl(this._self, this._then);

  final _MangaDetails _self;
  final $Res Function(_MangaDetails) _then;

/// Create a copy of MangaDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,Object? mainPicture = freezed,Object? alternativeTitles = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? synopsis = freezed,Object? mean = freezed,Object? rank = freezed,Object? popularity = freezed,Object? numListUsers = freezed,Object? numScoringUsers = freezed,Object? nsfw = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? mediaType = freezed,Object? status = freezed,Object? genres = freezed,Object? myListStatus = freezed,Object? numVolumes = freezed,Object? numChapters = freezed,Object? authors = freezed,Object? pictures = freezed,Object? background = freezed,Object? relatedAnime = freezed,Object? relatedManga = freezed,Object? recommendations = freezed,Object? serialization = freezed,Object? statistics = freezed,}) {
  return _then(_MangaDetails(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,mainPicture: freezed == mainPicture ? _self.mainPicture : mainPicture // ignore: cast_nullable_to_non_nullable
as Picture?,alternativeTitles: freezed == alternativeTitles ? _self.alternativeTitles : alternativeTitles // ignore: cast_nullable_to_non_nullable
as AlternativeTitles?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,synopsis: freezed == synopsis ? _self.synopsis : synopsis // ignore: cast_nullable_to_non_nullable
as String?,mean: freezed == mean ? _self.mean : mean // ignore: cast_nullable_to_non_nullable
as double?,rank: freezed == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int?,popularity: freezed == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as int?,numListUsers: freezed == numListUsers ? _self.numListUsers : numListUsers // ignore: cast_nullable_to_non_nullable
as int?,numScoringUsers: freezed == numScoringUsers ? _self.numScoringUsers : numScoringUsers // ignore: cast_nullable_to_non_nullable
as int?,nsfw: freezed == nsfw ? _self.nsfw : nsfw // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,mediaType: freezed == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,genres: freezed == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<Genres>?,myListStatus: freezed == myListStatus ? _self.myListStatus : myListStatus // ignore: cast_nullable_to_non_nullable
as MyListStatus?,numVolumes: freezed == numVolumes ? _self.numVolumes : numVolumes // ignore: cast_nullable_to_non_nullable
as int?,numChapters: freezed == numChapters ? _self.numChapters : numChapters // ignore: cast_nullable_to_non_nullable
as int?,authors: freezed == authors ? _self._authors : authors // ignore: cast_nullable_to_non_nullable
as List<Author>?,pictures: freezed == pictures ? _self._pictures : pictures // ignore: cast_nullable_to_non_nullable
as List<Picture>?,background: freezed == background ? _self.background : background // ignore: cast_nullable_to_non_nullable
as String?,relatedAnime: freezed == relatedAnime ? _self._relatedAnime : relatedAnime // ignore: cast_nullable_to_non_nullable
as List<RelatedAnime>?,relatedManga: freezed == relatedManga ? _self._relatedManga : relatedManga // ignore: cast_nullable_to_non_nullable
as List<RelatedManga>?,recommendations: freezed == recommendations ? _self._recommendations : recommendations // ignore: cast_nullable_to_non_nullable
as List<Recommendations>?,serialization: freezed == serialization ? _self._serialization : serialization // ignore: cast_nullable_to_non_nullable
as List<String>?,statistics: freezed == statistics ? _self.statistics : statistics // ignore: cast_nullable_to_non_nullable
as Statistics?,
  ));
}

/// Create a copy of MangaDetails
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
}/// Create a copy of MangaDetails
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
}/// Create a copy of MangaDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyListStatusCopyWith<$Res>? get myListStatus {
    if (_self.myListStatus == null) {
    return null;
  }

  return $MyListStatusCopyWith<$Res>(_self.myListStatus!, (value) {
    return _then(_self.copyWith(myListStatus: value));
  });
}/// Create a copy of MangaDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatisticsCopyWith<$Res>? get statistics {
    if (_self.statistics == null) {
    return null;
  }

  return $StatisticsCopyWith<$Res>(_self.statistics!, (value) {
    return _then(_self.copyWith(statistics: value));
  });
}
}

// dart format on
