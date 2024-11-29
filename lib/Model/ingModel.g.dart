// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngModel _$IngModelFromJson(Map<String, dynamic> json) {
  return IngModel(
    name: json['name'] as String,
    func: json['func'] as List<dynamic>,
  );
}

Map<String, dynamic> _$IngModelToJson(IngModel instance) => <String, dynamic>{
      'name': instance.name,
      'func': instance.func,
    };
