import 'package:Florxy/Model/profileModel.dart';
import 'package:Florxy/widgets/PostWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import '../NetworkHandler.dart';
import '../postProvider.dart';

class FavPost extends StatefulWidget {
  String? idFavPost;
  FavPost({Key? key, this.idFavPost}) : super(key: key);

  @override
  _FavPostState createState() => _FavPostState();
}

class _FavPostState extends State<FavPost> {
  List data = [];
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
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();

  fetchData() async{
    print(widget.idFavPost);
    // await storage.write(key: "idFavPost", value: widget.idFavPost);
    var response = await networkHandler.get("/profile/getFavPost/"+widget.idFavPost!);

    setState(() {
      profileModel = ProfileModel.fromJson(response["favPost"]);
      data = profileModel.favorite;
      print(data);
    });

  }

  @override
  void initState() {
    fetchData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List staticData = data;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height-200,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: profileModel.favorite.length,
            itemBuilder: (context,int index){
              Map data = staticData[index];
              return "${data['type']}"=='mention'?MentionPost(
                username: "${data['username']}",
                postTime: "${data['updatedAt']}".toString().substring(0, 10),
                post: "${data['body']}",
                comment: 0,
                urlImage: data['coverImage'],
                id: "${data['_id']}",
                fetchdata: fetchData(),
              ):
              "${data['type']}"=='review'?ReviewPost(
                username: "${data['username']}",
                postTime: "${data['updatedAt']}".toString().substring(0, 10),
                post: "${data['body']}",
                comment: 0,
                urlImage: data['coverImage'],
                id: "${data['_id']}",
                rating: data['rating'],
                fetchdata: fetchData(),
              ):"${data['type']}"=='post'?Post(
                username: "${data['username']}",
                postTime: "${data['updatedAt']}".toString().substring(0, 10),
                post: "${data['body']}",
                comment: 0,
                urlImage: data['coverImage'],
                id: "${data['_id']}",
                fetchdata: fetchData(),
              ):Container();
            },
          ),
        ),
      );
  }
}
