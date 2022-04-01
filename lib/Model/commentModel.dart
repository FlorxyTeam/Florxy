import 'package:json_annotation/json_annotation.dart';
part 'commentModel.g.dart';

@JsonSerializable()
class CommentModel {
  String? owner;
  String? mainpost;
  String? body;
  int? comment;
  int? favorite;
  DateTime? createdAt;
  DateTime? updatedAt;
  CommentModel({this.body,
    this.comment,
    this.favorite,
    this.owner,
    this.mainpost,
    this.createdAt,
    this.updatedAt});

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentModelToJson(this);
}