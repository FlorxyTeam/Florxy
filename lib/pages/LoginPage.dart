
import 'dart:convert';
import 'package:Florxy/widgets/button.dart';
import 'package:Florxy/NetworkHandler.dart';
import 'package:Florxy/pages/createaccount_withemail.dart';
import 'package:Florxy/pages/navbar.dart';
import 'package:Florxy/pages/welcomepage.dart';
import 'package:Florxy/widgets/button.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

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
                      if(!isKeyboard)Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(
                            image: AssetImage('assets/img/icon2.png'),
                            height: 43,
                          ),
                          IconButton(onPressed: () { Navigator.of(context).pop(); }, icon: Icon(Icons.close_rounded,size: 36,),
                          ),
                        ],
                      ),
                      if(!isKeyboard)SizedBox(height: 25),
                      if(!isKeyboard)Align(
                        alignment: Alignment.topLeft,
                        child: Inter(
                          text: 'LOGIN',
                          size: 28,
                          color: c.greenMain,
                          fontWeight: f.bold,
                        ),
                      ),
                      if(!isKeyboard)SizedBox(height: 10),
                      if(!isKeyboard)Align(
                        alignment: Alignment.topLeft,
                        child: Inter(
                          text: 'ACCOUNT',
                          size: 28,
                          color: c.greenMain,
                          fontWeight: f.bold,
                        ),
                      ),
                      if(isKeyboard)Padding(
                        padding: EdgeInsets.only(top: 60),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Image(
                                image: AssetImage('assets/img/icon2.png'),
                                height: 40,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Inter(
                                text: 'LOGIN ACCOUNT',
                                size: 26,
                                color: c.greenMain,
                                fontWeight: f.bold,
                              ),
                            )
                          ],
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
                            child: TextFormField(
                                focusNode: _focusNodes[0],
                                controller: _emailController,
                                decoration: InputDecoration(
                                  errorText: validate ? null : errorText,
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
                            child: TextFormField(
                                focusNode: _focusNodes[1],
                                controller: _passwordController,
                                obscureText: vis,
                                decoration: InputDecoration(
                                  errorText: validate ? null: errorText,
                                  suffixIcon: IconButton(
                                    icon: Icon(vis ? Icons.visibility_off : Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        vis = !vis;
                                      });
                                    },
                                    color: Colors.black,
                                  ),
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
                          SizedBox(height: 20,),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateWithEmail()));
                            },
                              child: Text('Create an account ?',style:
                                TextStyle(
                                  fontWeight: f.bold,
                                  fontSize: 12
                                ),)
                          ),
                        ],
                      ),
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
                                (builder: (context)=>Navbar()), (route) => false);
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
                      ),
                    )],
                )
            )
          ],
        ),
      ),
    );
  }
}
