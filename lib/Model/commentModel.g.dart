// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commentModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) => CommentModel(
    owner: json['owner'] as String,
    mainpost: json['mainpost'] as String,
    body: json['body'] as String,
    comment: json['comment'] as int,
    favorite: json['favorite'] as int,
    createdAt: json['createdAt'] as DateTime,
    updatedAt: json['updatedAt'] as DateTime
);

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) => <String, dynamic>{
  'owner': instance.owner,
  'mainpost': instance.mainpost,
  'body': instance.body,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'comment': instance.comment,
  'favorite': instance.favorite,
};