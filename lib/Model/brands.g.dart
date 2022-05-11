// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brands.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandModel _$BrandModelFromJson(Map<String, dynamic> json) {
  return BrandModel(
    id: json['_id'] as String?,
    name: json['name'] as String,
    owners: json['owners'] as List<dynamic>,
    about: json['about'] as String,
    banner: json['banner'] as String,
    recommend: json['recommend'] as List<dynamic>,
  );
}

Map<String, dynamic> _$BrandModelToJson(BrandModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'owners': instance.owners,
      'about': instance.about,
      'banner': instance.banner,
      'recommend': instance.recommend,
    };
