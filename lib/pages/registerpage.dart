import 'package:Florxy/pages/createaccount1.dart';
import 'package:Florxy/pages/createaccount2.dart';
import 'package:Florxy/pages/createaccount3.dart';
import 'package:Florxy/widgets/button.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/pages/homepage.dart';
import 'package:Florxy/pages/notificationpage.dart';
import 'package:Florxy/pages/searchpage.dart';
import 'package:Florxy/widgets/fontWeight.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  List list = [
    CreateAccount1(),
    CreateAccount2(),
    CreateAccount3(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: c.textWhite,
      body: Stack(
        children: [
          list[_currentIndex],
          Positioned(
            bottom: 35,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Roboto_Center(
                      text: 'By continuing, you agree to Florxy’s Terms & Conditions\nand Pricacy Policy.',
                      size: 11.5, color: Color(0xFFAFC8A9),
                      fontWeight: f.medium,
                  )
                ),
                SizedBox(height: 15),
                Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.only(left: 45,right: 45),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if(_currentIndex<=1){
                          _currentIndex = _currentIndex+1;
                        }
                      });
                    },
                    child: _currentIndex==2?Container():GreenButton(
                      text: 'NEXT',
                      size: 16,
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
