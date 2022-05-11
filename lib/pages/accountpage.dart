import 'package:Florxy/pages/aliaspage.dart';
import 'package:Florxy/pages/personalinformation.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../Model/profileModel.dart';
import '../NetworkHandler.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  bool circular = false;
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();
  ProfileModel profileModel = ProfileModel(
    id: '',
    username: '',
    fullname: '',
    DOB: '',
    professor: '',
    influencer: '',
    bio: '',
    img: '',
    pinned: '',
    notification: [],
    saveproduct: [],
    favorite: [],
    listfollower: [],
    listfollowing: [],
  );


  @override
  void initState() {
    _focusNodes.forEach((node) {
      node.addListener(() {
        setState(() {});
      });
    });
    super.initState();
    fetchData();
  }

  @override
  void fetchData() async{
    var response = await networkHandler.get("/profile/getData");
    setState(() {
      profileModel = ProfileModel.fromJson(response["data"]);
      circular = false;
    });
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
                          text: "Account",
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
                padding: const EdgeInsets.only(top: 20,right: 30,left: 30),
                children: <Widget>[
                    Column(
                    children: [
                        SizedBox(height: 10,),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => PersonalInformation()));
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
                                      text: "Personal information",
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
                      if(profileModel.professor == "" || profileModel.influencer == "" )SizedBox(height: 20,),
                      if(profileModel.professor == "" || profileModel.influencer == "" )InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AliasPage()));
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
                                      text: "Add new alias account",
                                      size: 16,
                                      color: c.blueMain,
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
                      if(profileModel.professor != "" || profileModel.influencer != "" )SizedBox(height: 20,),
                      if(profileModel.professor != "" || profileModel.influencer != "" )InkWell(
                        onTap: (){},
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
                                      text: "Delete alias account",
                                      size: 16,
                                      color: c.redMain,
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

  Widget SearchTextField() {
    return Column(
      children: [
        TextFormField(
            focusNode: _focusNodes[0],
            decoration: InputDecoration(
              filled: true,
              fillColor: c.greyLight,
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              hintText: 'Search in chat',
              hintStyle: TextStyle(
                  fontSize: 16, color: c.greyMain, fontWeight: f.medium),
              prefixIcon: Padding(
                padding: EdgeInsets.only(right: 13, left: 20),
                child: Icon(Icons.search_rounded,
                    size: 25,
                    color: _focusNodes[0].hasFocus ? c.greenMain : c.greyMain),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                borderSide:
                BorderSide(color: c.graySub2.withOpacity(0), width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                borderSide: BorderSide(color: c.greenMain, width: 2),
              ),
            )),
        SizedBox(height: 15,),
        InkWell(
          onTap: (){print("Noti");},
          child: Padding(
            padding: const EdgeInsets.only(top: 10, right: 0,left: 0,bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.notifications_outlined,
                  color: c.blackMain,
                  size: 25.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Inter(
                      text: "Notification",
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
        InkWell(
          onTap: (){},
          child: Padding(
            padding: const EdgeInsets.only(top: 10, right: 0,left: 0,bottom: 10),

            child: Container(

              child:Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.lock_outline,
                    color: c.blackMain,
                    size: 25.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Inter(
                        text: "Privacy",
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
        InkWell(
          onTap: (){},
          child: Padding(
            padding: const EdgeInsets.only(top: 10, right: 0,left: 0,bottom: 10),


            child: Container(

              child:Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.security_rounded,
                    color: c.blackMain,
                    size: 22.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Inter(
                        text: "Security",
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
        InkWell(
          onTap: (){

          },
          child: Padding(
            padding: const EdgeInsets.only(top: 10, right: 0,left: 0,bottom: 10),


            child: Container(

              child:Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.account_circle_outlined,
                    color: c.blackMain,
                    size: 22.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 17),
                    child: Inter(
                        text: "Account",
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
        InkWell(
          onTap: (){},
          child: Padding(
            padding: const EdgeInsets.only(top: 10, right: 0,left: 0,bottom: 10),


            child: Container(

              child:Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.help_outline_rounded,
                    color: c.blackMain,
                    size: 23.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Inter(
                        text: "Help",
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
        InkWell(
          onTap: (){},
          child: Padding(
            padding: const EdgeInsets.only(top: 10, right: 0,left: 0,bottom: 10),


            child: Container(

              child:Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Boxicons.bx_data,
                    color: c.blackMain,
                    size: 23.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 13),
                    child: Inter(
                        text: "Data policy",
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
        InkWell(
          onTap: (){},
          child: Padding(
            padding: const EdgeInsets.only(top: 10, right: 0,left: 0,bottom: 10),


            child: Container(

              child:Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.checklist_outlined,
                    color: c.blackMain,
                    size: 23.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 13),
                    child: Inter(
                        text: "Terms of use",
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
        InkWell(
          onTap: (){},
          child: Padding(
            padding: const EdgeInsets.only(top: 10, right: 0,left: 0,bottom: 10),

            child: Container(

              child:Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Boxicons.bx_book_heart,
                    color: c.blackMain,
                    size: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Inter(
                        text: "Open source libraries",
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
    );
  }


}
