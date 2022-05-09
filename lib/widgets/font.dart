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

  Poppins(
      {Key? key,
      required this.text,
      required this.size,
      required this.color,
      required this.fontWeight,
      this.fontStyle = FontStyle.normal,
      this.letterSpacing})
      : super(key: key);

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

class PoppinsLeft extends StatelessWidget {
  final double size;
  final double? letterSpacing;
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final FontStyle? fontStyle;

  PoppinsLeft(
      {Key? key,
        required this.text,
        required this.size,
        required this.color,
        required this.fontWeight,
        this.fontStyle = FontStyle.normal,
        this.letterSpacing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        textAlign: TextAlign.left,
        style: GoogleFonts.poppins(
            textStyle: TextStyle(color: color,fontSize: size,fontWeight: fontWeight, fontStyle: fontStyle, letterSpacing: letterSpacing )
        )
    );
  }
}

class PoppinsLeft_Crop extends StatelessWidget {
  final double size;
  final double? letterSpacing;
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final FontStyle? fontStyle;

  PoppinsLeft_Crop(
      {Key? key,
        required this.text,
        required this.size,
        required this.color,
        required this.fontWeight,
        this.fontStyle = FontStyle.normal,
        this.letterSpacing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        textAlign: TextAlign.left,
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
    return Text(text,
        style: GoogleFonts.inter(
            textStyle: TextStyle(
                color: color,
                fontSize: size,
                fontWeight: fontWeight,
                letterSpacing: letterSpacing)));
  }
}

class Inter_Crop extends StatelessWidget {
  final double size;
  final double? letterSpacing;
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final FontStyle? fontStyle;

  Inter_Crop({Key? key, required this.text,required this.size,required this.color, this.fontStyle = FontStyle.normal, required this.fontWeight, this.letterSpacing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: GoogleFonts.inter(
            textStyle: TextStyle(
                color: color,
                fontSize: size,
                fontWeight: fontWeight,
                letterSpacing: letterSpacing)));
  }
}

class Inter_1 extends StatelessWidget {
  final double size;
  final double? letterSpacing;
  final String text;
  final Color? color;
  final FontWeight fontWeight;
  final FontStyle? fontStyle;

  Inter_1(
      {Key? key,
      required this.text,
      required this.size,
      this.color,
      this.fontStyle = FontStyle.normal,
      required this.fontWeight,
      this.letterSpacing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.inter(
            textStyle: TextStyle(
                color: color,
                fontSize: size,
                fontWeight: fontWeight,
                letterSpacing: letterSpacing)));
  }
}

class Roboto extends StatelessWidget {
  final double size;
  final double? letterSpacing;
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final FontStyle? fontStyle;

  Roboto(
      {Key? key,
      required this.text,
      required this.size,
      required this.color,
      this.fontStyle = FontStyle.normal,
      required this.fontWeight,
      this.letterSpacing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.roboto(
            textStyle: TextStyle(
                color: color,
                fontSize: size,
                fontWeight: fontWeight,
                letterSpacing: letterSpacing)));
  }
}

class Roboto_Crop extends StatelessWidget {
  final double size;
  final double? letterSpacing;
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final FontStyle? fontStyle;

  Roboto_Crop(
      {Key? key,
        required this.text,
        required this.size,
        required this.color,
        this.fontStyle = FontStyle.normal,
        required this.fontWeight,
        this.letterSpacing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: GoogleFonts.roboto(
            textStyle: TextStyle(
                color: color,
                fontSize: size,
                fontWeight: fontWeight,
                letterSpacing: letterSpacing)));
  }
}

class Roboto_LH extends StatelessWidget {
  final double size;
  final double? letterSpacing;
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final FontStyle? fontStyle;
  double? height;

  Roboto_LH(
      {Key? key,
        required this.text,
        required this.size,
        required this.color,
        this.fontStyle = FontStyle.normal,
        required this.fontWeight,
        this.letterSpacing,
        this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.roboto(
            textStyle: TextStyle(
                color: color,
                fontSize: size,
                fontWeight: fontWeight,
                letterSpacing: letterSpacing,
                height: height)));
  }
}

class Roboto_Center extends StatelessWidget {
  final double size;
  final double? letterSpacing;
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final FontStyle? fontStyle;

  Roboto_Center(
      {Key? key,
        required this.text,
        required this.size,
        required this.color,
        this.fontStyle = FontStyle.normal,
        required this.fontWeight,
        this.letterSpacing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: GoogleFonts.roboto(
          textStyle: TextStyle(
              color: color,
              fontSize: size,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing)),
      textAlign: TextAlign.center,
    );
  }
}
