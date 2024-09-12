import 'package:json_annotation/json_annotation.dart';

part 'brands.g.dart';

@JsonSerializable()
class BrandModel {
  String? id;
  String name;
  List owners;
  String about;
  String banner;
  List recommend;


  BrandModel({
    this.id,
    required this.name,
    required this.owners,
    required this.about,
    required this.banner,
    required this.recommend,

  });

  factory BrandModel.fromJson(Map<String, dynamic> json) =>
      _$BrandModelFromJson(json);

  Map<String, dynamic> toJson() => _$BrandModelToJson(this);
}
