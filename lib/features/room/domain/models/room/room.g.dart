// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Room _$RoomFromJson(Map<String, dynamic> json) => _Room(
  id: json['id'] as String,
  code: json['code'] as String,
  users:
      (json['users'] as List<dynamic>?)
          ?.map((e) => RoomUser.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  creator: RoomUser.fromJson(json['creator'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RoomToJson(_Room instance) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'users': instance.users,
  'creator': instance.creator,
};
