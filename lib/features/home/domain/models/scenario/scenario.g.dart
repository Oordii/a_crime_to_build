// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scenario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScenarioModel _$ScenarioModelFromJson(Map<String, dynamic> json) =>
    _ScenarioModel(
      id: json['id'] as String,
      name: json['name'] as String,
      shortDesc: json['short_desc'] as String,
      fullDesc: json['full_desc'] as String,
      coverUrl: json['cover_url'] as String,
    );

Map<String, dynamic> _$ScenarioModelToJson(_ScenarioModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'short_desc': instance.shortDesc,
      'full_desc': instance.fullDesc,
      'cover_url': instance.coverUrl,
    };
