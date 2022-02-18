// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addPostModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddPostModel _$AddPostModelFromJson(Map<String, dynamic> json) => AddPostModel(
      id: json['id'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      fullname: json['fullname'] as String,
      professor: json['professor'] as String,
      influencer: json['influencer'] as String,
      img: json['img'] as String,
      coverImage: json['coverImage'] as String,
      body: json['body'] as String,
      title: json['title'] as String,
      refproduct: json['refproduct'] as String,
      updatedAt: json['updatedAt'] as String,
      comment: json['comment'] as int,
      share: json['share'] as int,
      favorite: json['favorite'] as int,
      reviewrating: json['reviewrating'] as int,
    );

Map<String, dynamic> _$AddPostModelToJson(AddPostModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'fullname': instance.fullname,
      'professor': instance.professor,
      'influencer': instance.influencer,
      'img': instance.img,
      'coverImage': instance.coverImage,
      'body': instance.body,
      'title': instance.title,
      'refproduct': instance.refproduct,
      'updatedAt': instance.updatedAt,
      'comment': instance.comment,
      'share': instance.share,
      'favorite': instance.favorite,
      'reviewrating': instance.reviewrating,
    };
