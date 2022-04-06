// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profileModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return ProfileModel(
    id: json['_id'] as String?,
    username: json['username'] as String,
    fullname: json['fullname'] as String,
    DOB: json['DOB'] as String,
    professor: json['professor'] as String,
    influencer: json['influencer'] as String,
    bio: json['bio'] as String,
    img: json['img'] as String,
    pinned: json['pinned'] as String,
    listfollower: json['listfollower'] as List<dynamic>,
    listfollowing: json['listfollowing'] as List<dynamic>,
    favorite: json['favorite'] as List<dynamic>,
    notification: json['notification'] as List<dynamic>,
    saveproduct: json['saveproduct'] as List<dynamic>,
  );
}

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'fullname': instance.fullname,
      'DOB': instance.DOB,
      'professor': instance.professor,
      'influencer': instance.influencer,
      'bio': instance.bio,
      'img': instance.img,
      'pinned': instance.pinned,
      'listfollower': instance.listfollower,
      'listfollowing': instance.listfollowing,
      'favorite': instance.favorite,
      'notification': instance.notification,
      'saveproduct': instance.saveproduct,
    };
