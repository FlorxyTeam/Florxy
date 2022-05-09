import 'package:flutter/cupertino.dart';

class AliasModel {
  String? alias;
  Color? color;
  AliasModel({ this.alias, this.color });

}

class Professor {
  List<AliasModel> alias_professor = [
    AliasModel(alias: "Pharmacy", color: Color(0xFFBA2797)),
    AliasModel(alias: "Advisor", color: Color(0xFF8F1B95)),
    AliasModel(alias: "Dermatologist", color: Color(0xFF5E0E94)),
    AliasModel(alias: "R&D Cosmetics", color: Color(0xFF3A0694)),
    AliasModel(alias: "Scientist", color: Color(0xFF2C0398)),
    AliasModel(alias: "Makeup Artist", color: Color(0xFF1A19AB)),
    AliasModel(alias: "Beauty Advisor", color: Color(0xFF1432C0)),
    AliasModel(alias: "Beauty & Personal Care", color: Color(0xFF2B64AD)),
    AliasModel(alias: "Hair Salon", color: Color(0xFF479FD3)),
    AliasModel(alias: "Barber Salon", color: Color(0xFF439697)),
    AliasModel(alias: "Cosmetic Dentist", color: Color(0xFF86B953)),
    AliasModel(alias: "Plastic Surgeon", color: Color(0xFF54B638)),
    AliasModel(alias: "Medical Spa", color: Color(0xFF469950)),
    AliasModel(alias: "Surgeon", color: Color(0xFF29614B)),
    AliasModel(alias: "Lasik/Laser Eye Surgeon", color: Color(0xFF1D494A)),
  ];
}

class Creator {
  List<AliasModel> alias_creator = [
    AliasModel(alias: "Brand Presenter", color: Color(0xFF781E0E)),
    AliasModel(alias: "Brand Owner", color: Color(0xFFA62C17)),
    AliasModel(alias: "Blogger", color: Color(0xFFE93324)),
    AliasModel(alias: "Beauty Blogger", color: Color(0xFFE84826)),
    AliasModel(alias: "Youtuber", color: Color(0xFFEC6F2E)),
    AliasModel(alias: "Tiktoker", color: Color(0xFFEE8732)),
    AliasModel(alias: "Beauty Supplier", color: Color(0xFFF09F39)),
    AliasModel(alias: "Beauty Supply Store", color: Color(0xFFA06B23)),
    AliasModel(alias: "Cosmetic Store", color: Color(0xFF734C17)),
  ];
}