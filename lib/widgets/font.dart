import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Poppins extends StatelessWidget {
  final double size;
  final double? letterSpacing;
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final FontStyle? fontStyle;

  Poppins({Key? key, required this.text,required this.size,required this.color ,required this.fontWeight, this.fontStyle = FontStyle.normal, this.letterSpacing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(color: color,fontSize: size,fontWeight: fontWeight, fontStyle: fontStyle, letterSpacing: letterSpacing )
      )
    );
  }
}

class Inter extends StatelessWidget {
  final double size;
  final double? letterSpacing;
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final FontStyle? fontStyle;

  Inter({Key? key, required this.text,required this.size,required this.color, this.fontStyle = FontStyle.normal, required this.fontWeight, this.letterSpacing}) : super(key: key);

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

class Roboto extends StatelessWidget {
  final double size;
  final double? letterSpacing;
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final FontStyle? fontStyle;

  Roboto({Key? key, required this.text,required this.size,required this.color , this.fontStyle = FontStyle.normal ,required this.fontWeight, this.letterSpacing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.roboto(
            textStyle: TextStyle(color: color,fontSize: size,fontWeight: fontWeight, letterSpacing: letterSpacing )
        )
    );
  }
}

