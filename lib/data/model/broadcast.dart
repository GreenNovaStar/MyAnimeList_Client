import 'package:freezed_annotation/freezed_annotation.dart';

part 'broadcast.freezed.dart';
part 'broadcast.g.dart';

@freezed
abstract class Broadcast with _$Broadcast {
  const factory Broadcast({String? dayOfTheWeek, String? startTime}) =
      _Broadcast;

  factory Broadcast.fromJson(Map<String, dynamic> json) =>
      _$BroadcastFromJson(json);
}
