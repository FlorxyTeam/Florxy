import 'package:Florxy/pages/privilege3.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/pages/professoraccount.dart';
import 'package:Florxy/pages/creatoraccount.dart';

class ProfessorOrCreator extends StatefulWidget {
  const ProfessorOrCreator({Key? key}) : super(key: key);

  @override
  _ProfessorOrCreatorState createState() => _ProfessorOrCreatorState();
}

class _ProfessorOrCreatorState extends State<ProfessorOrCreator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            SafeArea(
              child: Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Stack(
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back_ios_new,),
                            iconSize: 30,
                            color: Colors.black,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          SizedBox(height: 18),
                          Padding(
                            padding: EdgeInsets.only(left: 0, right: 0, top: 100),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Poppins(
                                      text: 'What best describes you?',
                                      size: 17,
                                      color: c.blackSub,
                                      fontWeight: f.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 700),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 170),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Stack(
                                    children: <Widget>[
                                      Positioned(
                                        width: 400,
                                        height: 700,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Color(0xff32a060),
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.all(16.0),
                                          primary: Colors.white,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfessorAccount()));

                                          // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => ProfessorAccount()), (route) => false);
                                        },
                                        child: Column(
                                          children:[
                                            Text(
                                              'Professor account                                          ',
                                              style: TextStyle(fontSize: 15,height: 1.5,fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Lorem Ipsum is simply dummy text of the printing      ',
                                              style: TextStyle(fontSize: 11.5,height: 1.5),
                                            ),
                                            Text(
                                              "and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                              style: TextStyle(fontSize: 11.5,),
                                            ),
                                            Text(
                                              '',
                                              style: TextStyle(fontSize: 5,),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Stack(
                                    children: <Widget>[
                                      Positioned(
                                        width: 400,
                                        height: 700,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Color(0xffd2efb5),
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.all(16.0),
                                          primary: Color(0xff265b3c),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreatorAccount()));

                                          // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => CreatorAccount()), (route) => false);
                                        },
                                        child: Column(
                                          children:[
                                            Text(
                                              'Creator account                                                    ',
                                              style: TextStyle(fontSize: 15,height: 1.5,fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Lorem Ipsum is simply dummy text of the printing      ',
                                              style: TextStyle(fontSize: 11.5,height: 1.5),
                                            ),
                                            Text(
                                              "and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                              style: TextStyle(fontSize: 11.5,),
                                            ),
                                            Text(
                                              '',
                                              style: TextStyle(fontSize: 5,),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}

