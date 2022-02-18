import 'package:json_annotation/json_annotation.dart';

part 'addPostModel.g.dart';

@JsonSerializable()
class AddPostModel {
  String id;
  String email;
  String username;
  String fullname;
  String professor;
  String influencer;
  String img;
  String coverImage;
  String body;
  String title;
  String refproduct;
  String updatedAt;
  int comment;
  int share;
  int favorite;
  int reviewrating;



  AddPostModel({
    required this.id,
    required this.email,
    required this.username,
    required this.fullname,
    required this.professor,
    required this.influencer,
    required this.img,
    required this.coverImage,
    required this.body,
    required this.title,
    required this.refproduct,
    required this.updatedAt,
    required this.comment,
    required this.share,
    required this.favorite,
    required this.reviewrating
  });

  factory AddPostModel.fromJson(Map<String, dynamic> json) =>
      _$AddPostModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddPostModelToJson(this);
}
