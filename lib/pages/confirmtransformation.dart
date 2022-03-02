import 'package:Florxy/pages/createaccount_withemail.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:boxicons/boxicons.dart';

import 'package:Florxy/pages/license.dart';

import 'package:Florxy/widgets/button.dart';

import 'confirmcode.dart';


class ConfirmTransformation extends StatefulWidget {
  const ConfirmTransformation({Key? key}) : super(key: key);

  @override
  _ConfirmTransformationState createState() => _ConfirmTransformationState();
}

class _ConfirmTransformationState extends State<ConfirmTransformation> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Color(0xffF9F9F9),
        body: Stack(
          children: [
            SafeArea(
              child: Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 30, right: 20, top: 20),
                        child :
                        Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Image(
                               image: AssetImage('assets/img/icon2.png'),
                               height: 43,
                             ),
                             IconButton(
                               onPressed: () {
                                 Navigator.of(context).pop();
                                 },
                               icon: Icon(
                                 Icons.close_rounded,
                                 size: 36,
                               ),
                             ),
                           ],
                        ),
                    ),
                    SizedBox(height: 30),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Inter(
                        text: '     CONFIRM',
                        size: 24,
                        color: c.greenMain,
                        fontWeight: f.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Inter(
                        text: '     TRANSFORMATION',
                        size: 24,
                        color: c.greenMain,
                        fontWeight: f.bold,
                      ),
                    ),
                    SizedBox(height: 80,),
                    Padding(
                      padding: EdgeInsets.only(left: 40,right: 40),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ConfirmCode()));
                        },
                        child: Container(
                            height: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: c.shadow.withOpacity(0.32),
                                  spreadRadius: -4,
                                  blurRadius: 23,
                                  offset: Offset(0, 6), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Image(
                                    image: AssetImage('assets/img/Google_icon-icons.com_66793.png'),
                                    height: 25,
                                  ),
                                ),
                                Inter(
                                    text: 'Continue with Google',
                                    size: 13,
                                    color: Color(0xFF484848),
                                    fontWeight: f.bold
                                )
                              ],
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Padding(
                      padding: EdgeInsets.only(left: 40,right: 40),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ConfirmCode()));
                        },
                        child: Container(
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: c.shadow.withOpacity(0.32),
                                spreadRadius: -4,
                                blurRadius: 23,
                                offset: Offset(0, 6), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(Boxicons.bxl_facebook_circle),
                                iconSize: 32,
                                color: Color(0xFF156ACF),
                                onPressed: () {},
                              ),
                              Inter(
                                  text: 'Continue with Facebook',
                                  size: 13,
                                  color: Color(0xFF484848),
                                  fontWeight: f.bold
                              )
                            ],
                          )
                      ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Padding(
                        padding: EdgeInsets.only(left: 40,right: 40),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ConfirmCode()));
                          },
                          child: Container(
                              height: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: c.shadow.withOpacity(0.32),
                                    spreadRadius: -4,
                                    blurRadius: 23,
                                    offset: Offset(0, 6), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Icon(Boxicons.bxs_envelope, size: 30,color: Colors.black)),
                                  Inter(
                                      text: 'Email  ',
                                      size: 13,
                                      color: Color(0xFF484848),
                                      fontWeight: f.bold
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 3,top: 10, bottom: 10),
                                    child: VerticalDivider(
                                      color: c.greySub,
                                      thickness: 1,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5, right: 10),
                                    child: Material(
                                      child: Ink(
                                        height: 24,
                                        width: 24,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black,
                                        ),
                                        child: Center(
                                          child: IconButton(
                                            padding: EdgeInsets.all(0),
                                            icon: Icon(Boxicons.bxs_phone),
                                            iconSize: 19,
                                            color: Colors.white,
                                            onPressed: () {},
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Inter(
                                      text: 'Phone number',
                                      size: 13,
                                      color: Color(0xFF484848),
                                      fontWeight: f.bold
                                  ),
                                ],
                              )
                          ),
                        )
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}