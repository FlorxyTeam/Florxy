import 'dart:async';
// import 'dart:ffi';

import 'package:Florxy/Model/postModel.dart';
import 'package:Florxy/Post/addPost.dart';
import 'package:Florxy/widgets/SearchMentionPostWidget.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/PostWidget.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';


import '../Model/profileModel.dart';
import '../NetworkHandler.dart';
import '../postProvider.dart';
import '../widgets/SearchPostWidget.dart';
import '../widgets/PostWidget.dart';

class ShowProblem extends StatefulWidget {
  const ShowProblem({Key? key}) : super(key: key);

  @override
  _ShowProblemState createState() => _ShowProblemState();
}
NetworkHandler networkHandler = NetworkHandler();



class _ShowProblemState extends State<ShowProblem> {
  bool circular = false;
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();
  final _globalkey = GlobalKey<FormState>();
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
                          text: "Reports",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Consumer<PostProvider>(
                builder: (context, model, _) => FutureBuilder(
                  future: model.fetchProblem(profileModel.username),
                  builder: (context, snapshot) => MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    removeBottom: true,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: model.problem?.length ?? 0,
                      itemBuilder: (context, int index) {
                        return model.problem?.length != 0 ? Problems(
                          username: model.problem![index]['username'],
                          postTime: model.problem![index]['updatedAt'].toString().substring(0, 10),
                          body: model.problem![index]['body'],
                          id: model.problem![index]['_id'],
                        ) : Container(
                          child: Align(
                            alignment: Alignment.topCenter,
                            child:Inter(text: "You Haven't Reported Anything", size: 20, color: c.blackMain, fontWeight: f.bold),
                          ),
                        );
                      },
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }

}