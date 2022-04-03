// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profileModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return ProfileModel(
    id: json['id'] as String?,
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
    listfollower: json['listfollower'] as List<dynamic>,
    listfollowing: json['listfollowing'] as List<dynamic>,
    favorite: json['favorite'] as List<dynamic>,
  );
}

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
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
      'listfollower': instance.listfollower,
      'listfollowing': instance.listfollowing,
      'favorite': instance.favorite,
    };
