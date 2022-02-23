// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profileModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      email: json['email'] as String,
      username: json['username'] as String,
      fullname: json['fullname'] as String,
      follower: json['follower'] as int,
      following: json['following'] as int,
      DOB: json['DOB'] as String,
      professor: json['professor'] as String,
      influencer: json['influencer'] as String,
      bio: json['bio'] as String,
      img: json['img'] as String,
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'username': instance.username,
      'fullname': instance.fullname,
      'follower': instance.follower,
      'following': instance.following,
      'DOB': instance.DOB,
      'professor': instance.professor,
      'influencer': instance.influencer,
      'bio': instance.bio,
      'img': instance.img,
    };
