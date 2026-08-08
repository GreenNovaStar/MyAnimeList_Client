import 'package:freezed_annotation/freezed_annotation.dart';

part 'paging.freezed.dart';
part 'paging.g.dart';

@freezed
abstract class Paging with _$Paging {
  const factory Paging({String? next, String? previous}) = _Paging;

  factory Paging.fromJson(Map<String, dynamic> json) => _$PagingFromJson(json);
}
