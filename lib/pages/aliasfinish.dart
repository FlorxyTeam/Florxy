import 'package:Florxy/NetworkHandler.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/button.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/pages/privilege3.dart';
import 'package:Florxy/pages/EditProfile.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:getwidget/components/button/gf_button.dart';

import 'navbar.dart';

class AliasFinish extends StatefulWidget {
  const AliasFinish({Key? key}) : super(key: key);

  @override
  _AliasFinishState createState() => _AliasFinishState();
}

class _AliasFinishState extends State<AliasFinish> {
  final storage = new FlutterSecureStorage();
  final networkHandler = NetworkHandler();

  @override
  Widget build(BuildContext context) {

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
                      padding: EdgeInsets.only(left: 30, right: 20, top: 20),
                      child :
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(
                            image: AssetImage('assets/img/icon2.png'),
                            height: 43,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Inter(
                        text: '     FINISH!',
                        size: 24,
                        color: c.greenMain,
                        fontWeight: f.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left:30, right: 30, top: 10),
                      child: Column(
                        children:[
                          Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                            style: TextStyle(fontSize: 11.5,),
                          ),
                          Text(
                            '',
                            style: TextStyle(fontSize: 5,),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50,),
                    Padding(
                        padding: EdgeInsets.only(left: 30, right: 30, top: 0),
                        child : Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: c.blackMain,
                              size: 6,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "  Lorem Ipsum is simply dummy text of the printing and ",
                                style: TextStyle(fontSize: 11.5,),
                              ),
                            ),
                          ],
                        ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 36, right: 30, top: 0),
                      child :
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "  typesetting.",
                          style: TextStyle(fontSize: 11.5,),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: EdgeInsets.only(left: 30, right: 30, top: 0),
                      child : Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: c.blackMain,
                            size: 6,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "  Lorem Ipsum is simply dummy.",
                              style: TextStyle(fontSize: 11.5,),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: EdgeInsets.only(left: 30, right: 30, top: 0),
                      child : Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: c.blackMain,
                            size: 6,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "  Lorem Ipsum is simply dummy text of the printing and ",
                              style: TextStyle(fontSize: 11.5,),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 36, right: 0, top: 0),
                      child :
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "  typesetting. Lorem Ipsum has been the industry's",
                          style: TextStyle(fontSize: 11.5,),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 36, right: 0, top: 0),
                      child :
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "  standard dummy text ever since the 1500s.",
                          style: TextStyle(fontSize: 11.5,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 15,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 0, right: 0, top: 0),
                      child : Row(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Poppins(
                                text: 'Lorem Ipsum is simply dummy text of the ',
                                size: 11,
                                color: c.blackSub,
                                fontWeight: f.medium),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Poppins(
                                text: 'Contact Us',
                                size: 11,
                                color: c.blackSub,
                                fontWeight: f.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.only(left: 40,right: 40),
                        child: GestureDetector(
                          onTap: () async{
                            String? aliasname = await storage.read(key: "professor");
                            String? myusername = await storage.read(key: "myusername");
                            String? linkimg = await storage.read(key: "requestimg-link-profess");
                            print('my link: '+linkimg.toString());
                            print("Your Alias of Professor: $aliasname");
                            print("$myusername");
                            Map<String, String> data = {
                              "professor":"$aliasname",
                              "img":"$linkimg",
                            };
                            print(data);
                            var addRequestprofessor = await networkHandler.post("/user/requestAlias/professor",data);
                            // var addprofessor = await networkHandler.patch("/profile/addprofessor/$myusername",data);
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Navbar(currentState: 4,)),
                                    (route) => false);
                          },
                          child: GreenButton(
                            text: 'Finish',
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