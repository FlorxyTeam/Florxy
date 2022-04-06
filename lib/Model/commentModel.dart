import 'package:json_annotation/json_annotation.dart';
part 'commentModel.g.dart';

@JsonSerializable()
class CommentModel {
  String? username;
  String? mainpost;
  String? body;
  List? vote;
  String? createdAt;
  String? updatedAt;
  CommentModel({
    this.body,
    this.vote,
    this.username,
    this.mainpost,
    this.createdAt,
    this.updatedAt});

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentModelToJson(this);
}