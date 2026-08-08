import 'package:freezed_annotation/freezed_annotation.dart';

part 'ranking.freezed.dart';
part 'ranking.g.dart';

@freezed
abstract class Ranking with _$Ranking {
  const factory Ranking({required int rank, int? previousRank}) = _Ranking;

  factory Ranking.fromJson(Map<String, dynamic> json) =>
      _$RankingFromJson(json);
}
