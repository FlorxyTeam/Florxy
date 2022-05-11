import 'package:Florxy/pages/reportfinish.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'navbar.dart';

class ReportPage extends StatefulWidget {
  String? my_username, idpost;

  ReportPage({Key? key, this.my_username, this.idpost}) : super(key: key);

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  String Bad = "";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(77.0),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: c.shadow.withOpacity(0.32),
                  spreadRadius: -17,
                  blurRadius: 30,
                  offset: Offset(0, 6), // changes position of shadow
                ),
              ],
            ),
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(26),
                  )),
              title: Padding(
                padding: const EdgeInsets.only(top: 18.5, left: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.close_rounded,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    Poppins(
                        text: 'Report an issue',
                        size: 17,
                        color: c.blackSub,
                        fontWeight: f.bold
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute
                          (builder: (context)=>Navbar(currentState: 0)), (route) => false);
                      },
                      icon: Icon(
                        Icons.close_rounded,
                        size: 30,
                        color: c.blackMain,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Color(0xffF9F9F9),
        body: Stack(
          children: [
            SafeArea(
                child: Container(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                  child: Column(
                    children:[
                      Text(
                        'Help us understand the problem. What is going on with this post?',
                        style: TextStyle(fontSize: 16,height: 1.5,color: c.graySub2),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 0, right: 0, top: 20),
                        child: Divider(
                          height: 5.0,
                          color: c.greenSub2,
                        ),
                      ),
                    ],
                  ),
                )
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 100),
              child : ListView(
                children: [
                  ListTile(
                    title: Text('Harassment',style: TextStyle(fontSize: 14,)),
                    trailing: Icon(Icons.keyboard_arrow_right_sharp),
                    onTap: () {
                      Bad = "Harassment";
                      Navigator.push(context,MaterialPageRoute(builder: (context) => ReportFinish(
                          Bad : Bad,
                          my_username : widget.my_username,
                          idpost: widget.idpost,
                      )));
                    },
                  ),
                  ListTile(
                    title: Text('Nudity',style: TextStyle(fontSize: 14,)),
                    trailing: Icon(Icons.keyboard_arrow_right_sharp),
                    onTap: () {
                      Bad = "Nudity";
                      Navigator.push(context,MaterialPageRoute(builder: (context) => ReportFinish(
                        Bad : Bad,
                        my_username : widget.my_username,
                        idpost: widget.idpost,
                      )));
                    },
                  ),
                  ListTile(
                    title: Text('Spam',style: TextStyle(fontSize: 14,)),
                    trailing: Icon(Icons.keyboard_arrow_right_sharp),
                    onTap: () {
                      Bad = "Spam";
                      Navigator.push(context,MaterialPageRoute(builder: (context) => ReportFinish(
                        Bad : Bad,
                        my_username : widget.my_username,
                        idpost: widget.idpost,
                      )));
                    },
                  ),
                  ListTile(
                    title: Text('Hate Speech',style: TextStyle(fontSize: 14,)),
                    trailing: Icon(Icons.keyboard_arrow_right_sharp),
                    onTap: () {
                      Bad = "Hate Speech";
                      Navigator.push(context,MaterialPageRoute(builder: (context) => ReportFinish(
                        Bad : Bad,
                        my_username : widget.my_username,
                        idpost: widget.idpost,
                      )));
                    },
                  ),
                  ListTile(
                    title: Text('False Information',style: TextStyle(fontSize: 14,)),
                    trailing: Icon(Icons.keyboard_arrow_right_sharp),
                    onTap: () {
                      Bad = "False Information";
                      Navigator.push(context,MaterialPageRoute(builder: (context) => ReportFinish(
                        Bad : Bad,
                        my_username : widget.my_username,
                        idpost: widget.idpost,
                      )));
                    },
                  ),
                  ListTile(
                    title: Text('Terrorism',style: TextStyle(fontSize: 14,)),
                    trailing: Icon(Icons.keyboard_arrow_right_sharp),
                    onTap: () {
                      Bad = "Terrorism";
                      Navigator.push(context,MaterialPageRoute(builder: (context) => ReportFinish(
                        Bad : Bad,
                        my_username : widget.my_username,
                        idpost: widget.idpost,
                      )));
                    },
                  ),
                  ListTile(
                    title: Text('Something Else',style: TextStyle(fontSize: 14,)),
                    trailing: Icon(Icons.keyboard_arrow_right_sharp),
                    onTap: () {
                      Bad = "Something Else";
                      Navigator.push(context,MaterialPageRoute(builder: (context) => ReportFinish(
                        Bad : Bad,
                        my_username : widget.my_username,
                        idpost: widget.idpost,
                      )));
                    },
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}