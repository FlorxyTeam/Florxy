import 'package:json_annotation/json_annotation.dart';

part 'ingModel.g.dart';

@JsonSerializable()
class IngModel {
  String name;
  String? rate;
  String calling;
  String irr;
  String come;
  String cosing;
  String detail;
  List func;
  List proof;


  IngModel({
    required this.name,
    required this.func,
    required this.proof,
    required this.rate,
    required this.calling,
    required this.irr,
    required this.come,
    required this.cosing,
    required this.detail,
  });

  factory IngModel.fromJson(Map<String, dynamic> json) =>
      _$IngModelFromJson(json);

  Map<String, dynamic> toJson() => _$IngModelToJson(this);
}
