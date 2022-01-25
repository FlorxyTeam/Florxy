import 'package:Florxy/pages/createaccount2.dart';
import 'package:Florxy/pages/createaccount_withemail.dart';
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
                      padding: EdgeInsets.only(left: 40,right: 40),
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
                                  size: 14,
                                  color: Color(0xFF484848),
                                  fontWeight: f.bold
                              )
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 25),
                    Padding(
                      padding: EdgeInsets.only(left: 40,right: 40),
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
                                padding: EdgeInsets.only(right: 8),
                                child: Icon(Boxicons.bxl_facebook_circle,size: 32,color: Color(0xFF156ACF)),
                              ),
                              Inter(
                                  text: 'Continue with Facebook',
                                  size: 14,
                                  color: Color(0xFF484848),
                                  fontWeight: f.bold
                              )
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 25),
                    Padding(
                      padding: EdgeInsets.only(left: 40,right: 40),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateWithEmail()));
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
                                    size: 14,
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
                                        child: Padding(
                                          padding: EdgeInsets.all(0),
                                          child: Icon(Boxicons.bxs_phone,size: 19,color: Colors.white,)
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Inter(
                                    text: 'Phone number',
                                    size: 14,
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
            // Positioned(
            //   bottom: 55,
            //   child: Container(
            //     width: MediaQuery.of(context).size.width,
            //     child: Roboto(
            //       text: 'By continuing, you agree to Florxy’s Terms & Conditions\nand Pricacy Policy.',
            //       size: 11.5, color: Color(0xFFAFC8A9),
            //       fontWeight: f.medium),
            //   ),
            // ),
          ],
        )
    );
  }
}