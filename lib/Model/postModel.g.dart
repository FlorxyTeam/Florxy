// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) {
  return PostModel(
      pinnedcomment: json['pinnedcomment'] as String,
      username: json['username'] as String,
      comment: json['comment'] as List,
      favorite: json['favorite'] as List,
      product: json['product'] as List,
      archive: json['archive'] as bool,
      coverImage: json['coverImage'] as List,
      type: json['type'] as String,
      rating: json['rating'] as double,
      body: json['body'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String
  );
}

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'username': instance.username,
      'coverImage': instance.coverImage,
      'type': instance.type,
      'rating': instance.rating,
      'body': instance.body,
      'comment': instance.comment,
      'favorite': instance.favorite,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'pinnedcomment': instance.pinnedcomment,
      'product': instance.product,
      'archive': instance.archive
    };
