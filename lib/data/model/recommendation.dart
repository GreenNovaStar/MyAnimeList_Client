import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:android_app/data/model/node.dart';

part 'recommendation.freezed.dart';
part 'recommendation.g.dart';

@freezed
abstract class Recommendations with _$Recommendations {
  const factory Recommendations({Node? node, int? numRecommendations}) =
      _Recommendations;

  factory Recommendations.fromJson(Map<String, dynamic> json) =>
      _$RecommendationsFromJson(json);
}
