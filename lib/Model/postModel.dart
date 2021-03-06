// import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';
part 'postModel.g.dart';

@JsonSerializable()
class PostModel {
  String? pinnedcomment;
  List? comment;
  List? favorite;
  String? type;
  List? coverImage;
  String? body;
  List? product;
  bool? archive;
  String? username;
  String? rating;
  String? createdAt;
  String? updatedAt;
  String? id;
  PostModel({this.body,
             this.comment,
             this.favorite,
             this.rating,
             this.username,
             this.pinnedcomment,
             this.product,
             this.archive,
             this.coverImage,
             this.type,
             this.createdAt,
             this.updatedAt,
             this.id});

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}