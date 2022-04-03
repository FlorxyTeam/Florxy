import 'package:json_annotation/json_annotation.dart';

part 'profileModel.g.dart';

@JsonSerializable()
class ProfileModel {
  String? id;
  String username;
  String fullname;
  String DOB;
  String professor;
  String influencer;
  String bio;
  String img;
  String pinned;
  List listfollower;
  List listfollowing;
  List favorite;
  List notification;
  List saveproduct;

  ProfileModel({
    this.id,
    required this.username,
    required this.fullname,
    required this.DOB,
    required this.professor,
    required this.influencer,
    required this.bio,
    required this.img,
    required this.pinned,
    required this.listfollower,
    required this.listfollowing,
    required this.favorite,
    required this.notification,
    required this.saveproduct,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
