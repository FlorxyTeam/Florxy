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
import 'package:Florxy/widgets/pro_header_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool circular = true;
  NetworkHandler networkHandler = NetworkHandler();
  ProfileModel profileModel = ProfileModel(
      DOB: '',
      img: '',
      influencer: '',
      fullname: '',
      bio: '',
      email: '',
      professor: '',
      username: '');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchData();
  }
  void fetchData() async{
    var response = await networkHandler.get("/profile/getData");
    setState(() {
      profileModel = ProfileModel.fromJson(response["data"]);
      circular = false;
    });
  }
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
                        SliverChildListDelegate([profileHeaderWidget(context)])
                      )
                  ];
                },
                body: Container(
                  color: c.textWhite,
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
                                    size: 12,
                                    fontWeight: f.bold),
                              ),
                              Tab(
                                child: Inter_1(
                                    text: "Favorite post",
                                    size: 12,
                                    fontWeight: f.bold),
                              ),
                              Tab(
                                child: Inter_1(
                                    text: "Saved Product",
                                    size: 12,
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
                              FavPost(),
                              SavedPro(),
                            ],
                          ))
                    ],
                  ),
                )),
          ),
        ));
  }

  Widget profileHeaderWidget(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
          color: c.textWhite,
          border: Border(
            bottom: BorderSide(width: 0.8, color: c.greyMain.withOpacity(0.5)),
          )),
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(
              height: 20,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 43,
                  backgroundColor: Colors.orange,
                  backgroundImage:  NetworkHandler().getImage(profileModel.email),
                ),

                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(

                            children: [
                              Poppins(
                                  text: profileModel.fullname,
                                  size: 20,
                                  color: c.blackMain,
                                  fontWeight: f.semiBold),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 21),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Poppins(
                                  text: "11.3K",
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
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            children: [
                              Poppins(
                                  text: "345",
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
                          ModalBottomSheet.Dialog_Settings(context);
                        },
                        icon: Icon(Boxicons.bx_dots_vertical_rounded),
                      ),
                      SizedBox(
                        height: 36,
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
                          text: "@"+profileModel.username,
                          size: 14,
                          color: c.blackMain,
                          fontWeight: f.semiBold),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 7, left: 7, top: 4, bottom: 4),
                        child: Inter(
                            text: "Beauty Advisor",
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
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 5, left: 5, top: 2, bottom: 2),
                        child: Inter(
                            text: "Brand Presenter",
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
              padding: const EdgeInsets.only(top: 7, bottom: 7),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Inter(
                      text:"BIO: "+profileModel.bio,
                      size: 13,
                      color: c.greyMain,
                      fontWeight: f.semiBold),
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
          ],
        ),
      ),
    );
  }

}
