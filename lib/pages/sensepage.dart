import 'dart:io';

import 'package:Florxy/widgets/ModalLogin.dart';
import 'package:Florxy/pages/navbar.dart';

import 'package:flutter/material.dart';
import 'package:Florxy/widgets/button.dart';
import 'package:Florxy/pages/profilepage.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/types/gf_alert_type.dart';

class SensePage extends StatefulWidget {
  const SensePage({Key? key}) : super(key: key);

  @override
  _SensePageState createState() => _SensePageState();
}

class _SensePageState extends State<SensePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: c.blackMain.withOpacity(0),
      body: Stack(
        children: <Widget>[
          SizedBox(height: 250),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 200),
            child: Center(
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.remove_red_eye_outlined,
                            color: c.greyMain.withOpacity(0.8),
                          ),
                        ),
                        TextSpan(
                          text: ' Sense your product here',
                          style: TextStyle(
                            color: c.greyMain.withOpacity(0.8),
                            fontWeight: f.bold,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            ),
          ),
          SafeArea(
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 10, top: 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GFButton(
                          onPressed:  () {
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute
                              (builder: (context)=>Navbar()), (route) => false);
                          },
                          text: 'on',
                          textStyle : TextStyle(color: Colors.yellow, fontSize: 15, fontWeight: FontWeight.bold),
                          icon: Icon(Icons.flash_on,size: 15,color: Colors.yellow,),
                          color: Colors.yellow,
                          type: GFButtonType.outline2x,
                          shape: GFButtonShape.pills,
                          size: GFSize.LARGE,
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute
                              (builder: (context)=>Navbar()), (route) => false);
                          },
                          icon: Icon(
                            Icons.close_rounded,
                            size: 36,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}