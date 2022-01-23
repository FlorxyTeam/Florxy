import 'package:Florxy/widgets/font.dart';
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
              color: c.textWhite,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 10, right: 10),
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
                                size: 11,
                                fontWeight: f.bold),
                          ),
                          Tab(
                            child: Inter_1(
                                text: "Favorite post",
                                size: 11,
                                fontWeight: f.bold),
                          ),
                          Tab(
                            child: Inter_1(
                                text: "Saved Product",
                                size: 11,
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
}
