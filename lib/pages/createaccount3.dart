import 'package:Florxy/pages/createaccount2.dart';
import 'package:Florxy/widgets/button.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:boxicons/boxicons.dart';


class CreateAccount3 extends StatefulWidget {
  const CreateAccount3({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount3> {
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
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Stack(
                        children: [
                          IconButton(
                            icon: Icon(Boxicons.bx_left_arrow_alt),
                            iconSize: 35,
                            color: Colors.black,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 22.75),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 5.5,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color: c.greySub,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Container(
                                  height: 5.5,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color: c.greySub,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Container(
                                  height: 5.5,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color: c.greenMain,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(
                          image: AssetImage('assets/img/icon2.png'),
                          height: 40,
                        ),
                        const SizedBox(width: 10),
                        Poppins(
                          text: 'OK , Last step!',
                          size: 18,
                          fontWeight: f.medium,
                          color: Colors.black,
                        )
                      ],
                    ),
                    SizedBox(height: 80,),
                    Padding(
                      padding: EdgeInsets.only(left: 50,right: 50),
                      child: NormalButton(
                        text: 'Continue with Google',
                        size: 15,
                        color: Color(0xFF484848),
                        height: 55,
                      ),
                    ),
                    SizedBox(height: 25),
                    Padding(
                      padding: EdgeInsets.only(left: 50,right: 50),
                      child: NormalButton(
                        text: 'Continue with Facebook',
                        size: 15,
                        color: Color(0xFF484848),
                        height: 55,
                      ),
                    ),
                    SizedBox(height: 25),
                    Padding(
                      padding: EdgeInsets.only(left: 50,right: 50),
                      child: NormalButton(
                        text: 'Email  |  Phone number',
                        size: 15,
                        color: Color(0xFF484848),
                        height: 55,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 55,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Roboto(
                  text: 'By continuing, you agree to Florxy’s Terms & Conditions\nand Pricacy Policy.',
                  size: 11.5, color: Color(0xFFAFC8A9),
                  fontWeight: f.medium),
              ),
            ),
          ],
        )
    );
  }
}