import 'package:Florxy/pages/createaccount1.dart';
import 'package:Florxy/widgets/button.dart';
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
    HomePage(),
    SearchPage(),
    NotificationPage(),
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
            bottom: 40,
            child: Container(
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
                    height: 70,
                  ),
                ),
              ),
            )
          )
        ],
      )
    );
  }

}
