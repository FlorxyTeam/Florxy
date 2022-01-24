import 'package:Florxy/widgets/button.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:boxicons/boxicons.dart';
import 'package:Florxy/pages/lastthingspage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateWithEmail extends StatefulWidget {
  const CreateWithEmail({Key? key}) : super(key: key);


  @override
  _CreateWithEmailState createState() => _CreateWithEmailState();
}

class _CreateWithEmailState extends State<CreateWithEmail> {
  List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    _focusNodes.forEach((node){
      node.addListener(() {
        setState(() {});
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom!= 0;
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      body: Stack(
        children: [
          SafeArea(
              child: Container(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(
                          image: AssetImage('assets/img/icon2.png'),
                          height: 43,
                        ),
                        IconButton(onPressed: () { Navigator.pop(context); }, icon: Icon(Icons.close_rounded,size: 36,),



                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Inter(
                        text: 'CREATE A NEW',
                        size: 25,
                        color: c.greenMain,
                        fontWeight: f.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Inter(
                        text: 'ACCOUNT',
                        size: 25,
                        color: c.greenMain,
                        fontWeight: f.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Poppins(
                            text: 'Email',
                            size: 12,
                            color: c.blackSub,
                            fontWeight: f.medium),
                        ),
                        SizedBox(height: 5),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(13.0)),
                          ),
                          child: TextField(
                          focusNode: _focusNodes[0],
                          decoration: InputDecoration(
                            hintText: 'Email Address',
                            hintStyle: TextStyle(fontSize: 14, color: c.graySub2, fontWeight: f.regular),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(right: 13, left: 20),
                              child: Icon(
                                  Icons.email, size: 25, color: _focusNodes[0].hasFocus ? c.greenMain : c.graySub2
                              ),
                            ),
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
                      ],
                    ),
                    SizedBox(height: 18),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Poppins(
                              text: 'Password',
                              size: 12,
                              color: c.blackSub,
                              fontWeight: f.medium),
                        ),
                        SizedBox(height: 5),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(13.0)),
                          ),
                          child: TextField(
                              focusNode: _focusNodes[1],
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: TextStyle(fontSize: 14, color: c.graySub2, fontWeight: f.regular),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(right: 13, left: 20),
                                  child: Icon(
                                      Icons.lock_rounded, size: 25, color: _focusNodes[1].hasFocus ? c.greenMain : c.graySub2
                                  ),
                                ),
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
                      ],
                    ),
                    SizedBox(height: 18),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Poppins(
                              text: 'Confirm Password',
                              size: 12,
                              color: c.blackSub,
                              fontWeight: f.medium),
                        ),
                        SizedBox(height: 5),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(13.0)),
                          ),
                          child: TextField(
                              focusNode: _focusNodes[2],
                              decoration: InputDecoration(
                                hintText: 'Confirm Password',
                                hintStyle: TextStyle(fontSize: 14, color: c.graySub2, fontWeight: f.regular),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(right: 13, left: 20),
                                  child: Icon(
                                      Icons.lock_rounded, size: 25, color: _focusNodes[2].hasFocus ? c.greenMain : c.graySub2
                                  ),
                                ),
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

                      ],
                    )
                  ],
                ),
              )
          ),
          Positioned(
              bottom: 35,
              child: Column(
                children: [
                  if(!isKeyboard) Center(
                      child: Roboto_Center(text: 'By continuing, you agree to Florxy’s Terms & Conditions\nand Pricacy Policy.', size: 11.5, color: Color(0xFFAFC8A9), fontWeight: f.medium)
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.only(left: 45,right: 45),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LastThingPage()), (route) => false);
                        },
                        child: GreenButton(
                          text: 'CONTINUE',
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
      ),
    );
  }
}
