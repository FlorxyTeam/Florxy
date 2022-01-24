import 'dart:convert';

import 'package:Florxy/NetworkHandler.dart';
import 'package:Florxy/pages/createaccount_withemail.dart';
import 'package:Florxy/pages/lastthingspage.dart';
import 'package:Florxy/pages/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginFrank extends StatefulWidget {
  const LoginFrank({Key? key}) : super(key: key);

  @override
  _LoginFrankState createState() => _LoginFrankState();
}

class _LoginFrankState extends State<LoginFrank> {
  bool vis = true;
  final _globalkey = GlobalKey<FormState>();
  NetworkHandler networkHandler = NetworkHandler();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String? errorText;
  bool validate = false;
  bool circular = false;
  final storage = new FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.green,
            ],
            begin: FractionalOffset(0.0, 1.0),
            end: FractionalOffset(0.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.repeated,
          ),
        ),
        child: Form(
          key: _globalkey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                EmailTextField("Email"),
                SizedBox(height: 20,),
                PasswordTextField("Password"),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Forgot Password ?',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                    SizedBox(width: 20,),
                    InkWell(
                        onTap: (){
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) =>
                                  CreateWithEmail(),));
                        },
                        child: Text('New User ?',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold))),
                  ],),
                const SizedBox(
                  height: 50,
                ),
                InkWell(
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
                  child:Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff00A86B),
                    ),
                    child: Center(
                      child: circular
                          ? CircularProgressIndicator()
                          : Text(
                        'Sign In',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget EmailTextField(String label) {
    return Column(
      children: [
        Text(label),
        TextFormField(
          controller: _emailController,
          decoration: InputDecoration(
            errorText: validate ? null : errorText,
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget PasswordTextField(String label) {
    return Column(
      children: [
        Text(label),
        TextFormField(
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
            helperStyle: TextStyle(fontSize: 16),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
