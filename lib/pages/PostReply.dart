import 'package:Florxy/NetworkHandler.dart';
import 'package:Florxy/widgets/PostWidget.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import '../postProvider.dart';


class PostReply extends StatefulWidget {
  const PostReply({Key? key}) : super(key: key);

  @override
  _PostReplyState createState() => _PostReplyState();
}

class _PostReplyState extends State<PostReply> {
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();

  void fetchData() async{
    var username = await storage.read(key: 'username');
    print(username);
    await networkHandler.get("/profile/PostAndReply/"+username!);
  }

  @override
  void initState() {
    fetchData();
    // TODO: implement initState
    Provider.of<PostProvider>(context,listen: false).fetchMyPostAndReply();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height-200,
        child: Consumer<PostProvider>(builder: (context,model,_) => FutureBuilder(
          future: model.fetchMyPostAndReply(),
          builder: (context,snapshot) => ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: model.myPost?.length??0,
            itemBuilder: (context,int index){
              return model.myPost![index]['type']=='mention'?MentionPost(
                name: model.myPost![index]['fullname'],
                username: model.myPost![index]['username'],
                postTime: model.myPost![index]['updatedAt'].toString().substring(0, 10),
                brand: model.myPost![index]['refbrand'],
                product: model.myPost![index]['refproduct'],
                post: model.myPost![index]['body'],
                comment: model.myPost![index]['comment'],
                favorite: model.myPost![index]['favorite'],
                urlImage: model.myPost![index]['coverImage'],
                professor:model.myPost![index]['professor'],
                influencer: model.myPost![index]['influencer'],
                id: model.myPost![index]['_id'],
              ):
              model.myPost![index]['type']=='review'?ReviewPost(
                name: model.myPost![index]['fullname'],
                username: model.myPost![index]['username'],
                postTime: model.myPost![index]['updatedAt'].toString().substring(0, 10),
                brand: model.myPost![index]['refbrand'],
                product: model.myPost![index]['refproduct'],
                post: model.myPost![index]['body'],
                rating: model.myPost![index]['rating'],
                comment: model.myPost![index]['comment'],
                favorite: model.myPost![index]['favorite'],
                professor:model.myPost![index]['professor'],
                influencer: model.myPost![index]['influencer'],
                id: model.myPost![index]['_id'],
              ):Container();
            },
          ),
        )),
      ),
    );
  }
}


class AnotherPostReply extends StatefulWidget {
  const AnotherPostReply({Key? key}) : super(key: key);

  @override
  _AnotherPostReplyState createState() => _AnotherPostReplyState();
}

class _AnotherPostReplyState extends State<AnotherPostReply> {
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();

  void fetchData() async{
    var username = await storage.read(key: 'anotherprofile');
    print(username);
    await networkHandler.get("/profile/PostAndReply/"+username!);
  }

  @override
  void initState() {
    fetchData();
    // TODO: implement initState
    Provider.of<PostProvider>(context,listen: false).fetchAnotherPostAndReply();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height-200,
        child: Consumer<PostProvider>(builder: (context,model,_) => FutureBuilder(
          future: model.fetchAnotherPostAndReply(),
          builder: (context,snapshot) => ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: model.myPost?.length??0,
            itemBuilder: (context,int index){
              return model.myPost![index]['type']=='mention'?MentionPost(
                name: model.myPost![index]['fullname'],
                username: model.myPost![index]['username'],
                postTime: model.myPost![index]['updatedAt'].toString().substring(0, 10),
                brand: model.myPost![index]['refbrand'],
                product: model.myPost![index]['refproduct'],
                post: model.myPost![index]['body'],
                comment: model.myPost![index]['comment'],
                favorite: model.myPost![index]['favorite'],
                urlImage: model.myPost![index]['coverImage'],
                professor:model.myPost![index]['professor'],
                influencer: model.myPost![index]['influencer'],
                id: model.myPost![index]['_id'],
              ):
              model.myPost![index]['type']=='review'?ReviewPost(
                name: model.myPost![index]['fullname'],
                username: model.myPost![index]['username'],
                postTime: model.myPost![index]['updatedAt'].toString().substring(0, 10),
                brand: model.myPost![index]['refbrand'],
                product: model.myPost![index]['refproduct'],
                post: model.myPost![index]['body'],
                rating: model.myPost![index]['rating'],
                comment: model.myPost![index]['comment'],
                favorite: model.myPost![index]['favorite'],
                professor:model.myPost![index]['professor'],
                influencer: model.myPost![index]['influencer'],
                id: model.myPost![index]['_id'],
              ):Container();
            },
          ),
        )),
      ),
    );
  }
}
