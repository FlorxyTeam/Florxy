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
        height: MediaQuery.of(context).size.height-170,
        child: Consumer<PostProvider>(builder: (context,model,_) => FutureBuilder(
          future: model.fetchMyPostAndReply(),
          builder: (context,snapshot) => ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: model.myPost?.length??0,
            itemBuilder: (context,int index){
              return model.myPost![index]['type']=='mention'?MentionPost(
                username: model.myPost![index]['username'],
                postTime: model.myPost![index]['updatedAt'].toString().substring(0, 10),
                post: model.myPost![index]['body'],
                comment: 0,
                urlImage: model.myPost![index]['coverImage'],
                id: model.myPost![index]['_id'],
              ):
              model.myPost![index]['type']=='review'?ReviewPost(
                username: model.myPost![index]['username'],
                postTime: model.myPost![index]['updatedAt'].toString().substring(0, 10),
                post: model.myPost![index]['body'],
                rating: model.myPost![index]['rating'],
                urlImage: model.myPost![index]['coverImage'],
                comment: 0,
                id: model.myPost![index]['_id'],
              ):model.myPost![index]['type']=='post' ? Post(
                  username: model.myPost![0]['username'],
                  postTime: model.myPost![index]['updatedAt'].toString().substring(0, 10),
                  post: model.myPost![index]['body'],
                  comment: 0,
                  id: model.myPost![index]['_id'],
                  urlImage: model.myPost![index]['coverImage']
              ):Container();
            },
          ),
        )),
      ),
    );
  }
}


class AnotherPostReply extends StatefulWidget {
  String? username;
  AnotherPostReply({Key? key, this.username}) : super(key: key);

  @override
  _AnotherPostReplyState createState() => _AnotherPostReplyState();
}

class _AnotherPostReplyState extends State<AnotherPostReply> {
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();

  void fetchData() async{
    await networkHandler.get("/profile/otherPostAndReply/" + widget.username!);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
    Provider.of<PostProvider>(context,listen: false).fetchAnotherPostAndReply(widget.username!);
  }

  // void deleteData() async{
  //   await storage.delete(key: "anotherUsername");
  // }
  //
  // @override
  // void dispose() {
  //   deleteData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<PostProvider>(
                builder: (context, model, _) => FutureBuilder(
                  future: model.fetchAnotherPostAndReply(widget.username!),
                  builder: (context, snapshot) => MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    removeBottom: true,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: model.anotherPost?.length??0,
                      itemBuilder: (context, int index) {
                        return model.anotherPost![index]['type']=='mention'?MentionPost2(
                          name: model.profile![0]['fullname'],
                          username: model.profile![0]['username'],
                          postTime: model.anotherPost![index]['updatedAt'].toString().substring(0, 10),
                          post: model.anotherPost![index]['body'],
                          comment: 0,
                          urlImage: model.anotherPost![index]['coverImage'],
                          professor:model.profile![0]['professor'],
                          influencer: model.profile![0]['influencer'],
                          profileImg: model.profile![0]['img'],
                          id: model.anotherPost![index]['_id'],
                        ):
                        model.anotherPost![index]['type']=='review'?ReviewPost2(
                          name: model.profile![0]['fullname'],
                          username: model.profile![0]['username'],
                          postTime: model.anotherPost![index]['updatedAt'].toString().substring(0, 10),
                          post: model.anotherPost![index]['body'],
                          rating: model.anotherPost![index]['rating'],
                          urlImage: model.anotherPost![index]['coverImage'],
                          comment: 0,
                          professor:model.profile![0]['professor'],
                          influencer: model.profile![0]['influencer'],
                          profileImg: model.profile![0]['img'],
                          id: model.anotherPost![index]['_id'],
                        ):model.anotherPost![index]['type']=='post' ? Post2(
                            name: model.profile![0]['fullname'],
                            username: model.profile![0]['username'],
                            postTime: model.anotherPost![index]['updatedAt'].toString().substring(0, 10),
                            post: model.anotherPost![index]['body'],
                            comment: 0,
                            professor:model.profile![0]['professor'],
                            influencer: model.profile![0]['influencer'],
                            profileImg: model.profile![0]['img'],
                            id: model.anotherPost![index]['_id'],
                            urlImage: model.anotherPost![index]['coverImage']
                        ):Container();
                      },
                    ),
                  ),
                )),

          ],
        ),
      ),
    );
  }
}
