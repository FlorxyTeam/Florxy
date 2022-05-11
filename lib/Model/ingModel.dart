import 'package:json_annotation/json_annotation.dart';

part 'ingModel.g.dart';

@JsonSerializable()
class IngModel {
  String name;
  List func;


  IngModel({
    required this.name,
    required this.func,
  });

  factory IngModel.fromJson(Map<String, dynamic> json) =>
      _$IngModelFromJson(json);

  Map<String, dynamic> toJson() => _$IngModelToJson(this);
}
