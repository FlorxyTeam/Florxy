import 'package:Florxy/Model/profileModel.dart';
import 'package:Florxy/NetworkHandler.dart';
import 'package:Florxy/pages/followprofile.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:Florxy/pages/navbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../Model/aliasColorModel.dart';
import '../widgets/font.dart';
import 'allfollower.dart';
import 'anotherProfile.dart';
class allFollowing extends StatefulWidget {
  String? another_username;
  allFollowing({Key? key, this.another_username}) : super(key: key);

  @override
  _allFollowingState createState() => _allFollowingState();
}


class _allFollowingState extends State<allFollowing> {
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
    fetchData();
    // TODO: implement initState
    super.initState();
  }

  void fetchData() async {
    // print(profile);
    var response = await networkHandler.get("/profile/getOtherData/" + widget.another_username!);
    // print("widget.another_username");
    // print(widget.another_username);
    setState(() {
      profileModel = ProfileModel.fromJson(response["data"]);
      data = profileModel.listfollowing;
      // print(data);
    });

  }


  @override
  Widget build(BuildContext context) {
    // print(data);
    List staticData = data;
    return profileModel.listfollowing.length != 0 ? Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              top: Theme.of(context).platform == TargetPlatform.android
                  ? 18.5
                  : 0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: Icon(FeatherIcons.chevronLeft),
                        iconSize: 34,
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        color: Colors.black,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Center(
                      child: Poppins(
                        text: "Following",
                        size: 18,
                        color: c.blackMain,
                        fontWeight: f.semiBold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (builder, index) {
                  Map data = staticData[index];
                  return Alias( username: "${data['username']}" );
                },
                itemCount: profileModel.listfollowing.length,
              ),
            ],
          ),
        ),
      ),
    ):Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(26),
            )),
        leading: Padding(
          padding: EdgeInsets.only(top: Theme.of(context).platform==TargetPlatform.android?17.5:0, left: 13),
          child: IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            icon: Icon(FeatherIcons.chevronLeft),
            iconSize: 34,
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Poppins(
          text: profileModel.fullname,
          size: 18,
          color: c.blackMain,
          fontWeight: f.semiBold,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FeatherIcons.userPlus, size:66, color: c.blackSub),
            SizedBox(height: 8),
            Inter(text: "People You Follow", size: 20, color: c.blackSub, fontWeight: f.bold),
            SizedBox(height: 10),
            Inter(text: "You'll see all the people you following here.", size: 13, color: c.greySub, fontWeight: f.semiBold)
          ],
        ),
      ),
    );
  }

}
