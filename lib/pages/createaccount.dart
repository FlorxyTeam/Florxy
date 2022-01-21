import 'package:Florxy/widgets/button.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF9F9F9),
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          padding: const EdgeInsets.only(top: 70, right: 40, left: 40),
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 8,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: const Color(0xff32A060),
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        height: 8,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: const Color(0xffc4c4c4),
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        height: 8,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: const Color(0xffc4c4c4),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image(
                        image: AssetImage('assets/img/icon2.png'),
                        height: 40,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Let’s get to know you better',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins'
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'What is your name and\nusername?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 40.0),
                            child: GreenButton(
                              text: 'NEXT',
                              size: 16,
                              color: c.textWhite,
                              height: 70,
                            ),
                          ),
                        )
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}
