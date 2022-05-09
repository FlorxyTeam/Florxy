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
import 'package:Florxy/widgets/PostWidget.dart';
import 'package:provider/provider.dart';


import '../NetworkHandler.dart';
import '../postProvider.dart';
import '../widgets/SearchPostWidget.dart';
import '../widgets/PostWidget.dart';

class SearchPost extends StatefulWidget {
  const SearchPost({Key? key}) : super(key: key);

  @override
  _SearchPostState createState() => _SearchPostState();
}
NetworkHandler networkHandler = NetworkHandler();



class _SearchPostState extends State<SearchPost> {
  String see = "Post";
  String query = "";
  Timer? debouncer;
  String? post;

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
  seeUser() {
    setState((){
      see = "User";
    });
  }
  seeProduct() {
    setState((){
      see = "Product";
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
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
              height: query == "" ? 110 : 140,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(26.0)),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 45, left: 5, right: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            size: 25,
                            color: c.blackMain,
                          ),
                        ),
                        Container(
                          height: Theme.of(context).platform == TargetPlatform.android ? 28 : 0,
                          width: Theme.of(context).platform == TargetPlatform.android ? 245 : 0,
                          child: TextField(
                            controller: controller,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: c.searchbar,
                              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(right: 2, left: 12),
                                child: Icon(Icons.search_rounded, size: 23, color: c.blackSub2),
                              ),
                              hintText: "Search Post",
                              hintStyle: TextStyle(
                                  fontSize: 14.5,
                                  color: c.greyMain,
                                  fontWeight: f.medium),
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(40.0)),
                                borderSide: BorderSide(
                                    color: c.graySub2.withOpacity(0), width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(40.0)),
                                borderSide: BorderSide(
                                    color: c.graySub2.withOpacity(0), width: 2),
                              ),
                            ),
                            onSubmitted: (String start){
                              setState((){
                                query = start;
                              });
                            }
                          ),
                        ),
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
                      padding: EdgeInsets.only(top: query == "" ? 0 : 10, left: 20, right: 20),
                      child : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          query == "" ? Container(

                          ) : Container(
                            child : GestureDetector(
                              onTap: () => seePost(),
                              child: Poppins(
                                text: "    Post",
                                size: 14,
                                color: c.greyMain,
                                fontWeight: f.bold,
                              ),
                            ),
                          ),
                          query == "" ? Container(

                          ) : Container(
                            child : GestureDetector(
                              onTap: () => seeReview(),
                              child: Poppins(
                                text: "   Review ",
                                size: 14,
                                color: c.greyMain,
                                fontWeight: f.bold,
                              ),
                            ),
                          ),
                          query == "" ? Container(

                          ) : Container(
                            child : GestureDetector(
                              onTap: () => seeUser(),
                              child: Poppins(
                                text: "User  ",
                                size: 14,
                                color: c.greyMain,
                                fontWeight: f.bold,
                              ),
                            ),
                          ),
                          query == "" ? Container(

                          ) : Container(
                            child : GestureDetector(
                              onTap: () => seeProduct(),
                              child: Poppins(
                                text: " Product ",
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
                      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          query == "" ? Container(

                          ) : Container(
                            height: 5,
                            width: 80,
                            decoration: BoxDecoration(
                              color: see == "Post" ? c.greenMain : Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(13.0)),
                            ),
                          ),
                          query == "" ? Container(

                          ) : Container(
                            height: 5,
                            width: 80,
                            decoration: BoxDecoration(
                              color: see == "Review" ? c.greenMain : Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(13.0)),
                            ),
                          ),
                          query == "" ? Container(

                          ) : Container(
                            height: 5,
                            width: 80,
                            decoration: BoxDecoration(
                              color: see == "User" ? c.greenMain : Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(13.0)),
                            ),
                          ),
                          query == "" ? Container(

                          ) : Container(
                            height: 5,
                            width: 80,
                            decoration: BoxDecoration(
                              color: see == "Product" ? c.greenMain : Colors.white,
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
              padding: EdgeInsets.only(
                  top: Theme.of(context).platform == TargetPlatform.android ? 140 : 0,
                  ),
              child :
              query == "" ? Container(

                ) : Container(
                  height: MediaQuery.of(context).size.height ,
                  child: Consumer<PostProvider>(
                      builder: (context, model, _) => FutureBuilder(
                        future: model.fetchSearchProductPost(query),
                        builder: (context, snapshot) => see == "Post" ? ListView.builder(
                          padding: EdgeInsets.only(top: 0),
                          scrollDirection: Axis.vertical,
                          itemCount: model.searchPost?.length ?? 0,
                          itemBuilder: (context, int index) {
                            return model.searchPost![index]['type'] == 'mention'
                                ? MentionPosts(
                              username: model.searchPost![index]['username'],
                              postTime: model.searchPost![index]['updatedAt'].toString().substring(0, 10),
                              post: model.searchPost![index]['body'],
                              comment: 0,
                              urlImage: model.searchPost![index]['coverImage'],
                              id: model.searchPost![index]['_id'],
                              query : query,
                            )
                                : model.searchPost![index]['type'] == 'post'
                                ? Posts(
                                username: model.searchPost![index]['username'],
                                postTime: model.searchPost![index]['updatedAt']
                                    .toString()
                                    .substring(0, 10),
                                post: model.searchPost![index]['body'],
                                comment: 0,
                                id: model.searchPost![index]['_id'],
                                urlImage: model.searchPost![index]['coverImage'],
                                query : query,
                            )
                                : Container();
                          },
                        ) : see == "Review" ? ListView.builder(
                          padding: EdgeInsets.only(top: 0),
                          scrollDirection: Axis.vertical,
                          itemCount: model.searchPost?.length ?? 0,
                          itemBuilder: (context, int index) {
                            return model.searchPost![index]['type'] == 'review'
                                ? ReviewPosts(
                              username: model.searchPost![index]['username'],
                              postTime: model.searchPost![index]['updatedAt']
                                  .toString()
                                  .substring(0, 10),
                              urlImage: model.searchPost![index]['coverImage'],
                              post: model.searchPost![index]['body'],
                              rating: model.searchPost![index]['rating'],
                              comment: 0,
                              id: model.searchPost![index]['_id'],
                              query : query,
                            )
                                : Container();
                          },
                        ) : see == "User" ? ListView.builder(
                          padding: EdgeInsets.only(top: 0),
                          scrollDirection: Axis.vertical,
                          itemCount: model.searchPost?.length ?? 0,
                          itemBuilder: (context, int index) {
                            return Container();
                          },
                        ) : see == "Product" ? ListView.builder(
                          padding: EdgeInsets.only(top: 0),
                          scrollDirection: Axis.vertical,
                          itemCount: model.searchPost?.length ?? 0,
                          itemBuilder: (context, int index) {
                            return Container();
                          },
                        ) : Container(),
                      )),
              ),
          )
        ],
      ),
    );
  }

}

