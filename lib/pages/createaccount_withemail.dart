import 'dart:convert';

import 'package:Florxy/NetworkHandler.dart';
import 'package:Florxy/pages/LoginPage.dart';
import 'package:Florxy/pages/welcomepage.dart';
import 'package:Florxy/widgets/button.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:boxicons/boxicons.dart';
import 'package:Florxy/pages/lastthingspage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CreateWithEmail extends StatefulWidget {
  const CreateWithEmail({Key? key}) : super(key: key);

  @override
  _CreateWithEmailState createState() => _CreateWithEmailState();
}

class _CreateWithEmailState extends State<CreateWithEmail> {
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
    _focusNodes.forEach((node) {
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
      body: Form(
        key: _globalkey,
        child: Stack(
          children: [
            SafeArea(
                child: Container(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
              child: Column(
                children: [
                  if(!isKeyboard) Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                        image: AssetImage('assets/img/icon2.png'),
                        height: 43,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute
                            (builder: (context)=>WelcomePage()), (route) => false);
                        },
                        icon: Icon(
                          Icons.close_rounded,
                          size: 36,
                        ),
                      ),
                    ],
                  ),
                  if(!isKeyboard) SizedBox(height: 25),
                  if(!isKeyboard) Align(
                    alignment: Alignment.topLeft,
                    child: Inter(
                      text: 'CREATE A NEW',
                      size: 25,
                      color: c.greenMain,
                      fontWeight: f.bold,
                    ),
                  ),
                  if(!isKeyboard) SizedBox(height: 10),
                  if(!isKeyboard) Align(
                    alignment: Alignment.topLeft,
                    child: Inter(
                      text: 'ACCOUNT',
                      size: 25,
                      color: c.greenMain,
                      fontWeight: f.bold,
                    ),
                  ),
                  if(isKeyboard) SizedBox(height: 20),
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
                        child: TextFormField(
                            controller: _emailController,
                            focusNode: _focusNodes[0],
                            decoration: InputDecoration(
                              errorText: validate ? null : errorText,
                              hintText: 'Email Address',
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: c.graySub2,
                                  fontWeight: f.medium),
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(right: 13, left: 20),
                                child: Icon(Icons.email,
                                    size: 25,
                                    color: _focusNodes[0].hasFocus
                                        ? c.greenMain
                                        : c.graySub2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(13.0)),
                                borderSide: BorderSide(
                                    color: c.graySub2.withOpacity(0), width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(13.0)),
                                borderSide:
                                    BorderSide(color: c.greenMain, width: 2),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: c.redMain, width: 2),
                                borderRadius: BorderRadius.all(Radius.circular(13.0)),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: c.redMain, width: 2),
                                borderRadius: BorderRadius.all(Radius.circular(13.0)),
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
                        child: TextFormField(
                          controller: _passwordController,
                            focusNode: _focusNodes[1],
                            validator: (value) {
                              if (value!.isEmpty) return "Password can't be empty";
                              if (value.length < 8) return "Password lenght must have >=8";
                              return null;
                            },
                            obscureText: vis,
                            decoration: InputDecoration(
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
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: c.graySub2,
                                  fontWeight: f.medium),
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(right: 13, left: 20),
                                child: Icon(Icons.lock_rounded,
                                    size: 25,
                                    color: _focusNodes[1].hasFocus
                                        ? c.greenMain
                                        : c.graySub2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                borderSide: BorderSide(
                                    color: c.graySub2.withOpacity(0), width: 2),
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
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: c.graySub2,
                                  fontWeight: f.medium),
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(right: 13, left: 20),
                                child: Icon(Icons.lock_rounded,
                                    size: 25,
                                    color: _focusNodes[2].hasFocus
                                        ? c.greenMain
                                        : c.graySub2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(13.0)),
                                borderSide: BorderSide(
                                    color: c.graySub2.withOpacity(0), width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(13.0)),
                                borderSide:
                                    BorderSide(color: c.greenMain, width: 2),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 26,
                      ),
                      if(!isKeyboard) Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                                    (route) => false);
                          },
                          child: Container(child: Roboto(
                            text: 'Already have an account? Login',
                            fontWeight: f.medium,
                            color: c.blackSub,
                            size: 12,
                          )),
                        ),
                      )
                    ],
                  ),
                  // if(!isKeyboard) Align(
                  //   alignment: Alignment.topRight,
                  //   child: InkWell(
                  //     onTap: () {
                  //       Navigator.of(context).pushAndRemoveUntil(
                  //           MaterialPageRoute(
                  //               builder: (context) => LoginPage()),
                  //               (route) => false);
                  //     },
                  //     child: Container(child: Roboto(
                  //       text: 'Already have an account? Login',
                  //       fontWeight: f.medium,
                  //       color: c.greyMain,
                  //       size: 11.5,
                  //     )),
                  //   ),
                  // )
                ],
              ),
            )),
            Positioned(
                bottom: 35,
                child: Column(
                  children: [
                    if(!isKeyboard) Center(
                        child: Roboto_Center(
                            text:
                                'By continuing, you agree to Florxy’s Terms & Conditions\nand Pricacy Policy.',
                            size: 11.5,
                            color: Color(0xFFAFC8A9),
                            fontWeight: f.medium)),
                    SizedBox(height: 15),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          circular = true;
                        });
                        await checkEmail();
                        if (_globalkey.currentState!.validate() && validate) {
                          Map<String, String> data = {
                            "email": _emailController.text,
                            "password": _passwordController.text,
                          };
                          var responseRegister =  await networkHandler.post("/user/register", data);

                          if(responseRegister.statusCode==200||
                              responseRegister.statusCode==201){
                            Map<String, String> data = {
                              "email": _emailController.text,
                              "password": _passwordController.text,
                            };
                            var response = await networkHandler.post("/user/login", data);

                            if(response.statusCode==200|| response.statusCode==201){
                              Map<String, dynamic> output = json.decode(response.body);
                              print(output["msg"]);
                              await storage.write(key: "token", value: output["token"]);
                              String? username = await storage.read(key: "username");
                              String? fullname = await storage.read(key: "fullname");

                              Map<String, String> data = {
                                "username": "$username",
                                "fullname": "$fullname",
                                "DOB": "SampleDOB",
                              };
                              var response2 = await networkHandler.post("/profile/add", data);
                              print(response2);
                              setState(() {
                                validate=true;
                                circular=false;
                              });
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute
                                (builder: (context)=>LastThingPage()), (route) => false);
                            }else{
                              Scaffold.of(context).showSnackBar(
                                  SnackBar(content: Text("Network Error"))
                              );
                            }
                          }

                          print(data);
                          setState(() {
                            circular = false;
                          });
                        } else {
                          setState(() {
                            circular = false;
                          });
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: EdgeInsets.only(left: 45, right: 45),
                          child: circular
                              ? Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                child: Center(child: CircularProgressIndicator()),
                              )
                              :GestureDetector(
                            child: GreenButton(
                              text: 'CONTINUE',
                              size: 16,
                              color: c.textWhite,
                              height: 60,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  checkEmail() async {
    if (_emailController.text.isEmpty) {
      setState(() {
        // circular=false;
        validate = false;
        errorText = "Email can't be empty!";
      });
    } else {
      print("/user/checkemail/${_emailController.text}");
      var response =
          await networkHandler.get("/user/checkemail/${_emailController.text}");
      print(_emailController.text);
      if (response['Status']) {
        setState(() {
          // circular=false;
          validate = false;
          errorText = "Email already taken!";
        });
      } else {
        setState(() {
          // circular=false;
          validate = true;
        });
      }
    }
  }
}
