import 'dart:io';

import 'package:Florxy/Model/postModel.dart';
import 'package:Florxy/Model/profileModel.dart';
import 'package:Florxy/pages/FavPost.dart';
import 'package:Florxy/pages/ViewPostPage.dart';
import 'package:Florxy/pages/navbar.dart';
import 'package:Florxy/widgets/ModalViewProduct.dart';
import 'package:Florxy/widgets/modelreportpost.dart';
import 'package:boxicons/boxicons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:Florxy/NetworkHandler.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';

import '../Model/aliasColorModel.dart';
import '../pages/anotherProfile.dart';
import '../pages/comparepage.dart';
import 'NotificationWidget.dart';
import 'ViewPhotoWidget.dart';

class Users extends StatefulWidget {
  String? username, id;
  String query, fullname, influencer, professor, img;
  Future? fetchSearchUser;

  Users(
      {Key? key, this.username, required this.fullname, required this.influencer, required this.professor, required this.img,
        this.id, required this.query, this.fetchSearchUser})
      : super(key: key);

  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  final _key = GlobalKey();
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();
  Map? data;

  Color? professor_color, creator_color;
  Professor list_professor_color = Professor();
  Creator list_creator_color = Creator();

  late bool _isLoading;
  @override
  void initState() {
    // TODO: implement initState
    _isLoading = true;
    fetchSearchUser(widget.query);
    super.initState();
  }

  fetchSearchUser(query) async{
    print(query);

    setState(() {
      _isLoading =false;
      int i=0, j=0;
      for(i;i<=list_professor_color.alias_professor.length-1;i++) {
        if(widget.professor==list_professor_color.alias_professor[i].alias){
          setState(() {
            professor_color = list_professor_color.alias_professor[i].color;
          });
        }
      }

      for(j;j<=list_creator_color.alias_creator.length-1;j++) {
        if(widget.influencer==list_creator_color.alias_creator[j].alias){
          setState(() {
            creator_color = list_creator_color.alias_creator[j].color;
          });
        }
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) => Container(
        child:  _isLoading
            ?Padding(
              padding: EdgeInsets.only(left: 23, right: 22, top: 20),
              child: NewCardSkeleton(),
            )
            : Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              child : GestureDetector(
                onTap: () async {
                  var x = await storage.read(key: "username");
                  print(x);
                  print(widget.username);
                  if(x != widget.username){
                    await storage.write(
                        key: "anotherprofile", value: widget.username);
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => anotherProfile( another_username: widget.username )));
                  }
                  else{
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Navbar(currentState: 4)));
                  }
                },
                child: Container(
                  // color: Colors.amber,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                  ),
                  child : Column(
                        children: [
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(left: 23, right: 4),
                            child: Row(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFFE5E5E5)
                                    ),
                                    width: 50,
                                    height: 50,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: CachedNetworkImage(imageUrl: widget.img,fit: BoxFit.cover,errorWidget: (context, url, error) => Container(),),
                                    )
                                ),

                                SizedBox( width: 8 ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Poppins(
                                          text: widget.fullname,
                                          fontWeight: f.semiBold,
                                          size: 13,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                    Inter(text: '@'+widget.username!, size: 11, color: c.textUsername, fontWeight: f.medium),
                                    SizedBox( height: 7 ),
                                    Row(
                                      children: [
                                        (widget.professor=="")?
                                        Container():Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 7, left: 7, top: 4, bottom: 4),
                                            child: Inter(
                                                text: widget.professor,
                                                size: 8,
                                                color: Colors.white,
                                                fontWeight: f.semiBold),
                                          ),
                                          decoration: BoxDecoration(
                                              color: professor_color!,
                                              borderRadius: BorderRadius.circular(10)),
                                        ),
                                        SizedBox( width: 5 ),
                                        (widget.influencer=="")?
                                        Container():Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 5, left: 5, top: 2, bottom: 2),
                                            child: Inter(
                                                text: widget.influencer,
                                                size: 8,
                                                color: creator_color!,
                                                fontWeight: f.bold),
                                          ),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: creator_color!,
                                                width: 2,
                                              ),
                                              borderRadius: BorderRadius.circular(10)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Expanded(child: Container()),
                                Container(
                                  height: 66,
                                  alignment: Alignment.topRight,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 13),
                      ],
                  ),
            ),
              ),
        ),
      ),
    );
  }
}

class Products extends StatefulWidget {
  String? name, id;
  String query, brand, desc, img;
  Future? fetchSearchProduct;

  Products(
      {Key? key, this.name, required this.brand, required this.desc, required this.img,
        this.id, required this.query, this.fetchSearchProduct})
      : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  final _key = GlobalKey();
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();
  Map? data;

  late bool _isLoading;
  @override
  void initState() {
    // TODO: implement initState
    _isLoading = true;
    fetchSearchProduct(widget.query);
    super.initState();
  }

  fetchSearchProduct(query) async{

    setState(() {
      _isLoading =false;
    });
  }


  @override
  Widget build(BuildContext context) {
    print(widget.name);
    print(widget.brand);
    print(widget.img);
    return FutureBuilder(
      builder: (context, snapshot) => Container(
        child:  _isLoading
            ?Padding(
              padding: EdgeInsets.only(left: 23, right: 22,top:  20),
              child: NewCardSkeleton(),
            )
            : Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              child : Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              child : InkWell(
                        onTap: () async{
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => comparepage(id: widget.id, currentState: 0,)));
                          await storage.write(key: "p_id", value: widget.id);
                    },
                       child :  Column(
                          children: [
                            SizedBox(height: 15),
                            Padding(
                              padding: const EdgeInsets.only(left: 23, right: 4),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    width: 50,
                                    height: 100,
                                    child: ClipRRect(
                                      child: CachedNetworkImage(imageUrl: widget.img,fit: BoxFit.fitWidth,errorWidget: (context, url, error) => Container(),),
                                    ),
                                  ),
                                  SizedBox( width: 15 ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 7, left: 7, top: 4, bottom: 4),
                                          child: Inter(
                                              text: widget.brand,
                                              size: 11,
                                              color: Colors.white,
                                              fontWeight: f.semiBold),
                                        ),
                                        decoration: BoxDecoration(
                                            color: c.greySub,
                                            borderRadius: BorderRadius.circular(10)),
                                      ),
                                      SizedBox( height: 7 ),
                                      Container(
                                        width: MediaQuery.of(context).size.width-125,
                                        height: 15,
                                        child: Inter(text: widget.name!, size: 13, color: c.blackMain, fontWeight: f.bold),
                                      ),
                                      SizedBox( height: 7 ),
                                      Container(
                                        width: MediaQuery.of(context).size.width-125,
                                        height: 50,
                                        child: Inter(text: widget.desc, size: 11, color: c.greySub, fontWeight: f.bold),
                                      ),
                                      SizedBox( height: 7 ),
                                    ],
                                  ),
                                  Expanded(child: Container()),
                                  Container(
                                    height: 66,
                                    alignment: Alignment.topRight,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 13),
                      ],
                    ),
                ),
              ),
            ),
      ),
    );
  }
}

class Problems extends StatefulWidget {
  String? username, id;
  String body, postTime;
  Future? fetchProblem;

  Problems(
      {Key? key, this.username, required this.body, required this.postTime, this.id, this.fetchProblem})
      : super(key: key);

  @override
  _ProblemsState createState() => _ProblemsState();
}

class _ProblemsState extends State<Problems> {
  final _key = GlobalKey();
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();
  Map? data;


  late bool _isLoading;
  @override
  void initState() {
    // TODO: implement initState
    _isLoading = true;
    fetchProblem(widget.username);
    super.initState();
  }

  fetchProblem(username) async{

    setState(() {
      _isLoading =false;
    });
  }


  @override
  Widget build(BuildContext context) {
    print(widget.body);
    print(widget.username);
    return FutureBuilder(
      builder: (context, snapshot) => Container(
        child:  _isLoading
            ?Padding(
          padding: EdgeInsets.only(left: 23, right: 22, top: 20),
          child: NewCardSkeleton(),
        )
            : Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child : Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child : Column(
              children: [
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 23, right: 4),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Inter(text: "Problem : ", size: 15, color: c.blackMain, fontWeight: f.medium),
                          SizedBox( height: 7 ),
                          Inter(text: widget.body, size: 15, color: c.blackMain, fontWeight: f.medium),
                          SizedBox( height: 7 ),
                          Inter(text: widget.postTime, size: 15, color: c.blackMain, fontWeight: f.medium),
                        ],
                      ),
                      Expanded(child: Container()),
                      Container(
                        height: 66,
                        alignment: Alignment.topRight,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 13),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Reports extends StatefulWidget {
  String? username, id, mainpost;
  String body, type, postTime;
  Future? fetchProblem;

  Reports(
      {Key? key, this.username, required this.body, required this.type, required this.postTime, this.id, this.mainpost, this.fetchProblem})
      : super(key: key);

  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  final _key = GlobalKey();
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();
  String? Username='';
  Map? data;
  PostModel postModel = PostModel(
      username: "",
  );

  late bool _isLoading;
  @override
  void initState() {
    // TODO: implement initState
    _isLoading = true;
    fetchProblem(widget.username);
    super.initState();
  }

  fetchProblem(username) async{
    var response2 = await networkHandler.get("/home/getIDPost/" + widget.mainpost!);

    setState(() {
      _isLoading =false;
      postModel = PostModel.fromJson(response2["getPost"]);
      Username = postModel.username;
    });
  }


  @override
  Widget build(BuildContext context) {
    print(widget.body);
    print(widget.username);
    return FutureBuilder(
      builder: (context, snapshot) => Container(
        child:  _isLoading
            ?Padding(
          padding: EdgeInsets.only(left: 23, right: 22, top: 20),
          child: NewCardSkeleton(),
        )
            : Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child : Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child : Column(
              children: [
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 23, right: 4),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Inter(text: "Post by : ", size: 15, color: c.blackMain, fontWeight: f.medium),
                              Inter(text: Username!, size: 15, color: c.blackMain, fontWeight: f.medium),
                            ],
                          ),
                          SizedBox( height: 7 ),
                          Row(
                            children: [
                              Inter(text: "Type of Violation : ", size: 15, color: c.blackMain, fontWeight: f.medium),
                              Inter(text: widget.type, size: 15, color: c.blackMain, fontWeight: f.medium),
                            ],
                          ),
                          SizedBox( height: 7 ),
                          Row(
                            children: [
                              Inter(text: "Detail : ", size: 15, color: c.blackMain, fontWeight: f.medium),
                              Inter(text: widget.body, size: 15, color: c.blackMain, fontWeight: f.medium),
                            ],
                          ),
                          SizedBox( height: 7 ),
                          Inter(text: widget.postTime, size: 15, color: c.blackMain, fontWeight: f.medium),
                        ],
                      ),
                      Expanded(child: Container()),
                      Container(
                        height: 66,
                        alignment: Alignment.topRight,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 13),
              ],
            ),
          ),
        ),
      ),
    );
  }
}