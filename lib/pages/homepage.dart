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
import 'package:provider/provider.dart';
import '../NetworkHandler.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // fetchData();
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
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CreatePost()));
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
      body: Container(
        height: MediaQuery.of(context).size.height - 200,
        child: Consumer<PostProvider>(
            builder: (context, model, _) => FutureBuilder(
                  future: model.fetchData(),
                  builder: (context, snapshot) => ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: model.postData?.length ?? 0,
                    itemBuilder: (context, int index) {
                      return model.postData![index]['type'] == 'mention'
                          ? MentionPost(
                              username: model.postData![index]['username'],
                              postTime: model.postData![index]['updatedAt'],
                              post: model.postData![index]['body'],
                              comment: 0,
                              urlImage: model.postData![index]['coverImage'],
                              id: model.postData![index]['_id'],
                            )
                          : model.postData![index]['type'] == 'review'
                              ? ReviewPost(
                                  username: model.postData![index]['username'],
                                  postTime: model.postData![index]['updatedAt'],
                                  urlImage: model.postData![index]['coverImage'],
                                  post: model.postData![index]['body'],
                                  rating: model.postData![index]['rating'],
                                  comment: 0,
                                  id: model.postData![index]['_id'],
                                )
                              : model.postData![index]['type'] == 'post'
                                  ? Post(
                                      username: model.postData![index]['username'],
                                      postTime: model.postData![index]['updatedAt'],
                                      post: model.postData![index]['body'],
                                      comment: 0,
                                      id: model.postData![index]['_id'],
                                      urlImage: model.postData![index]['coverImage'])
                                  : Container();
                    },
                  ),
                )),
      ),
    );
  }
}
