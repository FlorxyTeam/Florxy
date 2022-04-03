import 'dart:ffi';
import 'package:json_annotation/json_annotation.dart';

part 'productModel.g.dart';

@JsonSerializable()
class ProductModel {
  String? id;
  String p_name;
  String p_brand;
  String p_desc;
  String p_img;
  List ing_name;
  List ing_met;
  List ing_irr;
  List ing_rate;
  int mention;
  int review;

  ProductModel({
    this.id,
    required this.p_name,
    required this.p_brand,
    required this.p_desc,
    required this.p_img,
    required this.ing_name,
    required this.ing_met,
    required this.ing_irr,
    required this.ing_rate,
    required this.mention,
    required this.review,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
