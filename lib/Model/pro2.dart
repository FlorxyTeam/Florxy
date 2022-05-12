// import 'dart:ffi';
import 'package:json_annotation/json_annotation.dart';

part 'pro2.g.dart';

@JsonSerializable()
class ProModel {
  String? id;
  String p_name;
  String p_brand;
  String p_desc;
  String? p_cate;
  String p_img;
  List? ing_id;
  int rating;
  int numReview;

  ProModel( {
    this.id,
    required this.p_name,
    required this.p_brand,
    required this.p_desc,
    this.p_cate,
    required this.p_img,
    this.ing_id,
    required this.rating,
    required this.numReview,
  });

  factory ProModel.fromJson(Map<String, dynamic> json) =>
      _$ProModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProModelToJson(this);
}
