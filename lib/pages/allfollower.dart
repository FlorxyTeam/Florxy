import 'package:Florxy/Model/profileModel.dart';
import 'package:Florxy/NetworkHandler.dart';
import 'package:Florxy/pages/anotherProfile.dart';
import 'package:Florxy/pages/followprofile.dart';
import 'package:Florxy/pages/navbar.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class allFollower extends StatefulWidget {
  String? another_username;
  allFollower({Key? key, this.another_username }) : super(key: key);

  @override
  _allFollowerState createState() => _allFollowerState();
}


class _allFollowerState extends State<allFollower> {
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
    // String? profile = await storage.read(key: "anotherprofile");
    // print(profile);
    var response = await networkHandler.get("/profile/getOtherData/" + widget.another_username! );

    setState(() {
      profileModel = ProfileModel.fromJson(response["data"]);
      data = profileModel.listfollower;
      print(data);
    });

  }


  @override
  Widget build(BuildContext context) {
    print(data);
    List staticData = data;
    return Scaffold(
      body: SafeArea(
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
                      text: "Followers",
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
              itemCount: profileModel.listfollower.length,
            ),
          ],
        ),
      ),
    );
  }

}

class Alias extends StatefulWidget {
  String? username;
  Alias({Key? key, this.username}) : super(key: key);

  @override
  _AliasState createState() => _AliasState();
}

class _AliasState extends State<Alias> {
  final storage = new FlutterSecureStorage();
  final networkHandler = NetworkHandler();
  String my_username='',yourfollow='';
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

  ProfileModel myprofileModel = ProfileModel(
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
    String? username = await storage.read(key: "username");
    var response = await networkHandler.get("/profile/getOtherData/" + widget.username!);
    var response2 = await networkHandler.get("/profile/getData");
    var followercheck = await networkHandler.get("/profile/followercheck/" + widget.username! + "/" + username!);
    setState(() {
      profileModel = ProfileModel.fromJson(response["data"]);
      myprofileModel = ProfileModel.fromJson(response2["data"]);
      my_username = username!;
    });
    if(followercheck['Status']){
      setState(() {
        yourfollow="Follow";
      });
    }
    else{
      setState(() {
        yourfollow="Following";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() async{
          await storage.write(key: "anotherfollowprofile", value: widget.username);
          String? myuseranme = await storage.read(key: "username");
          if(myuseranme == widget.username){
            print("same as fuck");
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Navbar(currentState: 4)));
          }
          else{
            print("not same as fuck");
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => anotherProfile( another_username: widget.username))).then((value) => fetchData());
          }

        });
      },
      child: Column(
        children: [
          ListTile(
              title: Align(
                  alignment: Alignment.centerLeft,
                  child: Poppins(text: profileModel.fullname, size: 14, color: c.blackMain, fontWeight: f.semiBold)
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Inter(text: widget.username!, size: 12, color: c.textUsername, fontWeight: f.medium,),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      (profileModel.professor=="")?
                      Container():Row(
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 7, left: 7, top: 4, bottom: 4),
                              child: Inter(
                                  text: profileModel.professor,
                                  size: 8,
                                  color: Colors.white,
                                  fontWeight: f.semiBold),
                            ),
                            decoration: BoxDecoration(
                                color: c.greenMain,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          SizedBox( width: 5 ),
                        ],
                      ),
                      (profileModel.influencer=="")?
                      Container():Container(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 5, left: 5, top: 2, bottom: 2),
                          child: Inter(
                              text: profileModel.influencer,
                              size: 8,
                              color: c.blueMain,
                              fontWeight: f.bold),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: c.blueMain,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ],
                  )
                ],
              ),
              leading: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFE5E5E5)
                  ),
                  width: 55,
                  height: 55,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(imageUrl: profileModel.img,fit: BoxFit.cover,errorWidget: (context, url, error) => Container(),),
                  )
              ),
              trailing: my_username != widget.username ?
              (yourfollow == "Follow")?GestureDetector(
                child: Container(
                  width: 90,
                  height: 35,
                  child: Center(
                    child: Inter(
                      text: "Follow",
                      color: c.greenMain,
                      size: 12.5,
                      fontWeight: f.semiBold,
                    ),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: c.greenMain,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(9)),
                ),
                onTap: () async{
                  Map<String, String> data = {
                    "img":profileModel.img,
                    "fullname":profileModel.fullname.toString(),
                    "myimg":myprofileModel.img,
                    "myfullname":myprofileModel.fullname.toString(),
                  };
                  await networkHandler.patch("/profile/addfollower/${profileModel.username}/${myprofileModel.username}",data);
                  setState(() {
                    yourfollow="Following";
                  });
                },
              ):
              GestureDetector(
                child: Container(
                  width: 90,
                  height: 35,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Inter(
                          text: "Following",
                          color: Colors.white,
                          size: 12.5,
                          fontWeight: f.semiBold,
                        ),
                        SizedBox(width: 2),
                        Icon(FeatherIcons.check, size: 12, color: Colors.white)
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: c.greenMain,
                      borderRadius: BorderRadius.circular(9)),
                ),
                onTap: () async{
                  Map<String, String> data = {
                  };
                  await networkHandler.patch("/profile/unfollower/${profileModel.username}/${myprofileModel.username}",data);
                  setState(() {
                    yourfollow="Follow";
                  });
                },
              ):null
          ),
          SizedBox(height: 14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              color: c.greyMain,
              thickness: 0.5,
              height: 0,
            ),
          ),
          SizedBox(height: 10)
        ],
      ),
    );
  }
}


