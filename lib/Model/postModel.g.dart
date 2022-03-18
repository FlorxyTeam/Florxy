// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      username: json['username'] as String,
      fullname: json['fullname'] as String,
      influencer: json['influence'] as String,
      professor: json['professor'] as String,
      coverImage: json['coverImage'] as List,
      refbrand: json['refbrand'] as String,
      refproduct: json['refproduct'] as String,
      type: json['type'] as String,
      rating: json['rating'] as double,
      forwho: json['forwho'] as String,
      body: json['body'] as String,
      comment: json['comment'] as int,
      favorite: json['favorite'] as int,
      createdAt: json['createdAt'] as DateTime,
      updatedAt: json['updatedAt'] as DateTime
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'username': instance.username,
      'fullname': instance.fullname,
      'influencer': instance.influencer,
      'professor': instance.professor,
      'coverImage': instance.coverImage,
      'refbrand': instance.refbrand,
      'refproduct': instance.refproduct,
      'type': instance.type,
      'rating': instance.rating,
      'forwho': instance.forwho,
      'body': instance.body,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'comment': instance.comment,
      'favorite': instance.favorite,
    };
