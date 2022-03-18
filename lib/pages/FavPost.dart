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
    DOB: '',
    img: '',
    influencer: '',
    fullname: '',
    follower: 0,
    following: 0,
    bio: '',
    email: '',
    professor: '',
    username: '',
    favorite: [],
    listfollower: [],
    listfollowing: [],
  );
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();

  void fetchData() async{
    print(widget.idFavPost);
    await storage.write(key: "idFavPost", value: widget.idFavPost);
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
    Provider.of<PostProvider>(context,listen: false).fetchFavPost();
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
                name: "${data['fullname']}",
                username: "${data['username']}",
                postTime: "${data['updatedAt']}".toString().substring(0, 10),
                brand: "${data['refbrand']}",
                product: "${data['refproduct']}",
                post: "${data['body']}",
                comment: data['comment'],
                favorite: data['favorite'],
                urlImage: data['coverImage'],
                professor: "${data['professor']}",
                influencer: "${data['influencer']}",
                id: "${data['_id']}",
              ):
              "${data['type']}"=='review'?ReviewPost(
                name: "${data['fullname']}",
                username: "${data['username']}",
                postTime: "${data['updatedAt']}".toString().substring(0, 10),
                brand: "${data['refbrand']}",
                product: "${data['refproduct']}",
                post: "${data['body']}",
                comment: data['comment'],
                favorite: data['favorite'],
                urlImage: data['coverImage'],
                professor: "${data['professor']}",
                influencer: "${data['influencer']}",
                id: "${data['_id']}",
                rating: data['rating'],
              ):"${data['type']}"=='post'?Post(
                name: "${data['fullname']}",
                username: "${data['username']}",
                postTime: "${data['updatedAt']}".toString().substring(0, 10),
                post: "${data['body']}",
                comment: data['comment'],
                favorite: data['favorite'],
                urlImage: data['coverImage'],
                professor: "${data['professor']}",
                influencer: "${data['influencer']}",
                id: "${data['_id']}",
              ):Container();
            },
          ),
        ),
      );
  }
}
