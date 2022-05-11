// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************
IngModel _$IngModelFromJson(Map<String, dynamic> json) {
  return IngModel(
    name: json['name'] as String,
    func: json['func'] as List<dynamic>,
    rate: json['rate'] as String,
    calling: json['calling'] as String,
    irr: json['irr'] as String,
    come: json['come'] as String,
    cosing: json['cosing'] as String,
    detail: json['detail'] as String,

  );
}

Map<String, dynamic> _$IngModelToJson(IngModel instance) => <String, dynamic>{
      'name': instance.name,
      'func': instance.func,
      'rate': instance.rate,
      'calling': instance.calling,
      'irr': instance.irr,
      'come': instance.come,
      'cosing': instance.cosing,
      'detail': instance.detail,
    };
