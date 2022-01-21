import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/pages/FavPost.dart';
import 'package:Florxy/pages/PostReply.dart';
import 'package:Florxy/pages/savedPro.dart';
import 'package:Florxy/widgets/pro_header_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
          body: Column(
            children: [
              Container(
                color: Colors.white,
                child: TabBar(
                  labelColor: c.greenMain,
                  unselectedLabelColor: c.greyMain,
                  indicator: BoxDecoration(
                    color: c.greenLight2.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  tabs: [
                    Tab(
                      text: 'Post and replies',
                    ),
                    Tab(
                      text: 'Favorite post',
                    ),
                    Tab(
                      text: 'Saved Product',
                    ),
                  ],
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
        ),
      ),
    ));
  }
}
