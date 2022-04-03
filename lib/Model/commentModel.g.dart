// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commentModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) {
  return CommentModel(
    body: json['body'] as String?,
    comment: json['comment'] as int?,
    favorite: json['favorite'] as int?,
    owner: json['owner'] as String?,
    mainpost: json['mainpost'] as String?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  );
}

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'owner': instance.owner,
      'mainpost': instance.mainpost,
      'body': instance.body,
      'comment': instance.comment,
      'favorite': instance.favorite,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
