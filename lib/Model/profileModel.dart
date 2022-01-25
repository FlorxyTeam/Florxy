import 'package:json_annotation/json_annotation.dart';

part 'profileModel.g.dart';

@JsonSerializable()
class ProfileModel {
  String email;
  String username;
  String fullname;
  String DOB;
  String professor;
  String influencer;
  String bio;
  String img;

  ProfileModel({
    required this.email,
    required this.username,
    required this.fullname,
    required this.DOB,
    required this.professor,
    required this.influencer,
    required this.bio,
    required this.img
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
