import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:boxicons/boxicons.dart';
import 'package:Florxy/pages/license.dart';
import 'package:Florxy/pages/aliasfinish.dart';
import 'package:Florxy/widgets/button.dart';




class ConfirmCode extends StatefulWidget {
  const ConfirmCode({Key? key}) : super(key: key);

  @override
  _ConfirmCodeState createState() => _ConfirmCodeState();
}

class _ConfirmCodeState extends State<ConfirmCode> {
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
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => License()),
                                      (route) => false);
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
                        text: '     ENTER',
                        size: 25,
                        color: c.greenMain,
                        fontWeight: f.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Inter(
                        text: '     CONFIRMATION CODE',
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
                                text: '  We sent information code to Puttitabacon@outlook.com',
                                size: 12,
                                color: c.blackSub,
                                fontWeight: f.medium),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 0, right: 0, top: 0),
                            child : Row(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Poppins(
                                      text: '  If you don’t see confirmation code ',
                                      size: 12,
                                      color: c.blackSub,
                                      fontWeight: f.medium),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Poppins(
                                      text: 'Resent',
                                      size: 12,
                                      color: c.blackSub,
                                      fontWeight: f.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 7, right: 5, top: 0),
                            child : Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(13.0)),
                              ),
                              child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Confirmation Code',
                                    hintStyle: TextStyle(fontSize: 14, color: c.graySub2, fontWeight: f.regular),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                      borderSide: BorderSide(color: c.graySub2.withOpacity(0), width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                      borderSide: BorderSide(color: c.greenMain, width: 2),
                                    ),
                                  )),
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
                    SizedBox(height: 15),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.only(left: 40,right: 40),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AliasFinish()));
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