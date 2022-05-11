// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) {
  return PostModel(
    body: json['body'] as String?,
    comment: json['comment'] as List<dynamic>?,
    favorite: json['favorite'] as List<dynamic>?,
    rating: json['rating'] as String?,
    username: json['username'] as String?,
    pinnedcomment: json['pinnedcomment'] as String?,
    product: json['product'] as List<dynamic>?,
    archive: json['archive'] as bool?,
    coverImage: json['coverImage'] as List<dynamic>?,
    type: json['type'] as String?,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
    id: json['_id'] as String?,

  );
}

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'pinnedcomment': instance.pinnedcomment,
      'comment': instance.comment,
      'favorite': instance.favorite,
      'type': instance.type,
      'coverImage': instance.coverImage,
      'body': instance.body,
      'product': instance.product,
      'archive': instance.archive,
      'username': instance.username,
      'rating': instance.rating,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'id': instance.id,
    };
