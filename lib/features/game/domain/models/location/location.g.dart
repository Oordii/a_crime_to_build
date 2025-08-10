// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Location _$LocationFromJson(Map<String, dynamic> json) => _Location(
  id: json['id'] as String,
  scenarioId: json['scenario_id'] as String,
  name: json['name'] as String,
  desc: json['desc'] as String?,
  backgroundUrl: json['background_url'] as String?,
  isInitial: json['is_initial'] as bool,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$LocationToJson(_Location instance) => <String, dynamic>{
  'id': instance.id,
  'scenario_id': instance.scenarioId,
  'name': instance.name,
  'desc': instance.desc,
  'background_url': instance.backgroundUrl,
  'is_initial': instance.isInitial,
  'created_at': instance.createdAt.toIso8601String(),
};
