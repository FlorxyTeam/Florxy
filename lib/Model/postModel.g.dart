// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
  post: json['post'] as String,
  comment: json['comment'] as int,
  favorite: json['favorite'] as int,
);

Map<String, dynamic> _$PostModelToJson(PostModel instance) =>
    <String, dynamic>{
      'post': instance.post,
      'comment': instance.comment,
      'favorite': instance.favorite,
    };