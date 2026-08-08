// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnimeDetails {

 int? get id; String? get title; Picture? get mainPicture; AlternativeTitles? get alternativeTitles; String? get startDate; String? get synopsis; double? get mean; int? get rank; int? get popularity; int? get numListUsers; int? get numScoringUsers; String? get nsfw; String? get createdAt; String? get updatedAt; String? get mediaType; String? get status; MyListStatus? get myListStatus; List<Genres>? get genres; int? get numEpisodes; Season? get startSeason; Broadcast? get broadcast; String? get source; int? get averageEpisodeDuration; String? get rating; List<Picture>? get pictures; String? get background; List<RelatedAnime>? get relatedAnime; List<Recommendations>? get recommendations; List<Studios>? get studios; Statistics? get statistics; List<Themes>? get openingThemes; List<Themes>? get endingThemes;
/// Create a copy of AnimeDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnimeDetailsCopyWith<AnimeDetails> get copyWith => _$AnimeDetailsCopyWithImpl<AnimeDetails>(this as AnimeDetails, _$identity);

  /// Serializes this AnimeDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnimeDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.mainPicture, mainPicture) || other.mainPicture == mainPicture)&&(identical(other.alternativeTitles, alternativeTitles) || other.alternativeTitles == alternativeTitles)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.synopsis, synopsis) || other.synopsis == synopsis)&&(identical(other.mean, mean) || other.mean == mean)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.numListUsers, numListUsers) || other.numListUsers == numListUsers)&&(identical(other.numScoringUsers, numScoringUsers) || other.numScoringUsers == numScoringUsers)&&(identical(other.nsfw, nsfw) || other.nsfw == nsfw)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.status, status) || other.status == status)&&(identical(other.myListStatus, myListStatus) || other.myListStatus == myListStatus)&&const DeepCollectionEquality().equals(other.genres, genres)&&(identical(other.numEpisodes, numEpisodes) || other.numEpisodes == numEpisodes)&&(identical(other.startSeason, startSeason) || other.startSeason == startSeason)&&(identical(other.broadcast, broadcast) || other.broadcast == broadcast)&&(identical(other.source, source) || other.source == source)&&(identical(other.averageEpisodeDuration, averageEpisodeDuration) || other.averageEpisodeDuration == averageEpisodeDuration)&&(identical(other.rating, rating) || other.rating == rating)&&const DeepCollectionEquality().equals(other.pictures, pictures)&&(identical(other.background, background) || other.background == background)&&const DeepCollectionEquality().equals(other.relatedAnime, relatedAnime)&&const DeepCollectionEquality().equals(other.recommendations, recommendations)&&const DeepCollectionEquality().equals(other.studios, studios)&&(identical(other.statistics, statistics) || other.statistics == statistics)&&const DeepCollectionEquality().equals(other.openingThemes, openingThemes)&&const DeepCollectionEquality().equals(other.endingThemes, endingThemes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,mainPicture,alternativeTitles,startDate,synopsis,mean,rank,popularity,numListUsers,numScoringUsers,nsfw,createdAt,updatedAt,mediaType,status,myListStatus,const DeepCollectionEquality().hash(genres),numEpisodes,startSeason,broadcast,source,averageEpisodeDuration,rating,const DeepCollectionEquality().hash(pictures),background,const DeepCollectionEquality().hash(relatedAnime),const DeepCollectionEquality().hash(recommendations),const DeepCollectionEquality().hash(studios),statistics,const DeepCollectionEquality().hash(openingThemes),const DeepCollectionEquality().hash(endingThemes)]);

@override
String toString() {
  return 'AnimeDetails(id: $id, title: $title, mainPicture: $mainPicture, alternativeTitles: $alternativeTitles, startDate: $startDate, synopsis: $synopsis, mean: $mean, rank: $rank, popularity: $popularity, numListUsers: $numListUsers, numScoringUsers: $numScoringUsers, nsfw: $nsfw, createdAt: $createdAt, updatedAt: $updatedAt, mediaType: $mediaType, status: $status, myListStatus: $myListStatus, genres: $genres, numEpisodes: $numEpisodes, startSeason: $startSeason, broadcast: $broadcast, source: $source, averageEpisodeDuration: $averageEpisodeDuration, rating: $rating, pictures: $pictures, background: $background, relatedAnime: $relatedAnime, recommendations: $recommendations, studios: $studios, statistics: $statistics, openingThemes: $openingThemes, endingThemes: $endingThemes)';
}


}

/// @nodoc
abstract mixin class $AnimeDetailsCopyWith<$Res>  {
  factory $AnimeDetailsCopyWith(AnimeDetails value, $Res Function(AnimeDetails) _then) = _$AnimeDetailsCopyWithImpl;
@useResult
$Res call({
 int? id, String? title, Picture? mainPicture, AlternativeTitles? alternativeTitles, String? startDate, String? synopsis, double? mean, int? rank, int? popularity, int? numListUsers, int? numScoringUsers, String? nsfw, String? createdAt, String? updatedAt, String? mediaType, String? status, MyListStatus? myListStatus, List<Genres>? genres, int? numEpisodes, Season? startSeason, Broadcast? broadcast, String? source, int? averageEpisodeDuration, String? rating, List<Picture>? pictures, String? background, List<RelatedAnime>? relatedAnime, List<Recommendations>? recommendations, List<Studios>? studios, Statistics? statistics, List<Themes>? openingThemes, List<Themes>? endingThemes
});


$PictureCopyWith<$Res>? get mainPicture;$AlternativeTitlesCopyWith<$Res>? get alternativeTitles;$MyListStatusCopyWith<$Res>? get myListStatus;$SeasonCopyWith<$Res>? get startSeason;$BroadcastCopyWith<$Res>? get broadcast;$StatisticsCopyWith<$Res>? get statistics;

}
/// @nodoc
class _$AnimeDetailsCopyWithImpl<$Res>
    implements $AnimeDetailsCopyWith<$Res> {
  _$AnimeDetailsCopyWithImpl(this._self, this._then);

  final AnimeDetails _self;
  final $Res Function(AnimeDetails) _then;

/// Create a copy of AnimeDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,Object? mainPicture = freezed,Object? alternativeTitles = freezed,Object? startDate = freezed,Object? synopsis = freezed,Object? mean = freezed,Object? rank = freezed,Object? popularity = freezed,Object? numListUsers = freezed,Object? numScoringUsers = freezed,Object? nsfw = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? mediaType = freezed,Object? status = freezed,Object? myListStatus = freezed,Object? genres = freezed,Object? numEpisodes = freezed,Object? startSeason = freezed,Object? broadcast = freezed,Object? source = freezed,Object? averageEpisodeDuration = freezed,Object? rating = freezed,Object? pictures = freezed,Object? background = freezed,Object? relatedAnime = freezed,Object? recommendations = freezed,Object? studios = freezed,Object? statistics = freezed,Object? openingThemes = freezed,Object? endingThemes = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,mainPicture: freezed == mainPicture ? _self.mainPicture : mainPicture // ignore: cast_nullable_to_non_nullable
as Picture?,alternativeTitles: freezed == alternativeTitles ? _self.alternativeTitles : alternativeTitles // ignore: cast_nullable_to_non_nullable
as AlternativeTitles?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
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
as String?,myListStatus: freezed == myListStatus ? _self.myListStatus : myListStatus // ignore: cast_nullable_to_non_nullable
as MyListStatus?,genres: freezed == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<Genres>?,numEpisodes: freezed == numEpisodes ? _self.numEpisodes : numEpisodes // ignore: cast_nullable_to_non_nullable
as int?,startSeason: freezed == startSeason ? _self.startSeason : startSeason // ignore: cast_nullable_to_non_nullable
as Season?,broadcast: freezed == broadcast ? _self.broadcast : broadcast // ignore: cast_nullable_to_non_nullable
as Broadcast?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,averageEpisodeDuration: freezed == averageEpisodeDuration ? _self.averageEpisodeDuration : averageEpisodeDuration // ignore: cast_nullable_to_non_nullable
as int?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as String?,pictures: freezed == pictures ? _self.pictures : pictures // ignore: cast_nullable_to_non_nullable
as List<Picture>?,background: freezed == background ? _self.background : background // ignore: cast_nullable_to_non_nullable
as String?,relatedAnime: freezed == relatedAnime ? _self.relatedAnime : relatedAnime // ignore: cast_nullable_to_non_nullable
as List<RelatedAnime>?,recommendations: freezed == recommendations ? _self.recommendations : recommendations // ignore: cast_nullable_to_non_nullable
as List<Recommendations>?,studios: freezed == studios ? _self.studios : studios // ignore: cast_nullable_to_non_nullable
as List<Studios>?,statistics: freezed == statistics ? _self.statistics : statistics // ignore: cast_nullable_to_non_nullable
as Statistics?,openingThemes: freezed == openingThemes ? _self.openingThemes : openingThemes // ignore: cast_nullable_to_non_nullable
as List<Themes>?,endingThemes: freezed == endingThemes ? _self.endingThemes : endingThemes // ignore: cast_nullable_to_non_nullable
as List<Themes>?,
  ));
}
/// Create a copy of AnimeDetails
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
}/// Create a copy of AnimeDetails
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
}/// Create a copy of AnimeDetails
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
}/// Create a copy of AnimeDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeasonCopyWith<$Res>? get startSeason {
    if (_self.startSeason == null) {
    return null;
  }

  return $SeasonCopyWith<$Res>(_self.startSeason!, (value) {
    return _then(_self.copyWith(startSeason: value));
  });
}/// Create a copy of AnimeDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BroadcastCopyWith<$Res>? get broadcast {
    if (_self.broadcast == null) {
    return null;
  }

  return $BroadcastCopyWith<$Res>(_self.broadcast!, (value) {
    return _then(_self.copyWith(broadcast: value));
  });
}/// Create a copy of AnimeDetails
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


/// Adds pattern-matching-related methods to [AnimeDetails].
extension AnimeDetailsPatterns on AnimeDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnimeDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnimeDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnimeDetails value)  $default,){
final _that = this;
switch (_that) {
case _AnimeDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnimeDetails value)?  $default,){
final _that = this;
switch (_that) {
case _AnimeDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? title,  Picture? mainPicture,  AlternativeTitles? alternativeTitles,  String? startDate,  String? synopsis,  double? mean,  int? rank,  int? popularity,  int? numListUsers,  int? numScoringUsers,  String? nsfw,  String? createdAt,  String? updatedAt,  String? mediaType,  String? status,  MyListStatus? myListStatus,  List<Genres>? genres,  int? numEpisodes,  Season? startSeason,  Broadcast? broadcast,  String? source,  int? averageEpisodeDuration,  String? rating,  List<Picture>? pictures,  String? background,  List<RelatedAnime>? relatedAnime,  List<Recommendations>? recommendations,  List<Studios>? studios,  Statistics? statistics,  List<Themes>? openingThemes,  List<Themes>? endingThemes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnimeDetails() when $default != null:
return $default(_that.id,_that.title,_that.mainPicture,_that.alternativeTitles,_that.startDate,_that.synopsis,_that.mean,_that.rank,_that.popularity,_that.numListUsers,_that.numScoringUsers,_that.nsfw,_that.createdAt,_that.updatedAt,_that.mediaType,_that.status,_that.myListStatus,_that.genres,_that.numEpisodes,_that.startSeason,_that.broadcast,_that.source,_that.averageEpisodeDuration,_that.rating,_that.pictures,_that.background,_that.relatedAnime,_that.recommendations,_that.studios,_that.statistics,_that.openingThemes,_that.endingThemes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? title,  Picture? mainPicture,  AlternativeTitles? alternativeTitles,  String? startDate,  String? synopsis,  double? mean,  int? rank,  int? popularity,  int? numListUsers,  int? numScoringUsers,  String? nsfw,  String? createdAt,  String? updatedAt,  String? mediaType,  String? status,  MyListStatus? myListStatus,  List<Genres>? genres,  int? numEpisodes,  Season? startSeason,  Broadcast? broadcast,  String? source,  int? averageEpisodeDuration,  String? rating,  List<Picture>? pictures,  String? background,  List<RelatedAnime>? relatedAnime,  List<Recommendations>? recommendations,  List<Studios>? studios,  Statistics? statistics,  List<Themes>? openingThemes,  List<Themes>? endingThemes)  $default,) {final _that = this;
switch (_that) {
case _AnimeDetails():
return $default(_that.id,_that.title,_that.mainPicture,_that.alternativeTitles,_that.startDate,_that.synopsis,_that.mean,_that.rank,_that.popularity,_that.numListUsers,_that.numScoringUsers,_that.nsfw,_that.createdAt,_that.updatedAt,_that.mediaType,_that.status,_that.myListStatus,_that.genres,_that.numEpisodes,_that.startSeason,_that.broadcast,_that.source,_that.averageEpisodeDuration,_that.rating,_that.pictures,_that.background,_that.relatedAnime,_that.recommendations,_that.studios,_that.statistics,_that.openingThemes,_that.endingThemes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? title,  Picture? mainPicture,  AlternativeTitles? alternativeTitles,  String? startDate,  String? synopsis,  double? mean,  int? rank,  int? popularity,  int? numListUsers,  int? numScoringUsers,  String? nsfw,  String? createdAt,  String? updatedAt,  String? mediaType,  String? status,  MyListStatus? myListStatus,  List<Genres>? genres,  int? numEpisodes,  Season? startSeason,  Broadcast? broadcast,  String? source,  int? averageEpisodeDuration,  String? rating,  List<Picture>? pictures,  String? background,  List<RelatedAnime>? relatedAnime,  List<Recommendations>? recommendations,  List<Studios>? studios,  Statistics? statistics,  List<Themes>? openingThemes,  List<Themes>? endingThemes)?  $default,) {final _that = this;
switch (_that) {
case _AnimeDetails() when $default != null:
return $default(_that.id,_that.title,_that.mainPicture,_that.alternativeTitles,_that.startDate,_that.synopsis,_that.mean,_that.rank,_that.popularity,_that.numListUsers,_that.numScoringUsers,_that.nsfw,_that.createdAt,_that.updatedAt,_that.mediaType,_that.status,_that.myListStatus,_that.genres,_that.numEpisodes,_that.startSeason,_that.broadcast,_that.source,_that.averageEpisodeDuration,_that.rating,_that.pictures,_that.background,_that.relatedAnime,_that.recommendations,_that.studios,_that.statistics,_that.openingThemes,_that.endingThemes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnimeDetails implements AnimeDetails {
  const _AnimeDetails({this.id, this.title, this.mainPicture, this.alternativeTitles, this.startDate, this.synopsis, this.mean, this.rank, this.popularity, this.numListUsers, this.numScoringUsers, this.nsfw, this.createdAt, this.updatedAt, this.mediaType, this.status, this.myListStatus, final  List<Genres>? genres, this.numEpisodes, this.startSeason, this.broadcast, this.source, this.averageEpisodeDuration, this.rating, final  List<Picture>? pictures, this.background, final  List<RelatedAnime>? relatedAnime, final  List<Recommendations>? recommendations, final  List<Studios>? studios, this.statistics, final  List<Themes>? openingThemes, final  List<Themes>? endingThemes}): _genres = genres,_pictures = pictures,_relatedAnime = relatedAnime,_recommendations = recommendations,_studios = studios,_openingThemes = openingThemes,_endingThemes = endingThemes;
  factory _AnimeDetails.fromJson(Map<String, dynamic> json) => _$AnimeDetailsFromJson(json);

@override final  int? id;
@override final  String? title;
@override final  Picture? mainPicture;
@override final  AlternativeTitles? alternativeTitles;
@override final  String? startDate;
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
@override final  MyListStatus? myListStatus;
 final  List<Genres>? _genres;
@override List<Genres>? get genres {
  final value = _genres;
  if (value == null) return null;
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? numEpisodes;
@override final  Season? startSeason;
@override final  Broadcast? broadcast;
@override final  String? source;
@override final  int? averageEpisodeDuration;
@override final  String? rating;
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

 final  List<Recommendations>? _recommendations;
@override List<Recommendations>? get recommendations {
  final value = _recommendations;
  if (value == null) return null;
  if (_recommendations is EqualUnmodifiableListView) return _recommendations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Studios>? _studios;
@override List<Studios>? get studios {
  final value = _studios;
  if (value == null) return null;
  if (_studios is EqualUnmodifiableListView) return _studios;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  Statistics? statistics;
 final  List<Themes>? _openingThemes;
@override List<Themes>? get openingThemes {
  final value = _openingThemes;
  if (value == null) return null;
  if (_openingThemes is EqualUnmodifiableListView) return _openingThemes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Themes>? _endingThemes;
@override List<Themes>? get endingThemes {
  final value = _endingThemes;
  if (value == null) return null;
  if (_endingThemes is EqualUnmodifiableListView) return _endingThemes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of AnimeDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnimeDetailsCopyWith<_AnimeDetails> get copyWith => __$AnimeDetailsCopyWithImpl<_AnimeDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnimeDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnimeDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.mainPicture, mainPicture) || other.mainPicture == mainPicture)&&(identical(other.alternativeTitles, alternativeTitles) || other.alternativeTitles == alternativeTitles)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.synopsis, synopsis) || other.synopsis == synopsis)&&(identical(other.mean, mean) || other.mean == mean)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.numListUsers, numListUsers) || other.numListUsers == numListUsers)&&(identical(other.numScoringUsers, numScoringUsers) || other.numScoringUsers == numScoringUsers)&&(identical(other.nsfw, nsfw) || other.nsfw == nsfw)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.status, status) || other.status == status)&&(identical(other.myListStatus, myListStatus) || other.myListStatus == myListStatus)&&const DeepCollectionEquality().equals(other._genres, _genres)&&(identical(other.numEpisodes, numEpisodes) || other.numEpisodes == numEpisodes)&&(identical(other.startSeason, startSeason) || other.startSeason == startSeason)&&(identical(other.broadcast, broadcast) || other.broadcast == broadcast)&&(identical(other.source, source) || other.source == source)&&(identical(other.averageEpisodeDuration, averageEpisodeDuration) || other.averageEpisodeDuration == averageEpisodeDuration)&&(identical(other.rating, rating) || other.rating == rating)&&const DeepCollectionEquality().equals(other._pictures, _pictures)&&(identical(other.background, background) || other.background == background)&&const DeepCollectionEquality().equals(other._relatedAnime, _relatedAnime)&&const DeepCollectionEquality().equals(other._recommendations, _recommendations)&&const DeepCollectionEquality().equals(other._studios, _studios)&&(identical(other.statistics, statistics) || other.statistics == statistics)&&const DeepCollectionEquality().equals(other._openingThemes, _openingThemes)&&const DeepCollectionEquality().equals(other._endingThemes, _endingThemes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,mainPicture,alternativeTitles,startDate,synopsis,mean,rank,popularity,numListUsers,numScoringUsers,nsfw,createdAt,updatedAt,mediaType,status,myListStatus,const DeepCollectionEquality().hash(_genres),numEpisodes,startSeason,broadcast,source,averageEpisodeDuration,rating,const DeepCollectionEquality().hash(_pictures),background,const DeepCollectionEquality().hash(_relatedAnime),const DeepCollectionEquality().hash(_recommendations),const DeepCollectionEquality().hash(_studios),statistics,const DeepCollectionEquality().hash(_openingThemes),const DeepCollectionEquality().hash(_endingThemes)]);

@override
String toString() {
  return 'AnimeDetails(id: $id, title: $title, mainPicture: $mainPicture, alternativeTitles: $alternativeTitles, startDate: $startDate, synopsis: $synopsis, mean: $mean, rank: $rank, popularity: $popularity, numListUsers: $numListUsers, numScoringUsers: $numScoringUsers, nsfw: $nsfw, createdAt: $createdAt, updatedAt: $updatedAt, mediaType: $mediaType, status: $status, myListStatus: $myListStatus, genres: $genres, numEpisodes: $numEpisodes, startSeason: $startSeason, broadcast: $broadcast, source: $source, averageEpisodeDuration: $averageEpisodeDuration, rating: $rating, pictures: $pictures, background: $background, relatedAnime: $relatedAnime, recommendations: $recommendations, studios: $studios, statistics: $statistics, openingThemes: $openingThemes, endingThemes: $endingThemes)';
}


}

/// @nodoc
abstract mixin class _$AnimeDetailsCopyWith<$Res> implements $AnimeDetailsCopyWith<$Res> {
  factory _$AnimeDetailsCopyWith(_AnimeDetails value, $Res Function(_AnimeDetails) _then) = __$AnimeDetailsCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? title, Picture? mainPicture, AlternativeTitles? alternativeTitles, String? startDate, String? synopsis, double? mean, int? rank, int? popularity, int? numListUsers, int? numScoringUsers, String? nsfw, String? createdAt, String? updatedAt, String? mediaType, String? status, MyListStatus? myListStatus, List<Genres>? genres, int? numEpisodes, Season? startSeason, Broadcast? broadcast, String? source, int? averageEpisodeDuration, String? rating, List<Picture>? pictures, String? background, List<RelatedAnime>? relatedAnime, List<Recommendations>? recommendations, List<Studios>? studios, Statistics? statistics, List<Themes>? openingThemes, List<Themes>? endingThemes
});


@override $PictureCopyWith<$Res>? get mainPicture;@override $AlternativeTitlesCopyWith<$Res>? get alternativeTitles;@override $MyListStatusCopyWith<$Res>? get myListStatus;@override $SeasonCopyWith<$Res>? get startSeason;@override $BroadcastCopyWith<$Res>? get broadcast;@override $StatisticsCopyWith<$Res>? get statistics;

}
/// @nodoc
class __$AnimeDetailsCopyWithImpl<$Res>
    implements _$AnimeDetailsCopyWith<$Res> {
  __$AnimeDetailsCopyWithImpl(this._self, this._then);

  final _AnimeDetails _self;
  final $Res Function(_AnimeDetails) _then;

/// Create a copy of AnimeDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,Object? mainPicture = freezed,Object? alternativeTitles = freezed,Object? startDate = freezed,Object? synopsis = freezed,Object? mean = freezed,Object? rank = freezed,Object? popularity = freezed,Object? numListUsers = freezed,Object? numScoringUsers = freezed,Object? nsfw = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? mediaType = freezed,Object? status = freezed,Object? myListStatus = freezed,Object? genres = freezed,Object? numEpisodes = freezed,Object? startSeason = freezed,Object? broadcast = freezed,Object? source = freezed,Object? averageEpisodeDuration = freezed,Object? rating = freezed,Object? pictures = freezed,Object? background = freezed,Object? relatedAnime = freezed,Object? recommendations = freezed,Object? studios = freezed,Object? statistics = freezed,Object? openingThemes = freezed,Object? endingThemes = freezed,}) {
  return _then(_AnimeDetails(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,mainPicture: freezed == mainPicture ? _self.mainPicture : mainPicture // ignore: cast_nullable_to_non_nullable
as Picture?,alternativeTitles: freezed == alternativeTitles ? _self.alternativeTitles : alternativeTitles // ignore: cast_nullable_to_non_nullable
as AlternativeTitles?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
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
as String?,myListStatus: freezed == myListStatus ? _self.myListStatus : myListStatus // ignore: cast_nullable_to_non_nullable
as MyListStatus?,genres: freezed == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<Genres>?,numEpisodes: freezed == numEpisodes ? _self.numEpisodes : numEpisodes // ignore: cast_nullable_to_non_nullable
as int?,startSeason: freezed == startSeason ? _self.startSeason : startSeason // ignore: cast_nullable_to_non_nullable
as Season?,broadcast: freezed == broadcast ? _self.broadcast : broadcast // ignore: cast_nullable_to_non_nullable
as Broadcast?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,averageEpisodeDuration: freezed == averageEpisodeDuration ? _self.averageEpisodeDuration : averageEpisodeDuration // ignore: cast_nullable_to_non_nullable
as int?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as String?,pictures: freezed == pictures ? _self._pictures : pictures // ignore: cast_nullable_to_non_nullable
as List<Picture>?,background: freezed == background ? _self.background : background // ignore: cast_nullable_to_non_nullable
as String?,relatedAnime: freezed == relatedAnime ? _self._relatedAnime : relatedAnime // ignore: cast_nullable_to_non_nullable
as List<RelatedAnime>?,recommendations: freezed == recommendations ? _self._recommendations : recommendations // ignore: cast_nullable_to_non_nullable
as List<Recommendations>?,studios: freezed == studios ? _self._studios : studios // ignore: cast_nullable_to_non_nullable
as List<Studios>?,statistics: freezed == statistics ? _self.statistics : statistics // ignore: cast_nullable_to_non_nullable
as Statistics?,openingThemes: freezed == openingThemes ? _self._openingThemes : openingThemes // ignore: cast_nullable_to_non_nullable
as List<Themes>?,endingThemes: freezed == endingThemes ? _self._endingThemes : endingThemes // ignore: cast_nullable_to_non_nullable
as List<Themes>?,
  ));
}

/// Create a copy of AnimeDetails
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
}/// Create a copy of AnimeDetails
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
}/// Create a copy of AnimeDetails
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
}/// Create a copy of AnimeDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeasonCopyWith<$Res>? get startSeason {
    if (_self.startSeason == null) {
    return null;
  }

  return $SeasonCopyWith<$Res>(_self.startSeason!, (value) {
    return _then(_self.copyWith(startSeason: value));
  });
}/// Create a copy of AnimeDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BroadcastCopyWith<$Res>? get broadcast {
    if (_self.broadcast == null) {
    return null;
  }

  return $BroadcastCopyWith<$Res>(_self.broadcast!, (value) {
    return _then(_self.copyWith(broadcast: value));
  });
}/// Create a copy of AnimeDetails
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
