import 'package:Florxy/pages/covid19.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({Key? key}) : super(key: key);

  @override
  _HelpCenterState createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  String title = "";

  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
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
              child: Stack(
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back_ios_new_rounded),
                      color: c.blackMain,
                      iconSize: 30,
                      onPressed: () => Navigator.of(context).pop()),

                  Padding(
                    padding: const EdgeInsets.only(top: 13, left: 0 ),
                    child: Center(
                      child: Inter(
                          text: "Help Center",
                          size: 18,
                          color: c.blackMain,
                          fontWeight: f.semiBold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        // resizeToAvoidBottomInset: true,

        child: Container(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Form(
              child: ListView(
                padding: const EdgeInsets.only(top: 20,right: 30,left: 30),
                children: <Widget>[
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage('assets/img/icon2.png'),
                            height: 40,
                          ),
                          SizedBox(width: 20,),
                          Align(
                              alignment: Alignment.topCenter,
                              child:Text(
                                "Help Center",
                                style: TextStyle(fontSize: 20,height: 1.5,fontWeight: f.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(
                        color: c.greyMain,
                        thickness: 0.5,
                        height: 0,
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: (){},
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, right: 0,left: 0,bottom: 10),
                          child: Container(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child:Inter(text: "Hi, how can we help you?", size: 20, color: c.blackMain, fontWeight: f.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: (){},
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, right: 0,left: 0,bottom: 10),
                          child: Container(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child:Inter(text: "What's New", size: 15, color: c.blackMain, fontWeight: f.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: (){
                          setState(() {
                            title = "What can I find in the COVID-19 Information Center on FROXLY?";
                          });
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Covid19(title : title)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, right: 0,left: 0,bottom: 10),
                          child: Container(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child:Inter(text: "What can I find in the COVID-19 Information Center on FROXLY?", size: 15, color: Colors.indigo.shade700, fontWeight: f.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: (){
                          setState(() {
                            title = "How can I check my Account Status on FLORXY?";
                          });
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Covid19(title : title)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, right: 0,left: 0,bottom: 10),
                          child: Container(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child:Inter(text: "How can I check my Account Status on FLORXY?", size: 15, color: Colors.indigo.shade700, fontWeight: f.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: (){
                          setState(() {
                            title = "Birthdays on FLORXY";
                          });
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Covid19(title : title)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, right: 0,left: 0,bottom: 10),
                          child: Container(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child:Inter(text: "Birthdays on FLORXY", size: 15, color: Colors.indigo.shade700, fontWeight: f.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: (){
                          setState(() {
                            title = "How do I restore content I've deleted from my FLORXY account?";
                          });
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Covid19(title : title)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, right: 0,left: 0,bottom: 10),
                          child: Container(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child:Inter(text: "How do I restore content I've deleted from my FLORXY account?", size: 15, color: Colors.indigo.shade700, fontWeight: f.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: (){
                          setState(() {
                            title = "Reels";
                          });
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Covid19(title : title)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, right: 0,left: 0,bottom: 10),
                          child: Container(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Inter(text: "Reels", size: 15, color: Colors.indigo.shade700, fontWeight: f.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}