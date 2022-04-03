import 'dart:convert';

import 'package:Florxy/pages/createaccount1.dart';
import 'package:Florxy/pages/registerpage.dart';
import 'package:Florxy/web/Loadingscreen-web.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/ModalLogin.dart';
// import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:Florxy/pages/LoginPage.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../NetworkHandler.dart';
import '../pages/Loadingscreen.dart';
import '../pages/createaccount_withemail.dart';
import '../pages/googlestream.dart';
import '../provider/google_sign_in.dart';
// import 'navbar.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class WelcomePageWeb extends StatefulWidget {
  const WelcomePageWeb({Key? key}) : super(key: key);

  @override
  _WelcomePageWebState createState() => _WelcomePageWebState();
}

class _WelcomePageWebState extends State<WelcomePageWeb> {
  bool vis = true;
  final _globalkey = GlobalKey<FormState>();
  NetworkHandler networkHandler = NetworkHandler();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String? errorText;
  bool validate = false;
  bool circular = false;
  final storage = new FlutterSecureStorage();

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
    final user = FirebaseAuth.instance.currentUser;
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom!= 0;
    return (MediaQuery.of(context).size.width > 600)?Scaffold(

      backgroundColor: Color(0x00000000),
      body: SingleChildScrollView(
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Container(
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
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      Image(
                        image: AssetImage('assets/img/florxy_icon.png'),
                        height: 150,
                      ),
                    ],),

                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(left: 45.0),
                      child: Inter(text: 'JOIN FLOXY', size: 48, color: c.blackMain, fontWeight: f.extraBold),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 45.0),
                      child: Roboto(text: 'Change your life by take care your skin', size: 14, color: c.blackMain, fontWeight: f.semiBold),
                    ),
                    SizedBox(height: 26),
                    Padding(
                      padding: EdgeInsets.only(left:40, right: 40,bottom: 65),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Form(
                            key: _globalkey,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(height: 5),
                                      TextFormField(
                                          focusNode: _focusNodes[0],
                                          controller: _emailController,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                            errorText: validate ? null : errorText,
                                            hintText: 'Email Address',
                                            hintStyle: TextStyle(fontSize: 13, color: c.graySub2, fontWeight: f.medium),
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.only(right: 13, left: 20),
                                              child: Icon(
                                                  Icons.email, size: 25, color: _focusNodes[0].hasFocus ? c.greenMain : c.graySub2
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                              borderSide: BorderSide(color: c.graySub2.withOpacity(0.3), width: 2),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                              borderSide: BorderSide(color: c.greenMain, width: 2),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: c.redMain, width: 2),
                                              borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                            ),
                                            focusedErrorBorder: OutlineInputBorder(
                                              gapPadding: 6,
                                              borderSide: BorderSide(color: c.redMain, width: 2),
                                              borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                            ),
                                          )),
                                    ],
                                  ),
                                  SizedBox(height: 18),
                                  Column(
                                    children: [
                                      TextFormField(
                                          focusNode: _focusNodes[1],
                                          controller: _passwordController,
                                          obscureText: vis,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                            errorText: validate ? null: errorText,
                                            suffixIcon: Padding(
                                              padding: EdgeInsets.only(right: 10),
                                              child: IconButton(
                                                icon: Icon(vis ? Icons.visibility_off : Icons.visibility, size: 18, color: c.greySub),
                                                onPressed: () {
                                                  setState(() {
                                                    vis = !vis;
                                                  });
                                                },
                                                color: Colors.black,
                                              ),
                                            ),
                                            hintText: 'Password',
                                            hintStyle: TextStyle(fontSize: 14, color: c.graySub2, fontWeight: f.medium),
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.only(right: 13, left: 20),
                                              child: Icon(
                                                  Icons.lock_rounded, size: 25, color: _focusNodes[1].hasFocus ? c.greenMain : c.graySub2
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                              borderSide: BorderSide(color: c.graySub2.withOpacity(0.3), width: 2),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                              borderSide: BorderSide(color: c.greenMain, width: 2),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: c.redMain, width: 2),
                                              borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                            ),
                                            focusedErrorBorder: OutlineInputBorder(
                                              gapPadding: 6,
                                              borderSide: BorderSide(color: c.redMain, width: 2),
                                              borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                            ),
                                          )),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(height: 30),
                                      Container(
                                        width: 300,
                                        height: 50,
                                        child: GestureDetector(
                                          onTap: () async {
                                            setState(() {
                                              circular=true;
                                            });
                                            Map<String, String> data = {
                                              "email": _emailController.text,
                                              "password": _passwordController.text,
                                            };
                                            var response = await networkHandler.post("/user/login", data);

                                            if(response.statusCode==200|| response.statusCode==201){
                                              Map<String, dynamic> output = json.decode(response.body);
                                              print(output["msg"]);
                                              await storage.write(key: "token", value: output["token"]);
                                              setState(() {
                                                validate=true;
                                                circular=false;
                                              });
                                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute
                                                (builder: (context)=>LoadingScreenWeb()), (route) => false);
                                            }else{
                                              String output = json.decode(response.body);
                                              setState(() {
                                                validate=false;
                                                errorText= output;
                                                circular=false;
                                              });
                                            }


                                          },
                                          child: GreenButton(
                                            text: 'LOGIN',
                                            size: 16,
                                            color: c.textWhite,
                                            height: 60,
                                          ),
                                        ),
                                      )],
                                  )

                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:18.0,bottom: 18.0),
                            child: Row(
                              children: [
                                Expanded(child: Divider()),
                                Padding(
                                  padding: const EdgeInsets.only(left:8.0,right: 8.0),
                                  child: Inter(text: 'OR', size: 12, color: c.graySub2, fontWeight: f.semiBold),
                                ),
                                Expanded(child: Divider()),

                              ],
                            ),
                          ),
                          // SizedBox(height: 26),
                          GestureDetector(
                            onTap: () async {
                              final provider = Provider.of<GoogleSignInProvider>(context, listen:false);
                              await provider.googleLogin();
                              // print(user.email);
                              // print(user.uid);

                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute
                                (builder: (context)=>GoogleStream()), (route) => false);



                            },
                            child: Container(
                                height: 45,
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
                                        height: 18,
                                      ),
                                    ),
                                    Flexible(
                                      child: Inter(
                                          text: 'Continue with Google',
                                          size: 12,
                                          color: Color(0xFF484848),
                                          fontWeight: f.bold
                                      ),
                                    )
                                  ],
                                )
                            ),
                          ),
                          SizedBox(height: 15),
                          GestureDetector(
                            onTap: () async {
                              final LoginResult result = await FacebookAuth.instance.login(permissions: ['email', 'public_profile', 'user_birthday', 'user_friends', 'user_gender', 'user_link'],); // by default we request the email and the public profile
                              print("result: $result");
// or FacebookAuth.i.login()
                              if (result.status == LoginStatus.success) {
                                // you are logged
                                final AccessToken accessToken = result.accessToken!;
                                final userData = await FacebookAuth.i.getUserData(
                                  fields: "name,email,picture.width(200),birthday,friends,gender,link",
                                );
                                print(userData);
                                print(accessToken.token);
                                final credential = FacebookAuthProvider.credential(accessToken.token);
                                await FirebaseAuth.instance.signInWithCredential(credential);
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => GoogleStream()));

                                // print("hi");
                                // print(accessToken);
                                // print(result);
                              } else {
                                print(result.status);
                                print(result.message);
                              }
                            },
                            child: Container(
                                height: 45,
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
                                        child: Icon(Boxicons.bxl_facebook_circle, size: 24,color: Color(0xFF156ACF))),
                                    Flexible(
                                      child: Inter(
                                          text: 'Continue with Facebook',
                                          size: 12,
                                          color: Color(0xFF484848),
                                          fontWeight: f.bold
                                      ),
                                    )
                                  ],
                                )
                            ),
                          ),
                          SizedBox(height: 40),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateWithEmail()));
                            },
                            child: RichText(
                              text: TextSpan(
                                style: GoogleFonts.roboto(fontSize: 12),
                                children: [
                                  TextSpan(text: "Don't have an account?"),
                                  TextSpan(text: " Create account", style: GoogleFonts.roboto(fontSize: 12,fontWeight: FontWeight.w600,color: c.greenMain)),

                                ]
                              ),

                            ),
                            // child: Container(child: Roboto(
                            //   text: "Don't have an account? Create account",
                            //   fontWeight: f.medium,
                            //   color: c.blackSub,
                            //   size: 12,
                            // )),
                          ),


                        ],
                      ),
                    )
                  ],
                ),
              )
            ),

          ],
        ),
      ),
    )
        :Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
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
        child: GestureDetector(
          onTap: () async {
            final LoginResult result = await FacebookAuth.instance.login(permissions: ['email', 'public_profile', 'user_birthday', 'user_friends', 'user_gender', 'user_link'],); // by default we request the email and the public profile
            print("result: $result");
// or FacebookAuth.i.login()
            if (result.status == LoginStatus.success) {
              // you are logged
              final AccessToken accessToken = result.accessToken!;
              final userData = await FacebookAuth.i.getUserData(
                fields: "name,email,picture.width(200),birthday,friends,gender,link",
              );
              print(userData);
              print(accessToken.token);
              final credential = FacebookAuthProvider.credential(accessToken.token);
              await FirebaseAuth.instance.signInWithCredential(credential);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => GoogleStream()));

              // print("hi");
              // print(accessToken);
              // print(result);
            } else {
              print(result.status);
              print(result.message);
            }
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

