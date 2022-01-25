import 'package:Florxy/pages/createaccount1.dart';
import 'package:Florxy/pages/registerpage.dart';
import 'package:Florxy/widgets/ModalLogin.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/ModalLogin.dart';

import 'navbar.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/SE4-fix.gif"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
            color: Color(0xFF2E2F2B).withOpacity(0.48),
            ),
          ),
          SafeArea(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 70),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage('assets/img/icon.png'),
                      height: 100,
                    ),
                    SizedBox(height: 10),
                    Inter(text: 'JOIN FLOXY', size: 42, color: Colors.white, fontWeight: f.bold),
                    SizedBox(height: 5),
                    Roboto(text: 'Change your life by take care your skin', size: 10.5, color: Colors.white, fontWeight: f.regular),

                  ],
                ),
              )
            ),
          ),
          Positioned(
            bottom: 70,
            child: Container(
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
              // margin: EdgeInsets.only(bottom: 10),
              child: Padding(
                  padding: EdgeInsets.only(left: 40,right: 40),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          print('click!!');
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterPage()));
                        },
                        child: WhiteButton(
                          text: 'REGISTER',
                          size: 16,
                          color: c.greenMain,
                          height: 60,
                        ),
                      ),
                      SizedBox(height: 25),
                      GestureDetector(
                        onTap: (){
                          ModalLogin.Dialog_Settings(context);
                        },
                        child: GreenButton(
                          text: 'LOGIN',
                          size: 16,
                          color: c.textWhite,
                          height: 60,
                        ),
                      )
                    ],
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
