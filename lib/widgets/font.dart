import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Poppins extends StatelessWidget {
  double size;
  double? letterSpacing;
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final FontStyle? fontStyle;

  Poppins({Key? key, required this.text,required this.size,required this.color ,required this.fontWeight, this.fontStyle = FontStyle.normal, this.letterSpacing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(color: color,fontSize: size,fontWeight: fontWeight, fontStyle: fontStyle, letterSpacing: letterSpacing )
      )
    );
  }
}

class Inter extends StatelessWidget {
  double size;
  double? letterSpacing;
  final String text;
  final Color color;
  final FontWeight fontWeight;

  Inter({Key? key, required this.text,required this.size,required this.color ,required this.fontWeight, this.letterSpacing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        style: GoogleFonts.inter(
            textStyle: TextStyle(color: color,fontSize: size,fontWeight: fontWeight, letterSpacing: letterSpacing )
        )
    );
  }
}

