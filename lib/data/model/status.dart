import 'package:freezed_annotation/freezed_annotation.dart';

part 'status.freezed.dart';
part 'status.g.dart';

/// Community distribution: how many users have this anime in each list state.
/// MAL returns these as stringified integers — parse with int.parse() when needed.
@freezed
abstract class StatusDistribution with _$StatusDistribution {
  const factory StatusDistribution({
    String? watching,
    String? completed,
    String? onHold,
    String? dropped,
    String? planToWatch,
  }) = _StatusDistribution;

  factory StatusDistribution.fromJson(Map<String, dynamic> json) =>
      _$StatusDistributionFromJson(json);
}
