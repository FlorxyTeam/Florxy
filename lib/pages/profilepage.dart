
import 'package:Florxy/Model/aliasColorModel.dart';
import 'package:Florxy/Model/profileModel.dart';
import 'package:Florxy/NetworkHandler.dart';
import 'package:Florxy/pages/myfollower.dart';
import 'package:Florxy/pages/myfollowing.dart';
import 'package:Florxy/widgets/Modalsetting.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:boxicons/boxicons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/pages/FavPost.dart';
import 'package:Florxy/pages/PostReply.dart';
import 'package:Florxy/pages/savedPro.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import 'allfollower.dart';
import 'allfollowing.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool circular = true;
  NetworkHandler networkHandler = NetworkHandler();
  late Stream<FileResponse> profileimg;
  Professor professor = Professor();
  Creator creator = Creator();

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
  Color? professor_color, creator_color;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchData();
  }

  void fetchData() async {
    var response = await networkHandler.get("/profile/getData");
    
    setState(() {
      profileModel = ProfileModel.fromJson(response["data"]);
      circular = false;
    });

    int i=0, j=0;
    for(i;i<=professor.alias_professor.length-1;i++) {
      if(profileModel.professor==professor.alias_professor[i].alias){
        setState(() {
          professor_color = professor.alias_professor[i].color;
        });
      }
    }

    for(j;j<=creator.alias_creator.length-1;j++) {
      if(profileModel.influencer==creator.alias_creator[j].alias){
        setState(() {
          creator_color = creator.alias_creator[j].color;
        });
      }
    }

  }
  proFileCache(String url) {
      profileimg = DefaultCacheManager().getFileStream(url);
      return profileimg;
    // return file;
  }
  
//   pictureDelayed(){
//     Future.delayed(const Duration(milliseconds: 500), () {
//
// // Here you can write your code
//
//       return
//
//     });
//   }
  // Future<Null> downloadFile(String httpPath){

  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: DefaultTabController(
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
                        top: BorderSide(width: 1, color: c.greyMain.withOpacity(0.5)),
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
                            isScrollable: false,
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
                              PostReply(),
                              FavPost( idFavPost: profileModel.id ),
                              SavedPro(),
                            ],
                          ))
                    ],
                  ),
                )),
          ),
        )
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
            // SizedBox(
            //   height: MediaQuery.of(context).size.height/45,
            // ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // FutureBuilder(
                //     future: proFileCache(profileModel.img),
                //     builder: (context, snapshot) {
                //       if (snapshot.hasData){
                //         print(snapshot);
                //       }
                //       return  CircleAvatar(
                //         radius: 44,
                //         backgroundColor: Colors.orange,
                //         backgroundImage:
                //         NetworkImage(profileModel.img),
                //       );
                //     }
                //
                // ),

                // StreamBuilder(
                //     stream: proFileCache(profileModel.img),
                //     builder: (context, snapshot){
                //       // Fil
                //       var x = snapshot.data as FileInfo;
                //       if (snapshot.hasError) {
                //         return ListTile(
                //           title: const Text('Error'),
                //           subtitle: Text(snapshot.error.toString()),
                //         );
                //       }
                //       else return Text(x.originalUrl);
                //
                //
                //     }
                // ),
                Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFE5E5E5)
                    ),
                    width: 90,
                    height: 90,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: CachedNetworkImage(imageUrl: profileModel.img,fit: BoxFit.cover,errorWidget: (context, url, error) => Container(),),
                    )
                ),

                // CircleAvatar(
                //   radius: 44,
                //   backgroundColor: Colors.orange,
                //   backgroundImage:
                //   NetworkImage(profileModel.img),
                // ),
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
                      padding: const EdgeInsets.only(left: 21, top: 5,bottom: 5),
                      child: Row(

                      children: [
                        GestureDetector(
                          child: Column(


                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Poppins(
                                    text: "${profileModel.listfollower.length}",
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
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => allFollower( another_username: profileModel.username )));
                            },

                          ),
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => myFollower()));
                          },
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width/20

                          // width: 30,
                  
                          ),
                          GestureDetector(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Poppins(
                                    text: "${profileModel.listfollowing.length}",
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
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => allFollowing( another_username: profileModel.username )));
                            },
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width/10,
                          ),
                        ],
                      ),

                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width/20,
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
                            color: creator_color!,
                            fontWeight: f.bold),
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: creator_color!,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ],
                ),
              ],
            ),
            profileModel.bio.isNotEmpty?Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width-50,
                    child: Inter(
                        text: profileModel.bio,
                        size: 13,
                        color: c.greyMain,
                        fontWeight: f.medium),
                  ),
                ],
              ),
            ):SizedBox(height: 15),
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
          ],
        ),
      ),
    );
  }
}