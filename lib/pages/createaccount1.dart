import 'package:Florxy/pages/createaccount2.dart';
import 'package:Florxy/widgets/button.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:boxicons/boxicons.dart';


class CreateAccount1 extends StatefulWidget {
  const CreateAccount1({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount1> {
  
  @override
  Widget build(BuildContext context) {
    FocusNode myFocusNode1 = new FocusNode();
    FocusNode myFocusNode2 = new FocusNode();

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
                                color: c.greenMain,
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
                                color: c.greySub,
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
                        text: 'Let’s get to know you better',
                        size: 18,
                        fontWeight: f.medium,
                        color: Colors.black,
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Poppins(
                        text: 'What is your name and\nusername?',
                        size: 24,
                        fontWeight: f.semiBold,
                        color: Colors.black,
                      )
                    ],
                  ),
                  SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    height: 60,
                    child: TextField(
                      focusNode: myFocusNode1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Fullname',
                        hintText: 'Enter your fullname',
                        hintStyle: TextStyle(fontSize: 16, color: c.greyMain),
                        labelStyle: TextStyle(fontSize: 16, color: myFocusNode1.hasFocus ? c.greenMain : c.greyMain),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                      ),
                      autofocus: false,
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    height: 60,
                    child: TextField(
                      // onTap: () {
                      //   setState(() {
                      //     myFocusNode2.hasFocus=true;
                      //   });
                      // },
                      focusNode: myFocusNode2,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                        hintText: 'Enter your username',
                        hintStyle: TextStyle(fontSize: 16, color: c.greyMain),
                        labelStyle: TextStyle(fontSize: 16, color: myFocusNode2.hasFocus ? c.greyMain : c.greenMain),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                      ),
                      autofocus: false,
                    ),
                  ),
                ],
              ),
          ),
            ),
            Positioned(
              bottom: 55,
              child: Column(
                children: [
                  Center(
                    child: Roboto(text: 'By continuing, you agree to Florxy’s Terms & Conditions\nand Pricacy Policy.', size: 11.5, color: Color(0xFFAFC8A9), fontWeight: f.medium)
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                    padding: EdgeInsets.only(left: 40,right: 40),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateAccount2()));
                      },
                      child: GreenButton(
                        text: 'NEXT',
                        size: 16,
                        color: c.textWhite,
                        height: 65,
                        ),
                    ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
    );
  }
}

OutlineInputBorder myinputborder(){ //return type is OutlineInputBorder
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(13),
      borderSide: BorderSide(
        color:c.greySub,
        width: 2,
      )
  );
}

OutlineInputBorder myfocusborder(){
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(13),
      borderSide: BorderSide(
        color:c.greenMain,
        width: 2,
      )
  );
}

