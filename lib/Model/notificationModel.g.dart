// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notificationModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) {
  return NotificationModel(
    username: json['username'] as String,
    otherusername: json['otherusername'] as String,
    type: json['type'] as String,
    body: json['body'] as String,
    createdAt: json['createdAt'] as String,
  );
}

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'otherusername': instance.otherusername,
      'type': instance.type,
      'body': instance.body,
      'createdAt': instance.createdAt,
    };
