// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'scenario.freezed.dart';
part 'scenario.g.dart';

@freezed
abstract class ScenarioModel with _$ScenarioModel {
  const factory ScenarioModel({
    required String id,
    required String name,
    @JsonKey(name: 'short_desc') required String shortDesc,
    @JsonKey(name: 'full_desc') required String fullDesc,
    @JsonKey(name: 'cover_url') required String coverUrl,
  }) = _ScenarioModel;

  factory ScenarioModel.fromJson(Map<String, dynamic> json) =>
      _$ScenarioModelFromJson(json);
}
