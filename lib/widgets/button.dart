import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:Florxy/widgets/font.dart';

class GreenButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  double? height;
  String? text;
  Color? color;
  double? size;
  GreenButton({Key? key, this.width, this.height, this.text, this.color, this.size, this.isResponsive=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Color(0xff32a060),
        ),
        child: Center(
            child: Poppins(
              text: text!,
              size: size!,
              color: color!,
              fontWeight: f.bold,
              letterSpacing: 2,
            )
        )
    );
  }

}

class GreyButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  double? height;
  String? text;
  Color? color;
  double? size;
  GreyButton({Key? key, this.width, this.height, this.text, this.color, this.size, this.isResponsive=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: c.graySub2,
        ),
        child: Center(
            child: Poppins(
              text: text!,
              size: size!,
              color: color!,
              fontWeight: f.bold,
              letterSpacing: 2,
            )
        )
    );
  }

}


class WhiteButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  double? height;
  String? text;
  Color? color;
  double? size;
  WhiteButton({Key? key, this.width, this.height, this.text, this.color, this.size, this.isResponsive=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
        ),
        child: Center(
            child: Poppins(
              text: text!,
              size: size!,
              color: color!,
              fontWeight: f.bold,
              letterSpacing: 2,
            )
        )
    );
  }

}


class WhiteGreenButton extends StatelessWidget {
  bool? isResponsive;
  String? text;
  double? size;
  WhiteGreenButton({Key? key, this.text, this.size, this.isResponsive=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
          border: Border.all(color: c.greenMain, width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
          child: Center(
              child: Inter(
                text: text!,
                size: size!,
                color: c.greenMain,
                fontWeight: f.bold,
              )
          ),
        )
    );
  }

}