//Setting

import 'package:flutter/material.dart';
import 'package:Florxy/pages/navbar.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/fontWeight.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: size.width,
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25))),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: 45,
                              height: 45,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () => Navigator.of(context).pop(),
                                icon: Icon(Icons.arrow_back_ios_new_rounded),
                                iconSize: 23,
                              )),
                          Container(
                            width: 70,
                            child: Inter(
                              text: "Settings",
                              color: c.blackMain,
                              size: 17,
                              fontWeight: f.semiBold,
                            ),
                          ),
                          SizedBox(
                            width: 45,
                            height: 45,
                          ),
                        ]),
                  ),
                ),
                Positioned(
                  top: 60,
                  left: 0,

                  child:Container(),


                ),
              ],
            ),
          )),
    );
  }
}

// return SafeArea(
//   child: Scaffold(
//     appBar: AppBar(),
//     body: Container(
//       child: IconButton(
//           icon: Icon(Icons.arrow_back_ios, color: c.blackSub),
//           onPressed: () => Navigator.of(context).pop()),
//     ),
//   ),
// );

// TextFormField(
//
// decoration: InputDecoration(
//
// hintText: 'Email Address',
// hintStyle: TextStyle(fontSize: 14, color: c.graySub2, fontWeight: f.medium),
// prefixIcon: Padding(
// padding: EdgeInsets.only(right: 13, left: 20),
// child: Icon(
// Icons.email, size: 25,
// ),
// ),
// enabledBorder: OutlineInputBorder(
// borderRadius: BorderRadius.all(Radius.circular(13.0)),
// borderSide: BorderSide(color: c.graySub2.withOpacity(0), width: 2),
// ),
// focusedBorder: OutlineInputBorder(
// borderRadius: BorderRadius.all(Radius.circular(13.0)),
// borderSide: BorderSide(color: c.greenMain, width: 2),
// ),
// )),
