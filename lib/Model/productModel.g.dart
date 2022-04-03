// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return ProductModel(
    id: json['id'] as String?,
    p_name: json['p_name'] as String,
    p_brand: json['p_brand'] as String,
    p_desc: json['p_desc'] as String,
    p_img: json['p_img'] as String,
    ing_name: json['ing_name'] as List<dynamic>,
    ing_met: json['ing_met'] as List<dynamic>,
    ing_irr: json['ing_irr'] as List<dynamic>,
    ing_rate: json['ing_rate'] as List<dynamic>,
    mention: json['mention'] as int,
    review: json['review'] as int,
  );
}

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'p_name': instance.p_name,
      'p_brand': instance.p_brand,
      'p_desc': instance.p_desc,
      'p_img': instance.p_img,
      'ing_name': instance.ing_name,
      'ing_met': instance.ing_met,
      'ing_irr': instance.ing_irr,
      'ing_rate': instance.ing_rate,
      'mention': instance.mention,
      'review': instance.review,
    };
