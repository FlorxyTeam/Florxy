import 'package:Florxy/widgets/fontWeight.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/button.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/pages/privilege3.dart';
import 'package:Florxy/pages/EditProfile.dart';
import 'package:getwidget/components/button/gf_button.dart';

class AliasFinish extends StatefulWidget {
  const AliasFinish({Key? key}) : super(key: key);

  @override
  _AliasFinishState createState() => _AliasFinishState();
}

class _AliasFinishState extends State<AliasFinish> {
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
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Inter(
                        text: '     FINISH!',
                        size: 25,
                        color: c.greenMain,
                        fontWeight: f.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Poppins(
                                text: "  Lorem Ipsum is simply dummy text of the printing and ",
                                size: 11,
                                color: c.blackSub,
                                fontWeight: f.medium),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Poppins(
                                text: "  typesetting industry. Lorem Ipsum has been the industry's ",
                                size: 11,
                                color: c.blackSub,
                                fontWeight: f.medium),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Poppins(
                                text: "  standard dummy text ever since the 1500s, when an ",
                                size: 11,
                                color: c.blackSub,
                                fontWeight: f.medium),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Poppins(
                                text: "  unknown printer took a galley of type and scrambled it to ",
                                size: 11,
                                color: c.blackSub,
                                fontWeight: f.medium),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Poppins(
                                text: "  make a type specimen book.",
                                size: 11,
                                color: c.blackSub,
                                fontWeight: f.medium),
                          ),
                          SizedBox(height: 50,),
                          Padding(
                            padding: EdgeInsets.only(left: 7, right: 0, top: 0),
                            child : Row(
                              children: [
                                Icon(
                                    Icons.circle,
                                    color: c.blackMain,
                                    size: 6,
                                  ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Poppins(
                                      text: "  Lorem Ipsum is simply dummy text of the printing and ",
                                      size: 11,
                                      color: c.blackSub,
                                      fontWeight: f.medium),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15, right: 0, top: 0),
                            child :
                            Align(
                              alignment: Alignment.topLeft,
                              child: Poppins(
                                  text: "  typesetting.",
                                  size: 11,
                                  color: c.blackSub,
                                  fontWeight: f.medium),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Padding(
                            padding: EdgeInsets.only(left: 7, right: 0, top: 0),
                            child : Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: c.blackMain,
                                  size: 6,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Poppins(
                                      text: "  Lorem Ipsum is simply dummy.",
                                      size: 11,
                                      color: c.blackSub,
                                      fontWeight: f.medium),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20,),
                          Padding(
                            padding: EdgeInsets.only(left: 7, right: 0, top: 0),
                            child : Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: c.blackMain,
                                  size: 6,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Poppins(
                                      text: "  Lorem Ipsum is simply dummy text of the printing and ",
                                      size: 11,
                                      color: c.blackSub,
                                      fontWeight: f.medium),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15, right: 0, top: 0),
                            child :
                            Align(
                              alignment: Alignment.topLeft,
                              child: Poppins(
                                  text: "  typesetting. Lorem Ipsum has been the industry's ",
                                  size: 11,
                                  color: c.blackSub,
                                  fontWeight: f.medium),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15, right: 0, top: 0),
                            child :
                            Align(
                              alignment: Alignment.topLeft,
                              child: Poppins(
                                  text: "  standard dummy text ever since the 1500s.",
                                  size: 11,
                                  color: c.blackSub,
                                  fontWeight: f.medium),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 15,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 0, right: 0, top: 0),
                      child : Row(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Poppins(
                                text: 'Lorem Ipsum is simply dummy text of the ',
                                size: 11,
                                color: c.blackSub,
                                fontWeight: f.medium),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Poppins(
                                text: 'Contact Us',
                                size: 11,
                                color: c.blackSub,
                                fontWeight: f.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.only(left: 40,right: 40),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditPage()));
                          },
                          child: GreenButton(
                            text: 'NEXT',
                            size: 18,
                            color: c.textWhite,
                            height: 60,
                          ),
                        ),
                      ),
                    )],
                )
            )
          ],
        )
    );
  }
}