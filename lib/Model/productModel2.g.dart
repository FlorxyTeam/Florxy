// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productModel2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProModel _$ProModelFromJson(Map<String, dynamic> json) {
  return ProModel(
    id: json['_id'] as String?,
    p_name: json['p_name'] as String,
    p_brand: json['p_brand'] as String,
    p_desc: json['p_desc'] as String,
    p_cate: json['p_cate'] as String?,
    p_img: json['p_img'] as String,
    ing_id: json['ing_id'] as List<dynamic>?,
    rating: json['rating'] as int,
    numReview: json['numReview'] as int,
  );
}

Map<String, dynamic> _$ProModelToJson(ProModel instance) => <String, dynamic>{
      'id': instance.id,
      'p_name': instance.p_name,
      'p_brand': instance.p_brand,
      'p_desc': instance.p_desc,
      'p_cate': instance.p_cate,
      'p_img': instance.p_img,
      'ing_id': instance.ing_id,
      'rating': instance.rating,
      'numReview': instance.numReview,
    };
