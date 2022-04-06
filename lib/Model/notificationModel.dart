import 'package:json_annotation/json_annotation.dart';

part 'notificationModel.g.dart';

@JsonSerializable()
class NotificationModel {
  String username;
  String otherusername;
  String type;
  String body;
  String createdAt;


  NotificationModel({
    required this.username,
    required this.otherusername,
    required this.type,
    required this.body,
    required this.createdAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}