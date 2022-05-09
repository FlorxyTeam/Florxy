import 'package:Florxy/Model/profileModel.dart';
import 'package:Florxy/pages/viewChat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../NetworkHandler.dart';
import 'font.dart';
import 'fontWeight.dart';

class Chat extends StatefulWidget {
  String username,currentMessage;
  Chat({Key? key, required this.username,required this.currentMessage}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final storage = new FlutterSecureStorage();
  final networkHandler = NetworkHandler();
  String fullname='',influencer='',professor='',myUsername='';

  ProfileModel profileModel = ProfileModel(
    DOB: '',
    img: '',
    influencer: '',
    fullname: '',
    follower: 0,
    following: 0,
    bio: '',
    email: '',
    professor: '',
    username: '',
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
    String? username = await storage.read(key: "username");
    var response = await networkHandler.get("/profile/getOtherData/" + widget.username);
    setState(() {
      profileModel = ProfileModel.fromJson(response["data"]);
      fullname = profileModel.fullname;
      influencer = profileModel.influencer;
      professor = profileModel.professor;
      myUsername = username!;
    });

  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewChatPage(
            fullname: fullname,
            username: widget.username,
            influencer: influencer,
            professor: professor,
            currentMessage: widget.currentMessage,
            myUsername: myUsername )));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.orange,
                // backgroundImage:
                // NetworkHandler().getImage(profileModel.email),
              ),
              title: Row(
                children: [
                  Poppins(
                    text: fullname,
                    fontWeight: f.semiBold,
                    size: 14,
                    color: Colors.black,
                  ),
                  SizedBox(width: 8),
                  Inter(text: '@'+widget.username, size: 12, color: c.textUsername, fontWeight: f.medium),
                ],
              ),
              subtitle: Inter(text: widget.currentMessage, size: 13, color: c.graySub2, fontWeight: f.medium),
              trailing: Inter(text: '13:54', size: 12, color: c.graySub2, fontWeight: f.medium),
            ),
            SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18),
              child: Divider(
                color: c.greyMain,
                thickness: 0.7,
                height: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
