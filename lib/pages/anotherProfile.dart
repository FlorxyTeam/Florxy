import 'package:Florxy/NetworkHandler.dart';
import 'package:Florxy/pages/allfollower.dart';
import 'package:Florxy/pages/allfollowing.dart';
import 'package:Florxy/pages/lastthingspage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:Florxy/Model/profileModel.dart';
import 'package:Florxy/Model/profileModel.dart';
import 'package:Florxy/NetworkHandler.dart';
import 'package:Florxy/widgets/Modalsetting.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/pages/FavPost.dart';
import 'package:Florxy/pages/PostReply.dart';
import 'package:Florxy/pages/savedPro.dart';
import 'package:flutter/services.dart';

class anotherProfile extends StatefulWidget {
  const anotherProfile({Key? key}) : super(key: key);

  @override
  _anotherProfileState createState() => _anotherProfileState();
}

class _anotherProfileState extends State<anotherProfile> {

  final storage = new FlutterSecureStorage();
  final networkHandler = NetworkHandler();
  String? anotherUsername;
  String? yourfollow = "";
  int itfollower = 0;
  int itfollowing = 0;
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

  void deleteData() async{
    await storage.delete(key: "anotherUsername");
  }

  @override
  void dispose() {
    print('delete');
    deleteData();
  }

  void fetchData() async {
    String? profile = await storage.read(key: "anotherprofile");
    print(profile);
    var response = await networkHandler.get("/profile/getOtherData/$profile");
    var response2 = await networkHandler.get("/profile/getData");
    anotherUsername = response['data']['username'];
    await storage.write(key: "anotherUsername", value: anotherUsername);

    setState(() {

      profileModel = ProfileModel.fromJson(response["data"]);
      myprofileModel = ProfileModel.fromJson(response2["data"]);
      itfollower = profileModel.listfollower.length;
      itfollowing= profileModel.listfollowing.length;
    });
    var followercheck = await networkHandler.get("/profile/followercheck/${profileModel.username}/${myprofileModel.username}");
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
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
    length: 3,
    child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                  delegate:
                      SliverChildListDelegate([profileHeaderWidget(context)]))
            ];
          },
          body: Container(
            decoration: BoxDecoration(
                color: c.textWhite,
                border: Border(
                  top: BorderSide(
                      width: 1, color: c.greyMain.withOpacity(0.5)),
                )),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 7, right: 7),
                  child: Container(
                    height: 25,
                    color: c.textWhite,
                    child: TabBar(
                      labelColor: c.greenMain,
                      unselectedLabelColor: c.greyMain,
                      indicator: BoxDecoration(
                        color: c.greenLight1.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      tabs: [
                        Tab(
                          child: Inter_1(
                              text: "Post and replies",
                              size: 11.85,
                              fontWeight: f.bold),
                        ),
                        Tab(
                          child: Inter_1(
                              text: "Favorite post",
                              size: 11.85,
                              fontWeight: f.bold),
                        ),
                        Tab(
                          child: Inter_1(
                              text: "Saved Product",
                              size: 11.85,
                              fontWeight: f.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: TabBarView(
                  children: [
                    AnotherPostReply( username: profileModel.username ),
                    FavPost( idFavPost : profileModel.id ),
                    SavedPro(),
                  ],
                ))
              ],
            ),
          )),
        ),
      ),
    );
  }

  Widget profileHeaderWidget(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      color: c.textWhite,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 44,
                  backgroundColor: Colors.orange,
                  backgroundImage:
                  NetworkImage(profileModel.img),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Poppins(
                                text: profileModel.fullname,
                                size: 20,
                                color: c.blackMain,
                                fontWeight: f.semiBold,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 21, top: 5, bottom: 5),
                      child: Row(
                        children: [
                          GestureDetector(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Poppins(
                                    text: itfollower.toString(),
                                    size: 18,
                                    color: c.blackMain,
                                    fontWeight: f.semiBold),
                                Poppins(
                                    text: "Followers",
                                    size: 14,
                                    color: c.greyMain,
                                    fontWeight: f.semiBold),
                              ],
                            ),
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => allFollower()));
                            },
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          GestureDetector(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Poppins(
                                    text: itfollowing.toString(),
                                    size: 18,
                                    color: c.blackMain,
                                    fontWeight: f.semiBold),
                                Poppins(
                                    text: "Following",
                                    size: 14,
                                    color: c.greyMain,
                                    fontWeight: f.semiBold),
                              ],
                            ),
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => allFollowing()));
                            },
                          ),
                          SizedBox(
                            width: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 17,
                ),
                Expanded(
                  child: Column(
                    verticalDirection: VerticalDirection.down,
                    children: [
                      IconButton(
                        onPressed: () {
                          ModalBottomSheet.Dialog_Settings(
                              context, profileModel.username);
                        },
                        icon: Icon(Boxicons.bx_dots_vertical_rounded),
                      ),
                      SizedBox(
                        height: 49,
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      child: Inter(
                          text: "@" + profileModel.username,
                          size: 14,
                          color: c.blackMain,
                          fontWeight: f.semiBold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    (profileModel.professor=="")?
                    Container():Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 7, left: 7, top: 4, bottom: 4),
                        child: Inter(
                            text: profileModel.professor,
                            size: 11,
                            color: Colors.white,
                            fontWeight: f.semiBold),
                      ),
                      decoration: BoxDecoration(
                          color: c.greenMain,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    (profileModel.influencer=="")?
                    Container():Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 5, left: 5, top: 2, bottom: 2),
                        child: Inter(
                            text: profileModel.influencer,
                            size: 11,
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
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 50,
                    child: Inter(
                        text: profileModel.bio,
                        size: 13,
                        color: c.greyMain,
                        fontWeight: f.medium),
                  ),
                ],
              ),
            ),
            Row(children: [
              Icon(
                Icons.cake_outlined,
                color: c.greyMain,
                size: 18.0,
              ),
              SizedBox(
                width: 3,
              ),
              Inter(
                  text: profileModel.DOB,
                  size: 13,
                  color: c.greyMain,
                  fontWeight: f.medium),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                (yourfollow == "Follow")?
                FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    color: c.greenMain,
                    height: 40,
                    minWidth: 135,
                    onPressed: () async{
                      Map<String, String> data = {
                        "img":profileModel.img,
                        "fullname":profileModel.fullname.toString(),
                        "myimg":myprofileModel.img,
                        "myfullname":myprofileModel.fullname.toString(),
                      };
                      // Map<String, String> data2 = {
                      //   "targetusername":profileModel.username
                      // };
                      print(data);
                      var addfollow = await networkHandler
                          .patch("/profile/addfollower/${profileModel.username}/${myprofileModel.username}",data);
                      // await networkHandler.post("/profile/chat/" + myprofileModel.username, data2);
                      setState(() {
                        itfollower= itfollower+1;
                        yourfollow="Following";
                        print(profileModel.listfollower);
                      });
                    },
                    child: Inter(
                      text: yourfollow.toString(),
                      size: 13,
                      color: c.textWhite,
                      fontWeight: f.bold,
                    )
                ):FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    color: c.greenMain,
                    height: 40,
                    minWidth: 135,
                    onPressed: () async{
                      Map<String, String> data = {
                      };
                      var unfollow = await networkHandler
                          .patch("/profile/unfollower/${profileModel.username}/${myprofileModel.username}",data);
                      setState(() {
                        itfollower=itfollower-1;
                        yourfollow="Follow";
                        print(profileModel.listfollower);
                      });
                    },
                    child: Inter(
                      text: yourfollow.toString(),
                      size: 13,
                      color: c.textWhite,
                      fontWeight: f.bold,
                    )
                ),
                SizedBox(
                  width: 20,
                ),
                FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    color: c.greyMain,
                    height: 40,
                    minWidth: 135,
                    onPressed: () {},
                    child: Inter(
                      text: "Message",
                      size: 13,
                      color: c.textWhite,
                      fontWeight: f.bold,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //
  // Widget FollowButton() {
  //   return
  // }


}
