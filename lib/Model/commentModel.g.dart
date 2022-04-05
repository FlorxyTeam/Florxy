// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commentModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) {
  return CommentModel(
    body: json['body'] as String,
    vote: json['vote'] as List,
    username: json['username'] as String,
    mainpost: json['mainpost'] as String,
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String
  );
}

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'mainpost': instance.mainpost,
      'body': instance.body,
      'vote': instance.vote,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
