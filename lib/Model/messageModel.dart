// import 'package:json_annotation/json_annotation.dart';
// part 'messageModel.g.dart';
//
// @JsonSerializable()
class MessageModel {
  String? type;
  String? message;
  String? time;
  MessageModel({ this.message, this.type, this.time });
  //
  //
  // factory MessageModel.fromJson(Map<String, dynamic> json) =>
  //     _$MessageModelFromJson(json);
  //
  // Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}