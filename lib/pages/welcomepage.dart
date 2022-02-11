import 'package:Florxy/pages/createaccount1.dart';
import 'package:Florxy/pages/registerpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/ModalLogin.dart';

import 'package:Florxy/pages/LoginPage.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../pages/googlestream.dart';
import '../provider/google_sign_in.dart';
import 'navbar.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

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
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateAccount1()));
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

class ModalLogin {
  static Dialog_Settings(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            color: Colors.transparent,
            height: 520,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: _buildLoginMenu(context),
              ),
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(40),
                      topRight: const Radius.circular(40))),
            ),
          );
        });
  }
}

Column _buildLoginMenu(context) {
  return Column(
    children: [
      Container(
        width: 88,
        child: Divider(
          height: 0,
          color: c.greyMain,
          thickness: 4,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 45,right: 45, top: 48),
        child: GestureDetector(
          onTap: () async {
            final provider = Provider.of<GoogleSignInProvider>(context, listen:false);
            await provider.googleLogin();
            // print(user.email);
            // print(user.uid);

            Navigator.pushAndRemoveUntil(context, MaterialPageRoute
              (builder: (context)=>GoogleStream()), (route) => false);



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
                    padding: EdgeInsets.only(right: 9),
                    child: Image(
                      image: AssetImage('assets/img/Google_icon-icons.com_66793.png'),
                      height: 23,
                    ),
                  ),
                  Inter(
                      text: 'Continue with Google',
                      size: 13,
                      color: Color(0xFF484848),
                      fontWeight: f.bold
                  )
                ],
              )
          ),
        ),
      ),
      SizedBox(height: 25),
      Padding(
        padding: EdgeInsets.only(left: 45,right: 45),
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
                    padding: EdgeInsets.only(right: 7),
                    child: Icon(Boxicons.bxl_facebook_circle, size: 30,color: Color(0xFF156ACF))),
                Inter(
                    text: 'Continue with Facebook',
                    size: 13,
                    color: Color(0xFF484848),
                    fontWeight: f.bold
                )
              ],
            )
        ),
      ),
      SizedBox(height: 25),
      Padding(
          padding: EdgeInsets.only(left: 45,right: 45),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
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
                        padding: EdgeInsets.only(right: 7),
                        child: Icon(Boxicons.bxs_envelope, size: 28,color: Colors.black)),
                    Inter(
                        text: 'Email  ',
                        size: 13,
                        color: Color(0xFF484848),
                        fontWeight: f.bold
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: VerticalDivider(
                        color: c.greySub,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5, right: 7),
                      child: Material(
                        child: Ink(
                          height: 23,
                          width: 23,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                          child: Center(
                            child: Padding(
                                padding: EdgeInsets.all(0),
                                child: Icon(Boxicons.bxs_phone,size: 18,color: Colors.white)
                            ),
                          ),
                        ),
                      ),
                    ),
                    Inter(
                        text: 'Phone number',
                        size: 13,
                        color: Color(0xFF484848),
                        fontWeight: f.bold
                    ),
                  ],
                )
            ),
          )
      ),
    ],
  );
}

