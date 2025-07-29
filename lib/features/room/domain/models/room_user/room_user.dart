import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_user.freezed.dart';
part 'room_user.g.dart';

@freezed
abstract class RoomUser with _$RoomUser {
  const factory RoomUser({required String id, required String username}) =
      _RoomUser;

  factory RoomUser.fromJson(Map<String, dynamic> json) =>
      _$RoomUserFromJson(json);
}
