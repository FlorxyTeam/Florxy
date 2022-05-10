import 'package:Florxy/NetworkHandler.dart';
import 'package:Florxy/pages/allfollower.dart';
import 'package:Florxy/pages/allfollowing.dart';
import 'package:Florxy/pages/lastthingspage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
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

import '../Model/aliasColorModel.dart';

class anotherProfile extends StatefulWidget {
  String? another_username;
  anotherProfile({Key? key, this.another_username}) : super(key: key);

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
  Color professor_color=Colors.white, creator_color=Colors.white;
  Professor list_professor_color = Professor();
  Creator list_creator_color = Creator();

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
    // String? profile = await storage.read(key: "anotherprofile");
    // print(profile);
    var response = await networkHandler.get("/profile/getOtherData/" + widget.another_username!);
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

    int i=0, j=0;
    for(i;i<=list_professor_color.alias_professor.length-1;i++) {
      if(profileModel.professor==list_professor_color.alias_professor[i].alias){
        setState(() {
          professor_color = list_professor_color.alias_professor[i].color!;
        });
      }
    }

    for(j;j<=list_creator_color.alias_creator.length-1;j++) {
      if(profileModel.influencer==list_creator_color.alias_creator[j].alias){
        setState(() {
          creator_color = list_creator_color.alias_creator[j].color!;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              top: Theme.of(context).platform == TargetPlatform.android
                  ? 18.5
                  : 0),
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
                      SavedPro( username: profileModel.username ),
                    ],
                  ))
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }

  Widget profileHeaderWidget(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      color: c.textWhite,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(FeatherIcons.chevronLeft),
                  iconSize: 34,
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Expanded(child: Container()),
                Poppins(
                  text: profileModel.fullname,
                  size: 18,
                  color: c.blackMain,
                  fontWeight: f.semiBold,
                ),
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    onPressed: () {
                      ModalBottomSheet.Dialog_Settings(
                          context, profileModel.username);
                    },
                    icon: Icon(Boxicons.bx_dots_vertical_rounded, size: 28,),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFE5E5E5)
                      ),
                      width: 88,
                      height: 88,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: CachedNetworkImage(imageUrl: profileModel.img,fit: BoxFit.cover,errorWidget: (context, url, error) => Container(),),
                      )
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 20),
                      //   child: Column(
                      //     children: [
                      //       Row(
                      //         children: [
                      //           Poppins(
                      //             text: profileModel.fullname,
                      //             size: 20,
                      //             color: c.blackMain,
                      //             fontWeight: f.semiBold,
                      //           ),
                      //         ],
                      //       )
                      //     ],
                      //   ),
                      // ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 21, top: 5, bottom: 5),
                        child: Row(
                          children: [
                            profileModel.listfollower.length != 0 ? GestureDetector(
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
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => allFollower( another_username: profileModel.username ))).then((value) => fetchData());
                              },
                            ):
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Poppins(
                                    text: "${profileModel.listfollower.length}",
                                    size: 18,
                                    color: c.blackSub2,
                                    fontWeight: f.semiBold),
                                Poppins(
                                    text: "Followers",
                                    size: 14,
                                    color: c.greyMain,
                                    fontWeight: f.semiBold),
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            profileModel.listfollowing.length != 0 ? GestureDetector(
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
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => allFollowing( another_username: profileModel.username ))).then((value) => fetchData());
                              },
                            ):
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Poppins(
                                    text: "${profileModel.listfollowing.length}",
                                    size: 18,
                                    color: c.blackSub2,
                                    fontWeight: f.semiBold),
                                Poppins(
                                    text: "Following",
                                    size: 14,
                                    color: c.greyMain,
                                    fontWeight: f.semiBold),
                              ],
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
                  // Expanded(
                  //   child: Column(
                  //     verticalDirection: VerticalDirection.down,
                  //     children: [
                  //       IconButton(
                  //         onPressed: () {
                  //           ModalBottomSheet.Dialog_Settings(
                  //               context, profileModel.username);
                  //         },
                  //         icon: Icon(Boxicons.bx_dots_vertical_rounded),
                  //       ),
                  //       SizedBox(
                  //         height: 49,
                  //       )
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
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
                            color: professor_color,
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
                              color: creator_color,
                              fontWeight: f.bold),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: creator_color,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            profileModel.bio.isNotEmpty?Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12, left: 8),
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
            ):SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(children: [
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
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 8,right: 23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  (yourfollow == "Follow")?
                  Expanded(
                    child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        color: c.greenMain,
                        height: 37,
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
                          color: Colors.white,
                          fontWeight: f.semiBold,
                        )
                    ),
                  ):Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              color: c.greenMain,
                              height: 37,
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Inter(
                                    text: yourfollow.toString(),
                                    size: 13,
                                    color: Colors.white,
                                    fontWeight: f.semiBold,
                                  ),
                                  SizedBox(width: 4),
                                  Icon(FeatherIcons.check, size: 17, color: Colors.white)
                                ],
                              )
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              color: Color(0xFFE9E9E9),
                              height: 37,
                              onPressed: () {},
                              child: Inter(
                                text: "Message",
                                size: 13,
                                color: c.blackSub,
                                fontWeight: f.semiBold,
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
