import 'dart:async';
import 'dart:ffi';

import 'package:Florxy/Model/postModel.dart';
import 'package:Florxy/Post/addPost.dart';
import 'package:Florxy/widgets/SearchMentionPostWidget.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/scrapper/incidecoder.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_rx/src/rx_workers/rx_workers.dart';
import 'package:provider/provider.dart';


import '../NetworkHandler.dart';
import '../postProvider.dart';
import '../widgets/PostWidget.dart';
import '../widgets/searchwidget.dart';

class SearchPost extends StatefulWidget {
  const SearchPost({Key? key}) : super(key: key);

  @override
  _SearchPostState createState() => _SearchPostState();
}
NetworkHandler networkHandler = NetworkHandler();



class _SearchPostState extends State<SearchPost> {
  String see = "Post";
  String query = '';
  //Timer? debouncer;
  NetworkHandler networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();



  Widget buildSearch() => SearchMentionPost(
    text: query,
    hintText: 'Search Post',
    onChanged: SearchPost,
  );

  @override
  void initState() {
    Provider.of<PostProvider>(context,listen: false).fetchSearchPost(query);
    super.initState();
  }

  Future SearchPost(String query) async => (() async {
    query = this.query;
    print(query);

    if (!mounted) return;

    setState(() {
      Provider.of<PostProvider>(context,listen: false).fetchSearchPost(query);
    });
  });

  @override
  seePost() {
    setState((){
      see = "Post";
    });
  }
  seeReview() {
    setState((){
      see = "Review";
    });
  }
  seeMention() {
    setState((){
      see = "Mention";
    });
  }

  @override
  Widget build(BuildContext context) {
    // product();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: c.shadow.withOpacity(0.02),
                  spreadRadius: -17,
                  blurRadius: 30,
                  offset: Offset(0, 6), // changes position of shadow
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 0,),
            child : Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(26.0)),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 45, left: 10, right: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            size: 25,
                            color: c.blackMain,
                          ),
                        ),
                        buildSearch(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Boxicons.bx_slider_alt,
                            size: 25,
                            color: c.blackMain,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 25, right: 35),
                      child : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child : GestureDetector(
                              onTap: () => seePost(),
                              child: Poppins(
                                text: "   Post    ",
                                size: 14,
                                color: c.greyMain,
                                fontWeight: f.bold,
                              ),
                            ),
                          ),
                          Container(
                            child : GestureDetector(
                              onTap: () => seeReview(),
                              child: Poppins(
                                text: "     Review ",
                                size: 14,
                                color: c.greyMain,
                                fontWeight: f.bold,
                              ),
                            ),
                          ),
                          Container(
                            child : GestureDetector(
                              onTap: () => seeMention(),
                              child: Poppins(
                                text: " Mention ",
                                size: 14,
                                color: c.greyMain,
                                fontWeight: f.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 10, right: 20),
                      child : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 5,
                            width: 90,
                            decoration: BoxDecoration(
                              color: see == "Post" ? c.greenMain : Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(13.0)),
                            ),
                          ),
                          Container(
                            height: 5,
                            width: 90,
                            decoration: BoxDecoration(
                              color: see == "Review" ? c.greenMain : Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(13.0)),
                            ),
                          ),
                          Container(
                            height: 5,
                            width: 90,
                            decoration: BoxDecoration(
                              color: see == "Mention" ? c.greenMain : Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(13.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 150),
            child : Container(
              height: MediaQuery.of(context).size.height-240,
              child: Consumer<PostProvider>(builder: (context,model,_) => FutureBuilder(
                future: model.fetchData(),
                builder: (context,snapshot) => see == "Mention" ? ListView.builder(
                  padding: EdgeInsets.only(top: 0),
                  scrollDirection: Axis.vertical,
                  itemCount: model.postData?.length??0,
                  itemBuilder: (context,int index){
                    return model.postData![index]['type']=='mention' ? MentionPost(
                      username: model.postData![index]['username'],
                      postTime: model.postData![index]['updatedAt'].toString().substring(0, 10),
                      post: model.postData![index]['body'],
                      comment: model.postData![index]['comment'],
                      urlImage: model.postData![index]['coverImage'],
                      id: model.postData![index]['_id'],
                    ):Container();
                  },
                ): see == "Review" ? ListView.builder(
                  padding: EdgeInsets.only(top: 0),
                  scrollDirection: Axis.vertical,
                  itemCount: model.postData?.length??0,
                  itemBuilder: (context,int index){
                    return model.postData![index]['type']=='review' ?ReviewPost(
                      username: model.postData![index]['username'],
                      postTime: model.postData![index]['updatedAt'].toString().substring(0, 10),
                      urlImage: model.postData![index]['coverImage'],
                      post: model.postData![index]['body'],
                      rating: model.postData![index]['rating'],
                      comment: model.postData![index]['comment'],
                      id: model.postData![index]['_id'],
                    ):Container();
                  },
                ): see == "Post" ? ListView.builder(
                  padding: EdgeInsets.only(top: 0),
                  scrollDirection: Axis.vertical,
                  itemCount: model.postData?.length??0,
                  itemBuilder: (context,int index){
                    return model.postData![index]['type']=='post' ? Post(
                        username: model.postData![index]['username'],
                        postTime: model.postData![index]['updatedAt'].toString().substring(0, 10),
                        post: model.postData![index]['body'],
                        comment: model.postData![index]['comment'],
                        id: model.postData![index]['_id'],
                        urlImage: model.postData![index]['coverImage']
                    ):Container();
                  },
                ): Container(),
              )),
            ),
          ),
        ],
      ),
    );
  }


}