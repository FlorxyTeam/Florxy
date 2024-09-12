
import 'package:Florxy/pages/EditProfile.dart';
import 'package:Florxy/pages/showproblem.dart';
import 'package:Florxy/pages/showreport.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../Model/profileModel.dart';
import '../NetworkHandler.dart';

class SupportRequests extends StatefulWidget {
  const SupportRequests({Key? key}) : super(key: key);

  @override
  _SupportRequestsState createState() => _SupportRequestsState();
}

class _SupportRequestsState extends State<SupportRequests> {
  List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];


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
                          text: "Support Request",
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

        child: Center(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Form(
              child: ListView(
                padding: const EdgeInsets.only(top: 10,right: 30,left: 30),
                children: <Widget>[
                  Column(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShowProblem()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, right: 0,left: 0,bottom: 10),
                          child: Container(
                            child:Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Inter(
                                    text: "Reports",
                                    size: 16,
                                    color: c.blackMain,
                                    fontWeight: f.medium
                                ),
                                Expanded(child: Container()),
                                Icon(Icons.arrow_forward_ios_outlined,
                                    size: 18, color: c.greyMain),
                              ],
                            ) ,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Divider(
                        color: c.greyMain,
                        thickness: 0.5,
                        height: 0,
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShowReport()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, right: 0,left: 0,bottom: 10),
                          child: Container(
                            child:Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Inter(
                                    text: "Violations",
                                    size: 16,
                                    color: c.blackMain,
                                    fontWeight: f.medium
                                ),
                                Expanded(child: Container()),
                                Icon(Icons.arrow_forward_ios_outlined,
                                    size: 18, color: c.greyMain),
                              ],
                            ) ,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Divider(
                        color: c.greyMain,
                        thickness: 0.5,
                        height: 0,
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