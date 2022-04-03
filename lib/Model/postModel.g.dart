// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) {
  return PostModel(
    body: json['body'] as String?,
    comment: json['comment'] as int?,
    favorite: json['favorite'] as int?,
    rating: (json['rating'] as num?)?.toDouble(),
    fullname: json['fullname'] as String?,
    username: json['username'] as String?,
    influencer: json['influencer'] as String?,
    professor: json['professor'] as String?,
    coverImage: json['coverImage'] as List<dynamic>?,
    refbrand: json['refbrand'] as String?,
    refproduct: json['refproduct'] as String?,
    type: json['type'] as String?,
    forwho: json['forwho'] as String?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  );
}

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'username': instance.username,
      'fullname': instance.fullname,
      'professor': instance.professor,
      'influencer': instance.influencer,
      'refproduct': instance.refproduct,
      'refbrand': instance.refbrand,
      'type': instance.type,
      'body': instance.body,
      'rating': instance.rating,
      'comment': instance.comment,
      'favorite': instance.favorite,
      'forwho': instance.forwho,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'coverImage': instance.coverImage,
    };
