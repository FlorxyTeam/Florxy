import 'dart:async';
import 'dart:ffi';

import 'package:Florxy/Post/addPost.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/scrapper/incidecoder.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get_rx/src/rx_workers/rx_workers.dart';
import 'package:provider/provider.dart';

import '../NetworkHandler.dart';
import '../postProvider.dart';
import '../widgets/PostWidget.dart';
import '../widgets/searchwidget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}
  List results = [];
  NetworkHandler networkHandler = NetworkHandler();



class _SearchPageState extends State<SearchPage> {
  List results = [];
  String see = "Post";
  List<String> books = [];
  String query = '';
  Timer? debouncer;


  @override
  void initState() {
    super.initState();

    init();
  }

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

  Future init() async {
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
  seeMention() {
    setState((){
      see = "Mention";
    });
  }

  Future<List> product() async{
    results = await Scraper.getData2('innisfree');
    return results;
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
                padding: EdgeInsets.only(top: 40, left: 20, right: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /*Container(
                          height: 30,
                          width: 280,
                          decoration: BoxDecoration(
                            color: c.greyLight,
                            borderRadius: BorderRadius.all(Radius.circular(13.0)),
                          ),
                          child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(0, 5.0, 0, 15.0),
                                prefixIcon: Icon(Icons.search,color: c.greyMain,),
                                hintText: "Search",
                                hintStyle: TextStyle(
                                    fontSize: 14, color: c.graySub2, fontWeight: f.medium),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                  borderSide:
                                  BorderSide(color: c.graySub2.withOpacity(0), width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                  borderSide: BorderSide(color: c.greyMain.withOpacity(0.5), width: 1),
                                ),
                              )
                          ),
                        ),*/
                        buildSearch(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Boxicons.bx_slider_alt,
                            size: 30,
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
                                text: " Mention  ",
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
                  scrollDirection: Axis.vertical,
                  itemCount: model.postData?.length??0,
                  itemBuilder: (context,int index){
                    return model.postData![index]['type']=='mention' ? MentionPost(
                      name: model.postData![index]['fullname'],
                      username: model.postData![index]['username'],
                      postTime: model.postData![index]['updatedAt'].toString().substring(0, 10),
                      brand: model.postData![index]['refbrand'],
                      product: model.postData![index]['refproduct'],
                      post: model.postData![index]['body'],
                      comment: model.postData![index]['comment'],
                      favorite: model.postData![index]['favorite'],
                      urlImage: model.postData![index]['coverImage'],
                      professor:model.postData![index]['professor'],
                      influencer: model.postData![index]['influencer'],
                      id: model.postData![index]['_id'],
                    ):Container();
                  },
                ): see == "Review" ? ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: model.postData?.length??0,
                  itemBuilder: (context,int index){
                    return model.postData![index]['type']=='review' ?ReviewPost(
                      name: model.postData![index]['fullname'],
                      username: model.postData![index]['username'],
                      postTime: model.postData![index]['updatedAt'].toString().substring(0, 10),
                      brand: model.postData![index]['refbrand'],
                      product: model.postData![index]['refproduct'],
                      urlImage: model.postData![index]['coverImage'],
                      post: model.postData![index]['body'],
                      rating: model.postData![index]['rating'],
                      comment: model.postData![index]['comment'],
                      favorite: model.postData![index]['favorite'],
                      professor:model.postData![index]['professor'],
                      influencer: model.postData![index]['influencer'],
                      id: model.postData![index]['_id'],
                    ):Container();
                  },
                ): see == "Post" ? ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: model.postData?.length??0,
                  itemBuilder: (context,int index){
                    return model.postData![index]['type']=='post' ? Post(
                        name: model.postData![index]['fullname'],
                        username: model.postData![index]['username'],
                        postTime: model.postData![index]['updatedAt'].toString().substring(0, 10),
                        post: model.postData![index]['body'],
                        comment: model.postData![index]['comment'],
                        favorite: model.postData![index]['favorite'],
                        professor:model.postData![index]['professor'],
                        influencer: model.postData![index]['influencer'],
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
  Widget buildSearch() => SearchWidget(
    text: query,
    hintText: 'Title or Author Name',
    onChanged: searchBook,
  );

  Future searchBook(String query) async => debounce(() async {

    if (!mounted) return;

    setState(() {
    });
  });
}
