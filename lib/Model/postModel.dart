import 'package:json_annotation/json_annotation.dart';
part 'postModel.g.dart';

@JsonSerializable()
class PostModel {
  String post;
  int comment;
  int favorite;
  PostModel({required this.post, required this.comment, required this.favorite});

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}