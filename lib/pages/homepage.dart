import 'package:Florxy/pages/Loadingscreen.dart';
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
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../LoadingScreen/createPostLoadingScreen.dart';
import '../NetworkHandler.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import 'navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePage homePage = HomePage();
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _refreshPage();
  //   // fetchData();
  // }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _refreshPage();
  }

  @override
  void didUpdateWidget(covariant HomePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  final storage = new FlutterSecureStorage();

  Future<void> _refreshPage() async {
    // refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            Theme.of(context).platform == TargetPlatform.android ? 75 : 66.0),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: c.shadow.withOpacity(0.32),
                spreadRadius: -17,
                blurRadius: 30,
                offset: Offset(0, 6), // changes position of shadow
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(26),
            )),
            title: Padding(
              padding: EdgeInsets.only(
                  top: Theme.of(context).platform == TargetPlatform.android
                      ? 18.5
                      : 0,
                  left: 8),
              child: Poppins(
                text: 'FLORXY',
                fontWeight: f.semiBold,
                color: c.blackMain,
                size: 25,
              ),
            ),
            leading: Padding(
              padding: EdgeInsets.only(
                  top: Theme.of(context).platform == TargetPlatform.android
                      ? 17.5
                      : 0,
                  left: 15),
              child: IconButton(
                icon: Icon(FeatherIcons.maximize),
                iconSize: 25,
                color: Colors.black,
                onPressed: () async {
                  await availableCameras().then((value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SensePage(cameras: value))));
                },
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(
                    top: Theme.of(context).platform == TargetPlatform.android
                        ? 17.5
                        : 0),
                child: IconButton(
                  icon: Icon(FeatherIcons.edit),
                  iconSize: 25,
                  color: Colors.black,
                  onPressed: () {
                    final google_user = FirebaseAuth.instance.currentUser;

                    print(google_user);
                    storage.delete(key: "review-product");
                    storage.delete(key: "mention-product");
                    storage.delete(key: "rating");
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CreatePost()))
                        .then((value) {
                      Provider.of<PostProvider>(context, listen: false).fetchData();
                      // Navigator.of(context).pushReplacement(
                      //     PageTransition(type: PageTransitionType.fade, child: CreatPostLoadingScreen(), duration: Duration(milliseconds: 0)));
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: Theme.of(context).platform == TargetPlatform.android
                        ? 17.5
                        : 0,
                    right: 13),
                child: IconButton(
                  icon: Icon(FeatherIcons.send),
                  iconSize: 25,
                  color: Colors.black,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChatPage()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: LiquidPullToRefresh(
        onRefresh: _refreshPage,
        color: c.greenMain,
        height: 100,
        backgroundColor: c.textWhite,
        animSpeedFactor: 10,
        showChildOpacityTransition: false,
        child: SingleChildScrollView(
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
    );
  }
}
