import 'package:Florxy/Model/chatModel.dart';
import 'package:Florxy/widgets/SearchMentionPostWidget.dart';
import 'package:Florxy/widgets/chatWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/fontWeight.dart';

import 'ViewPostPage.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
      username: 'bababaconnnn',
      time: 'Send 6h',
      currentMessage: 'ทำไรอยู่ววว'
    ),
    ChatModel(
        username: 'sadsad',
        time: 'Yesterday',
        currentMessage: 'เมินกันได้ลงคอนะ;-;'
    )
  ];
  @override
  Widget build(BuildContext context) {
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
            // actions: [
            //   Padding(
            //     padding: EdgeInsets.only(top: Theme.of(context).platform==TargetPlatform.android?17.5:0, right: 13),
            //     child: IconButton(
            //       icon: Icon(FeatherIcons.send),
            //       iconSize: 25,
            //       color: Colors.black,
            //       onPressed: () {
            //         Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewPost()));
            //       },
            //     ),
            //   ),
            // ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context,index)=>Chat( chatModel: chats[index] )
      ),
    );
  }
}
