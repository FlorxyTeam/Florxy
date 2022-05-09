import 'package:json_annotation/json_annotation.dart';
part 'postModel.g.dart';

@JsonSerializable()
class PostModel {
  String? username;
  String? fullname;
  String? professor;
  String? influencer;
  String? refproduct;
  String? refbrand;
  String? type;
  String? body;
  double? rating;
  int? comment;
  int? favorite;
  String? forwho;
  DateTime? createdAt;
  DateTime? updatedAt;
  List? coverImage;
  PostModel({this.body,
             this.comment,
             this.favorite,
             this.rating,
             this.fullname,
             this.username,
             this.influencer,
             this.professor,
             this.coverImage,
             this.refbrand,
             this.refproduct,
             this.type,
             this.forwho,
             this.createdAt,
             this.updatedAt});

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}