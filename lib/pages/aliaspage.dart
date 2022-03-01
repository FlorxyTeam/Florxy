import 'package:Florxy/pages/privilege1.dart';
import 'package:Florxy/pages/privilege2.dart';
import 'package:Florxy/pages/privilege3.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/button.dart';

import 'navbar.dart';

class AliasPage extends StatefulWidget {
  const AliasPage({Key? key}) : super(key: key);

  @override
  _AliasPageState createState() => _AliasPageState();
}

class _AliasPageState extends State<AliasPage> {
  List list = [
    Privilege1(),
    Privilege2(),
    Privilege3(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            list[_currentIndex],
            Positioned(
                bottom: 30,
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.only(left: 40,right: 40),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if(_currentIndex<=1){
                                _currentIndex = _currentIndex+1;
                              }
                            });
                          },
                          child: _currentIndex==2?Container():GreenButton(
                            text: 'CONTINUE',
                            size: 13,
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