import 'package:Florxy/pages/reportproblem.dart';
import 'package:Florxy/pages/supportrequests.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/pages/navbar.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/fontWeight.dart';

import 'helpcenter.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
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

    final Size size = MediaQuery.of(context).size;

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
                          text: "Help",
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
        child: Center(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Form(
              child: ListView(
                padding: const EdgeInsets.only(top: 20,right: 30,left: 30),
                children: <Widget>[
                  Column(
                    children: [
                      SizedBox(height: 10,),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ReportProblem()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, right: 0,left: 0,bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Inter(
                                    text: "Report a Problem",
                                    size: 17,
                                    color: c.blackMain,
                                    fontWeight: f.medium),
                              ),
                              Expanded(child: Container(),),
                              Icon(Icons.arrow_forward_ios_outlined,
                                  size: 18, color: c.greyMain),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => HelpCenter()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, right: 0,left: 0,bottom: 10),
                          child: Container(
                            child:Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Inter(
                                      text: "Help Center",
                                      size: 16,
                                      color: c.blackMain,
                                      fontWeight: f.medium),
                                ),
                                Expanded(child: Container()),
                                Icon(Icons.arrow_forward_ios_outlined,
                                    size: 18, color: c.greyMain),
                              ],
                            ) ,
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SupportRequests()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, right: 0,left: 0,bottom: 10),
                          child: Container(
                            child:Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Inter(
                                      text: "Support Requests",
                                      size: 16,
                                      color: c.blackMain,
                                      fontWeight: f.medium),
                                ),
                                Expanded(child: Container()),
                                Icon(Icons.arrow_forward_ios_outlined,
                                    size: 18, color: c.greyMain),
                              ],
                            ) ,
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
