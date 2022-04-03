import 'package:Florxy/Model/profileModel.dart';
import 'package:Florxy/widgets/SearchMentionPostWidget.dart';
import 'package:Florxy/widgets/chatWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../NetworkHandler.dart';
import 'ViewPostPage.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List data = [];
  final storage = new FlutterSecureStorage();
  final networkHandler = NetworkHandler();
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
  void initState(){
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var response = await networkHandler.get("/profile/getData");
    setState(() {
      profileModel = ProfileModel.fromJson(response["data"]);
      data = profileModel.listfollowing;
    });

  }

  @override
  Widget build(BuildContext context) {
    List staticData = data;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Theme.of(context).platform==TargetPlatform.android?75:66.0),
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
            backgroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(26),
                )),
            titleSpacing: 0,
            title: Padding(
              padding: EdgeInsets.only(top: Theme.of(context).platform==TargetPlatform.android?18.5:0,left: 0, right: 15),
              child: SearchMentionPost(
                text: '',
                hintText: "Search in chat",
                onChanged: (String value) {  },
              ),
            ),
            leading: Padding(
              padding: EdgeInsets.only(top: Theme.of(context).platform==TargetPlatform.android?17.5:0, left: 0),
              child: IconButton(
                icon: Icon(FeatherIcons.chevronLeft),
                iconSize: 34,
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                color: Colors.black,
                onPressed: () {},
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: profileModel.listfollowing.length,
          itemBuilder: (context,index){
          Map data = staticData[index];
            return Chat(
              username: "${data['username']}",
              currentMessage: "${data['currentMessage']}",
            );
        }
      ),
    );
  }
}
