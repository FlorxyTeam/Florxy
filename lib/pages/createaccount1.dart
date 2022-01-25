import 'package:Florxy/NetworkHandler.dart';
import 'package:Florxy/pages/createaccount2.dart';
import 'package:Florxy/pages/createaccount3.dart';
import 'package:Florxy/widgets/button.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class CreateAccount1 extends StatefulWidget {
  const CreateAccount1({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount1> {

  final _globalkey = GlobalKey<FormState>();
  NetworkHandler networkHandler = NetworkHandler();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _fullnameController = TextEditingController();
  String? errorfnText;
  String? errorunText;
  bool validate = false;
  bool circular = false;
  final storage = new FlutterSecureStorage();
  List<FocusNode> _focusNodes = [
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
                          focusNode: _focusNodes[0],
                          // onTap: _requestFocus,
                          controller: _fullnameController,
                          decoration: InputDecoration(
                            errorText: validate ? null : errorfnText,
                            border: OutlineInputBorder(),
                            labelText: 'Fullname',
                            hintText: 'Enter your fullname',
                            hintStyle: TextStyle(fontSize: 15, color: c.greyMain),
                            labelStyle: TextStyle(fontSize: 15, color: _focusNodes[0].hasFocus ? c.greenMain : c.greyMain),
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
                        child: TextFormField(
                          focusNode: _focusNodes[1],
                          controller: _usernameController,
                          decoration: InputDecoration(
                            errorText: validate ? null : errorunText,
                            border: OutlineInputBorder(),
                            labelText: 'Username',
                            hintText: 'Enter your username',
                            hintStyle: TextStyle(fontSize: 15, color: c.greyMain),
                            labelStyle: TextStyle(fontSize: 15, color: _focusNodes[1].hasFocus ? c.greenMain : c.greyMain),
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
                bottom: 50,
                child: Column(
                  children: [
                    if(!isKeyboard) Center(
                          child: Roboto_Center(text: 'By continuing, you agree to Florxy’s Terms & Conditions\nand Pricacy Policy.', size: 11.5, color: Color(0xFFAFC8A9), fontWeight: f.medium)
                        ),


                    SizedBox(height: 15),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.only(left: 40,right: 40),
                        child: GestureDetector(
                          onTap: () async{
                            setState(() {
                              circular = true;
                            });

                            await checkFullname();
                            if(validate==true){
                              await  checkUsername();
                              if(validate==true){
                              await storage.write(key: "username", value: _usernameController.text);
                              await storage.write(key: "fullname", value: _fullnameController.text);

                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateAccount2()));


                              setState(() {
                                circular = false;
                                });
                              }
                              else {
                                setState(() {
                                  circular = false;
                                });
                              }
                             }
                            else {
                              setState(() {
                                circular = false;
                              });
                            }
                          },
                          child: circular
                              ? Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Center(child: CircularProgressIndicator()),
                          )
                              :GreenButton(
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
          ),
        )
    );
  }

  checkUsername() async{
    if (_usernameController.text.isEmpty) {
      setState(() {
        // circular=false;
        validate = false;
        errorunText = "Username can't be empty!";
      });
    }
    else {
      print("/profile/checkusername/${_usernameController.text}");
      var response = await networkHandler.get("/profile/checkusername/${_usernameController.text}");
      print(_usernameController.text);
      if (response['Status']) {
        setState(() {
          // circular=false;
          validate = false;
          errorunText = "Username already taken!";
        });
      } else {
        setState(() {
          // circular=false;
          errorfnText = null;
          validate = true;
        });
      }
    }
  }

  checkFullname(){
    if (_fullnameController.text.isEmpty) {
      setState(() {
        // circular=false;
        validate = false;
        errorfnText = "Full name can't be empty!";
      });
    }
    else {
      print(_fullnameController.text);
      setState(() {
        // circular=false;
        errorfnText = null;
        validate = true;
      });
    }
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

