import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:android_app/data/model/status.dart';

part 'statistics.freezed.dart';
part 'statistics.g.dart';

/// Per-anime community statistics returned by `GET /anime/{id}`.
@freezed
abstract class Statistics with _$Statistics {
  const factory Statistics({StatusDistribution? status, int? numListUsers}) =
      _Statistics;

  factory Statistics.fromJson(Map<String, dynamic> json) =>
      _$StatisticsFromJson(json);
}
