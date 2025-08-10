// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';
part 'location.g.dart';

@freezed
abstract class Location with _$Location {
  const factory Location({
    required String id,
    @JsonKey(name: 'scenario_id') required String scenarioId,
    required String name,
    String? desc,
    @JsonKey(name: 'background_url') String? backgroundUrl,
    @JsonKey(name: 'is_initial') required bool isInitial,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
