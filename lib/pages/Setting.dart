import 'package:flutter/material.dart';
import 'package:Florxy/pages/navbar.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/fontWeight.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                color: c.textWhite,
              ),
            ),
          ),
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

                    // child: Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     Container(
                    //         width: 45,
                    //         height: 45,
                    //         child: IconButton(
                    //           padding: EdgeInsets.zero,
                    //           onPressed: () {
                    //             Navigator.of(context).pop();
                    //           },
                    //           icon: Icon(Icons.arrow_back_ios),
                    //           iconSize: 30,
                    //         )),
                    //     Container(
                    //         width: 45,
                    //         height: 45,
                    //         child: IconButton(
                    //           padding: EdgeInsets.zero,
                    //           onPressed: () {
                    //             Navigator.of(context).pop();
                    //           },
                    //           icon: Icon(Icons.arrow_back_ios),
                    //           iconSize: 30,
                    //         )),
                    //   ],
                    // ),
                  ]),
            ),
          ),
        ]),
      ),
    );

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
  }
}
