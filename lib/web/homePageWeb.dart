import 'package:Florxy/pages/ViewPostPage.dart';
import 'package:Florxy/Model/postModel.dart';
import 'package:Florxy/pages/chat.dart';
import 'package:Florxy/pages/sensepage.dart';
import 'package:Florxy/postProvider.dart';
import 'package:Florxy/pages/CreatePost.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:boxicons/boxicons.dart';
import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/PostWidget.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import '../NetworkHandler.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class HomePageWeb extends StatefulWidget {
  const HomePageWeb({Key? key}) : super(key: key);

  @override
  _HomePageWebState createState() => _HomePageWebState();
}

class _HomePageWebState extends State<HomePageWeb> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refreshPage();
    // fetchData();
  }
  final storage = new FlutterSecureStorage();

  Future<void> _refreshPage() async {
    // refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidPullToRefresh(
        onRefresh: _refreshPage,
        color: c.greenMain,
        height: 100,
        backgroundColor: c.textWhite,
        animSpeedFactor: 10,
        showChildOpacityTransition: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 70,left: 200,right: 200),
            child: Column(
              children: [
                Consumer<PostProvider>(
                    builder: (context, model, _) => FutureBuilder(
                      future: model.fetchData(),
                      builder: (context, snapshot) => MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        removeBottom: true,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: model.postData?.length ?? 0,
                          itemBuilder: (context, int index) {
                            return model.postData![index]['type'] == 'mention'
                                ? MentionPost(
                              username: model.postData![index]['username'],
                              postTime: model.postData![index]['updatedAt'].toString().substring(0, 10),
                              post: model.postData![index]['body'],
                              comment: 0,
                              urlImage: model.postData![index]['coverImage'],
                              id: model.postData![index]['_id'],
                            )
                                : model.postData![index]['type'] == 'review'
                                ? ReviewPost(
                              username: model.postData![index]['username'],
                              postTime: model.postData![index]['updatedAt']
                                  .toString()
                                  .substring(0, 10),
                              urlImage: model.postData![index]['coverImage'],
                              post: model.postData![index]['body'],
                              rating: model.postData![index]['rating'],
                              comment: 0,
                              id: model.postData![index]['_id'],
                            )
                                : model.postData![index]['type'] == 'post'
                                ? Post(
                                username: model.postData![index]['username'],
                                postTime: model.postData![index]['updatedAt']
                                    .toString()
                                    .substring(0, 10),
                                post: model.postData![index]['body'],
                                comment: 0,
                                id: model.postData![index]['_id'],
                                urlImage: model.postData![index]['coverImage'])
                                : Container();
                          },
                        ),
                      ),
                    )),



                SizedBox(
                  height:MediaQuery.of(context).size.height/7.5,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
