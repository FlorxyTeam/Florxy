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
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
      VoidCallback callback, {
        Duration duration = const Duration(milliseconds: 1000),
      }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            query == "" ?  75 : 110),
        child: query == "" ?Container(
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
            leading: Padding(
              padding: EdgeInsets.only(top: 17.5, left: 15),
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: 25,
                  color: c.blackMain,
                ),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(top: 20, left: 5, right: 0),
                child: Container(
                  width: MediaQuery.of(context).size.width-120,
                  child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: c.searchbar,
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
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


                      onSubmitted: (String start) async => debounce(() async {
                        if (!mounted) return;

                        setState(() {
                          query = start;
                          print(start);
                          print(query);
                        });
                      }),
                  ),
                ),
              ),
              Padding(
              padding: EdgeInsets.only(top: 14, left: 5, right: 10),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Boxicons.bx_slider_alt,
                    size: 30,
                    color: c.blackMain,
                  ),
                ),
              ),
            ],
          ),
        ) : Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: c.shadow.withOpacity(0),
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
                  bottom: Radius.circular(0),
                )),
            leading: Padding(
              padding: EdgeInsets.only(
                  top: Theme.of(context).platform == TargetPlatform.android
                      ? 17.5
                      : 0,
                  left: 15),
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: 25,
                  color: c.blackMain,
                ),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(top: 20, left: 5, right: 0),
                child: Container(
                  width: MediaQuery.of(context).size.width-120,
                  child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: c.searchbar,
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                          print(start);
                          print(query);
                        });
                      }
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 14, left: 5, right: 10),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Boxicons.bx_slider_alt,
                    size: 30,
                    color: c.blackMain,
                  ),
                ),
              ),
            ],
            bottom: PreferredSize(
                child: query == "" ? Container(
                ):Container(
                  width: double.infinity,
                  height: 40,
                  color: Color(0xFFFFFFFF),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 0 , left: 20, right: 20),
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
                preferredSize:  Size.fromHeight(50.0),
            ),
          ),
        )
      ),
      body: SingleChildScrollView(
            child:  query == "" ? Container(
            ) : see == "Post" ? Column(
              children: [
                Consumer<PostProvider>(
                    builder: (context, model, _) => FutureBuilder(
                      future: model.fetchSearchProductPost(query),
                      builder: (context, snapshot) => MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        removeBottom: true,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
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
                        ),
                      ),
                    )
                ),
              ],
            ) : see == "Review" ? Column(
              children: [
                Consumer<PostProvider>(
                    builder: (context, model, _) => FutureBuilder(
                      future: model.fetchSearchProductPost(query),
                      builder: (context, snapshot) => MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        removeBottom: true,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
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
                        ),
                      ),
                    )
                ),
              ],
            ) : see == "User" ? Column(
              children: [
                Consumer<PostProvider>(
                    builder: (context, model, _) => FutureBuilder(
                      future: model.fetchSearchUser(query),
                      builder: (context, snapshot) => MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        removeBottom: true,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: model.searchUser?.length ?? 0,
                          itemBuilder: (context, int index) {
                            return model.searchUser![index]['__v'] == 0
                                ? Users(
                              username: model.searchUser![index]['username'],
                              fullname: model.searchUser![index]['fullname'],
                              influencer: model.searchUser![index]['influencer'],
                              professor: model.searchUser![index]['professor'],
                              img: model.searchUser![index]['img'],
                              id: model.searchUser![index]['_id'],
                              query : query,
                            ) : Container();
                          },
                        ),
                      ),
                    )
                ),
              ],
            ) : see == "Product" ? Column(
              children: [
                Consumer<PostProvider>(
                    builder: (context, model, _) => FutureBuilder(
                      future: model.fetchSearchProduct(query),
                      builder: (context, snapshot) => MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        removeBottom: true,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: model.searchProduct?.length ?? 0,
                          itemBuilder: (context, int index) {
                            print(model.searchProduct![index]['p_name']);
                            print(model.searchProduct![index]['p_brand']);
                            return model.searchProduct![index]['__v'] == 0
                                ? Products(
                              name: model.searchProduct![index]['p_name'],
                              brand: model.searchProduct![index]['p_brand'],
                              desc: model.searchProduct![index]['p_desc'],
                              img: model.searchProduct![index]['p_img'],
                              id: model.searchProduct![index]['_id'],
                              query : query,
                            ) : Container();
                          },
                        ),
                      ),
                    )
                ),
              ],
            ) : Container(),
          ),
    );
  }

}

/*height: MediaQuery.of(context).size.height ,
child: Consumer<PostProvider>(
builder: (context, model, _) => FutureBuilder(
future: model.fetchSearchProductPost(query),
builder: (context, snapshot) => see == "Post" ? ListView.builder(
padding: EdgeInsets.only(top: 0),

query == "" ? Container(
              ): Container(
                width: double.infinity,
                height: 40,
                color: Color(0xFFFFFFFF),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 0 , left: 20, right: 20),
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
*/
