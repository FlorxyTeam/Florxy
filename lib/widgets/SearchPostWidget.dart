import 'dart:io';

import 'package:Florxy/Model/postModel.dart';
import 'package:Florxy/Model/profileModel.dart';
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

import '../pages/anotherProfile.dart';
import '../pages/comparepage.dart';
import 'ViewPhotoWidget.dart';

class MentionPosts extends StatefulWidget {
  String? postTime, username, post, id;
  String query;
  int comment;
  List? urlImage;

  MentionPosts(
      {Key? key, this.postTime, this.username, this.post, required this.comment,
        this.urlImage, this.id, required this.query})
      : super(key: key);

  @override
  _MentionPostsState createState() => _MentionPostsState();
}

class _MentionPostsState extends State<MentionPosts> {
  final _key = GlobalKey();
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();
  bool isFav = false;
  List myfav = [];
  String? fullname='',influencer='',professor='';
  List favorite=[];
  List product=[], staticData=[];
  int countFav = 0;
  Map? data;
  PostModel postModel = PostModel(
      favorite: [],
      product: []
  );
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

  ProfileModel myprofileModel = ProfileModel(
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchSearchProductPost(widget.query);
    print("fetchSearchMention");
    print(widget.query);
  }

  fetchSearchProductPost(query) async{
    print(query);
    var response = await networkHandler.get("/profile/getOtherData/" + widget.username!);
    var response2 = await networkHandler.get("/home/getIDPost/" + widget.id!);
    var response3 = await networkHandler.get("/home/getComment/" + widget.id!);

    setState(() {
      profileModel = ProfileModel.fromJson(response["data"]);

      postModel = PostModel.fromJson(response2["getPost"]);

      fullname = profileModel.fullname;
      influencer = profileModel.influencer;
      professor = profileModel.professor;
      favorite = postModel.favorite!;
      countFav = favorite.length;
      product = postModel.product!;


      // print(myprofileModel.favorite);
      // print(myfav);
      // print(pro)
      // if(myfav == myprofileModel.username){
      //   print('same fuck fuck');
      // }
      // print(myfav);
      widget.comment = response3["countComment"];

    });
  }

  fetchComment () async {
    var response4 = await networkHandler.get("/profile/getData/");
    var response3 = await networkHandler.get("/home/getComment/" + widget.id!);
    setState(() {
      widget.comment = response3["countComment"];
      myprofileModel = ProfileModel.fromJson(response4["data"]);
      myfav = myprofileModel.favorite;
      var i=0;
      for(i;i<myfav.length;i++){
        if(widget.id == myfav[i]){
          // print(widget.id);
          // print(myfav[i]);
          // print('same naja'+i.toString());
          setState(() {
            isFav = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if( product != null && product.length !=0 ){
      data = product[0];
    }
    return FutureBuilder(
      future: fetchComment(),
      builder: (context, snapshot) => Container(
        child: Column(
          children: [
            SizedBox(height: 8),
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
                        child: CachedNetworkImage(imageUrl: profileModel.img,fit: BoxFit.cover,errorWidget: (context, url, error) => Container(),),
                      )
                  ),

                  SizedBox( width: 8 ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            child: Poppins(
                              text: fullname!,
                              fontWeight: f.semiBold,
                              size: 13,
                              color: Colors.black,
                            ),
                            onTap: () async {
                              var x = await storage.read(key: "username");
                              print('fuck leo');
                              print(x);
                              print(widget.username);
                              if(x != widget.username){
                                await storage.write(
                                    key: "anotherprofile", value: widget.username);
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => anotherProfile()));
                              }
                              else{
                                Navbar(currentState: 4);
                              }
                            },
                          ),
                          SizedBox( width: 5 ),
                          Inter(text: widget.postTime!, size: 11, color: c.graySub2, fontWeight: f.medium)
                        ],
                      ),
                      Inter(text: '@'+widget.username!, size: 11, color: c.textUsername, fontWeight: f.medium),
                      SizedBox( height: 7 ),
                      Row(
                        children: [
                          (professor=="")?
                          Container():Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 7, left: 7, top: 4, bottom: 4),
                              child: Inter(
                                  text: professor!,
                                  size: 8,
                                  color: Colors.white,
                                  fontWeight: f.semiBold),
                            ),
                            decoration: BoxDecoration(
                                color: c.greenMain,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          SizedBox( width: 5 ),
                          (influencer=="")?
                          Container():Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 5, left: 5, top: 2, bottom: 2),
                              child: Inter(
                                  text: influencer!,
                                  size: 8,
                                  color: c.blueMain,
                                  fontWeight: f.bold),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: c.blueMain,
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
                    child: IconButton(
                      onPressed: () {
                        ModalBottomSheetPost.Dialog_Settings(context);
                      },
                      alignment: Alignment.topRight,
                      icon: Icon(Boxicons.bx_dots_vertical_rounded, size: 30, color: c.greyMain),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 80, right: 23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if(widget.urlImage?.length==null)Container(),
                  if(widget.urlImage?.length==1)Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            key: _key,
                            height: 285,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: c.graySub2,
                                image: DecorationImage(
                                    image: NetworkImage(widget.urlImage![0]),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                              urlImage: widget.urlImage,
                            )));
                          },
                        ),
                      ),
                    ],
                  ),
                  if(widget.urlImage?.length==2)Row(
                    children: [
                      // SizedBox(width: 60),
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            height: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    bottomLeft: Radius.circular(12)
                                ),
                                color: c.graySub2,
                                image: DecorationImage(
                                    image: NetworkImage(widget.urlImage![0]),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                              urlImage: widget.urlImage,
                            )));
                          },
                        ),
                      ),
                      SizedBox( width: 5 ),
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            height: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(12),
                                    bottomRight: Radius.circular(12)
                                ),
                                color: c.graySub2,
                                image: DecorationImage(
                                    image: NetworkImage(widget.urlImage![1]),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                urlImage: widget.urlImage,
                                index: 2
                            )));
                          },
                        ),
                      )
                    ],
                  ),
                  if(widget.urlImage?.length==3)Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                key: _key,
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![0]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                  urlImage: widget.urlImage,
                                )));
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox( height: 5 ),
                      Row(
                        children: [
                          // SizedBox(width: 60),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        bottomLeft: Radius.circular(12)
                                    ),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![1]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                  urlImage: widget.urlImage,
                                )));
                              },
                            ),
                          ),
                          SizedBox( width: 5 ),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        bottomRight: Radius.circular(12)
                                    ),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![2]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                    urlImage: widget.urlImage,
                                    index: 2
                                )));
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  if(widget.urlImage?.length==4)Column(
                    children: [
                      Row(
                        children: [
                          // SizedBox(width: 60),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        bottomLeft: Radius.circular(12)
                                    ),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![0]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                  urlImage: widget.urlImage,
                                )));
                              },
                            ),
                          ),
                          SizedBox( width: 5 ),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        bottomRight: Radius.circular(12)
                                    ),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![1]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                    urlImage: widget.urlImage,
                                    index: 2
                                )));
                              },
                            ),
                          )
                        ],
                      ),
                      SizedBox( height: 5 ),
                      Row(
                        children: [
                          // SizedBox(width: 60),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        bottomLeft: Radius.circular(12)
                                    ),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![2]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                  urlImage: widget.urlImage,
                                )));
                              },
                            ),
                          ),
                          SizedBox( width: 5 ),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        bottomRight: Radius.circular(12)
                                    ),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![3]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                    urlImage: widget.urlImage,
                                    index: 2
                                )));
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  if(widget.urlImage?.length!=null)SizedBox(height: 10),
                  if(widget.urlImage?.length!=null)Row(
                    children: [
                      // SizedBox(width: 60),
                      Inter(text: 'mention to', size: 11, color: c.blackMain, fontWeight: f.medium),
                      SizedBox(width: 5),
                      Container(
                        child: Padding(
                            padding: const EdgeInsets.only(left: 9, right: 4, top: 3, bottom: 3),
                            child: product.length == 1?GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => comparepage(id: '${data?['_id']}', currentState: 0)));
                              },
                              child: Row(
                                children: [
                                  Container(
                                    constraints: BoxConstraints(maxWidth: 160),
                                    child: Inter_Crop(
                                        text: '${data?['p_brand']}' + " " + '${data?['p_name']}',
                                        size: 10,
                                        color: c.tag,
                                        fontWeight: f.semiBold
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(FeatherIcons.chevronRight, size: 14, color: c.tag),
                                ],
                              ),
                            ):(product.length == 2 || product.length == 3 || product.length == 4)?
                            GestureDetector(
                              onTap: () {
                                ModalViewProduct.Dialog_Settings(context ,product);
                              },
                              child: Row(
                                children: [
                                  Inter_Crop(
                                      text: product.length.toString() + " products",
                                      size: 10,
                                      color: c.tag,
                                      fontWeight: f.semiBold
                                  ),
                                  SizedBox(width: 4),
                                  Icon(FeatherIcons.chevronRight, size: 14, color: c.tag),
                                ],
                              ),
                            ):Container()
                        ),
                        decoration: BoxDecoration(
                            color: c.greenLight2,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ],
                  ),
                  if(widget.urlImage?.length!=null)SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      // var product = '${data!['p_name']}';
                      // product = product.replaceAll(" ","_");
                      // var res = await networkHandler.get("/home/getPost/viewPost/" + widget.id! + "/" + product);
                      // print(res);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewPost(
                        img: profileModel.img,
                        username: widget.username,
                        fullname: fullname,
                        id: widget.id,
                        body: widget.post,
                        urlImage: widget.urlImage,
                        listProduct : product,
                        professor: professor,
                        influencer: influencer,
                        comment: widget.comment,
                        favorite: countFav,

                      )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Inter(text: widget.post!, size: 12, color: c.postText, fontWeight: f.regular),
                    ),
                  ),
                  if(widget.urlImage?.length==null)SizedBox(height: 8),
                  if(widget.urlImage?.length==null)Row(
                    children: [
                      // SizedBox(width: 60),
                      Inter(text: 'mention to', size: 11, color: c.blackMain, fontWeight: f.medium),
                      SizedBox(width: 5),
                      Container(
                        child: Padding(
                            padding: const EdgeInsets.only(left: 9, right: 4, top: 3, bottom: 3),
                            child: product.length == 1?GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => comparepage(id: '${data?['_id']}', currentState: 0)));
                              },
                              child: Row(
                                children: [
                                  Container(
                                    constraints: BoxConstraints(maxWidth: 160),
                                    child: Inter_Crop(
                                        text: '${data?['p_brand']}' + " " + '${data?['p_name']}',
                                        size: 10,
                                        color: c.tag,
                                        fontWeight: f.semiBold
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(FeatherIcons.chevronRight, size: 14, color: c.tag),
                                ],
                              ),
                            ):product.length == 2 && product.length == 3 && product.length == 4?
                            GestureDetector(
                              onTap: () {
                                ModalViewProduct.Dialog_Settings(context ,product);
                              },
                              child: Row(
                                children: [
                                  Inter_Crop(
                                      text: product.length.toString() + " products",
                                      size: 10,
                                      color: c.tag,
                                      fontWeight: f.semiBold
                                  ),
                                  SizedBox(width: 4),
                                  Icon(FeatherIcons.chevronRight, size: 14, color: c.tag),
                                ],
                              ),
                            ):Container()
                        ),
                        decoration: BoxDecoration(
                            color: c.greenLight2,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(FeatherIcons.messageSquare, size:19, color: c.greyMain),
                      SizedBox(width: 3),
                      Inter(text: widget.comment.toString(), size: 11, color: c.greyMain, fontWeight: f.medium),
                      Expanded(child: Container()),
                      if(isFav == false)InkWell(
                          onTap: () async {
                            // Map<String, String> data = {
                            //   "favorite":widget.id!
                            // };
                            // print(data);
                            // var idStorage = await storage.read(key: 'id');
                            // await networkHandler.post("/home/addFav/" + idStorage!, data);
                            setState(() {
                              countFav+=1;
                              isFav = true;
                            });
                          },
                          child: Icon(FeatherIcons.heart, size:19, color: c.greyMain)
                      ),
                      if(isFav == true)InkWell(
                          onTap: () async {
                            // Map<String, String> data = {
                            //   "favorite":widget.id!
                            // };
                            // print(data);
                            // var idStorage = await storage.read(key: 'id');
                            // await networkHandler.post("/home/unFav/" + idStorage!, data);
                            setState(() {
                              countFav-=1;
                              isFav = false;
                            });
                          },
                          child: Icon(Boxicons.bxs_heart, size:19, color: c.redMain)
                      ),
                      SizedBox(width: 3),
                      if(isFav == false)Inter(text: countFav.toString(), size: 11, color: c.greyMain, fontWeight: f.medium),
                      if(isFav == true)Inter(text: countFav.toString(), size: 11, color: c.redMain, fontWeight: f.medium),
                      Expanded(child: Container()),
                      IconButton(
                        icon: Icon(FeatherIcons.share2, size:19, color: c.greyMain),
                        onPressed: () async {
                          final urlImage = 'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1608828061-skinceuticals-1544737345.jpg?crop=1xw:1xh;center,top&resize=768:*';
                          final url = Uri.parse(urlImage);
                          final response = await http.get(url);
                          final bytes = response.bodyBytes;

                          final temp = await getTemporaryDirectory();
                          final path = '${temp.path}/image.jpg';
                          File(path).writeAsBytesSync(bytes);

                          await Share.shareFiles([path], text: 'This is Skin Ceuticals.');
                        },
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 6),
            Divider(
              color: c.greyMain,
              thickness: 0.5,
              height: 0,
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewPosts extends StatefulWidget {
  String? postTime, username, post, id;
  String query;
  int comment;
  double rating;
  List? urlImage;

  ReviewPosts(
      {Key? key,this.postTime, this.username, this.post, required this.comment, this.urlImage, this.id, required this.rating, required this.query})
      : super(key: key);

  @override
  _ReviewPostsState createState() => _ReviewPostsState();
}

class _ReviewPostsState extends State<ReviewPosts> {
  final _key = GlobalKey();
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();
  bool isFav = false;

  String? fullname='',influencer='',professor='';
  List? favorite=[];
  List product=[];
  Map? data;
  int countFav = 0;
  PostModel postModel = PostModel(
      favorite: [],
      product: []
  );

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
  List myfav = [];
  ProfileModel myprofileModel = ProfileModel(
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchSearchProductPost(widget.query);
    print("fetchSearchReview");
    print(widget.query);
  }

  fetchSearchProductPost(query) async{
    print(query);
    var response = await networkHandler.get("/profile/getOtherData/"+ widget.username!);
    var response2 = await networkHandler.get("/home/getIDPost/" + widget.id!);
    var response3 = await networkHandler.get("/home/getComment/" + widget.id!);
    setState(() {
      profileModel = ProfileModel.fromJson(response["data"]);
      fullname = profileModel.fullname;
      influencer = profileModel.influencer;
      professor = profileModel.professor;

      postModel = PostModel.fromJson(response2["getPost"]);
      favorite = postModel.favorite!;
      countFav = favorite!.length;

      product = postModel.product!;

      widget.comment = response3["countComment"];
    });
  }

  fetchComment () async {
    var response4 = await networkHandler.get("/profile/getData/");
    var response3 = await networkHandler.get("/home/getComment/" + widget.id!);
    setState(() {
      widget.comment = response3["countComment"];
      myprofileModel = ProfileModel.fromJson(response4["data"]);
      myfav = myprofileModel.favorite;
      var i=0;
      for(i;i<myfav.length;i++){
        if(widget.id == myfav[i]){
          // print(widget.id);
          // print(myfav[i]);
          // print('same naja'+i.toString());
          setState(() {
            isFav = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if( product != null && product.length !=0 ){
      data = product[0];
    }
    return FutureBuilder(
      future: fetchComment(),
      builder: (context, snapshot) => Container(
        child: Column(
          children: [
            SizedBox(height: 8),
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
                        child: CachedNetworkImage(imageUrl: profileModel.img,fit: BoxFit.cover,errorWidget: (context, url, error) => Container(),),
                      )
                  ),
                  SizedBox( width: 8 ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            child: Poppins(
                              text: fullname!,
                              fontWeight: f.semiBold,
                              size: 13,
                              color: Colors.black,
                            ),
                            onTap: () async {

                              var x = await storage.read(key: "username");
                              print('fuck leo');
                              print(x);
                              print(widget.username);
                              if(x != widget.username){
                                await storage.write(
                                    key: "anotherprofile", value: widget.username);
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => anotherProfile()));
                              }
                              else{
                                Navbar(currentState: 4);
                              }

                            },
                          ),
                          SizedBox( width: 5 ),
                          Inter(text: widget.postTime!, size: 11, color: c.graySub2, fontWeight: f.medium)
                        ],
                      ),
                      Inter(text: '@'+widget.username!, size: 11, color: c.textUsername, fontWeight: f.medium),
                      SizedBox( height: 7 ),
                      Row(
                        children: [
                          (professor=="")?
                          Container():Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 7, left: 7, top: 4, bottom: 4),
                              child: Inter(
                                  text: professor!,
                                  size: 8,
                                  color: Colors.white,
                                  fontWeight: f.semiBold),
                            ),
                            decoration: BoxDecoration(
                                color: c.greenMain,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          SizedBox( width: 5 ),
                          (influencer=="")?
                          Container():Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 5, left: 5, top: 2, bottom: 2),
                              child: Inter(
                                  text: influencer!,
                                  size: 8,
                                  color: c.blueMain,
                                  fontWeight: f.bold),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: c.blueMain,
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
                    child: IconButton(
                      onPressed: () {
                        ModalBottomSheetPost.Dialog_Settings(context);
                      },
                      alignment: Alignment.topRight,
                      icon: Icon(Boxicons.bx_dots_vertical_rounded, size: 30, color: c.greyMain),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 80, right: 23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if(widget.urlImage?.length==null)Container(),
                  if(widget.urlImage?.length==1)Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            key: _key,
                            height: 285,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: c.graySub2,
                                image: DecorationImage(
                                    image: NetworkImage(widget.urlImage![0]),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                              urlImage: widget.urlImage,
                            )));
                          },
                        ),
                      ),
                    ],
                  ),
                  if(widget.urlImage?.length==2)Row(
                    children: [
                      // SizedBox(width: 60),
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            height: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    bottomLeft: Radius.circular(12)
                                ),
                                color: c.graySub2,
                                image: DecorationImage(
                                    image: NetworkImage(widget.urlImage![0]),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                              urlImage: widget.urlImage,
                            )));
                          },
                        ),
                      ),
                      SizedBox( width: 5 ),
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            height: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(12),
                                    bottomRight: Radius.circular(12)
                                ),
                                color: c.graySub2,
                                image: DecorationImage(
                                    image: NetworkImage(widget.urlImage![1]),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                urlImage: widget.urlImage,
                                index: 2
                            )));
                          },
                        ),
                      )
                    ],
                  ),
                  if(widget.urlImage?.length==3)Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                key: _key,
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![0]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                  urlImage: widget.urlImage,
                                )));
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox( height: 5 ),
                      Row(
                        children: [
                          // SizedBox(width: 60),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        bottomLeft: Radius.circular(12)
                                    ),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![1]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                  urlImage: widget.urlImage,
                                )));
                              },
                            ),
                          ),
                          SizedBox( width: 5 ),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        bottomRight: Radius.circular(12)
                                    ),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![2]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                    urlImage: widget.urlImage,
                                    index: 2
                                )));
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  if(widget.urlImage?.length==4)Column(
                    children: [
                      Row(
                        children: [
                          // SizedBox(width: 60),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        bottomLeft: Radius.circular(12)
                                    ),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![0]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                  urlImage: widget.urlImage,
                                )));
                              },
                            ),
                          ),
                          SizedBox( width: 5 ),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        bottomRight: Radius.circular(12)
                                    ),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![1]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                    urlImage: widget.urlImage,
                                    index: 2
                                )));
                              },
                            ),
                          )
                        ],
                      ),
                      SizedBox( height: 5 ),
                      Row(
                        children: [
                          // SizedBox(width: 60),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        bottomLeft: Radius.circular(12)
                                    ),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![2]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                  urlImage: widget.urlImage,
                                )));
                              },
                            ),
                          ),
                          SizedBox( width: 5 ),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        bottomRight: Radius.circular(12)
                                    ),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![3]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                    urlImage: widget.urlImage,
                                    index: 2
                                )));
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  if(widget.urlImage?.length!=null)SizedBox(height: 10),
                  if(widget.urlImage?.length!=null)Row(
                    children: [
                      // SizedBox(width: 60),
                      Inter(text: 'reviewed', size: 11, color: c.blackMain, fontWeight: f.medium),
                      SizedBox(width: 5),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 9, right: 4,top: 2.5,bottom: 2.5),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => comparepage(id: '${data?['_id']}', currentState: 0)));
                            },
                            child: Row(
                              children: [
                                Container(
                                  constraints: BoxConstraints(maxWidth: 125),
                                  child: Inter_Crop(
                                      text: '${data?['p_brand']}' + " " + '${data?['p_name']}',
                                      size: 10,
                                      color: c.tag,
                                      fontWeight: f.semiBold
                                  ),
                                ),
                                SizedBox(width: 7),
                                Inter(
                                    text: widget.rating.toString(),
                                    size: 10,
                                    color: c.tag,
                                    fontWeight: f.semiBold
                                ),
                                SizedBox(width: 2),
                                Icon(Boxicons.bxs_star, size: 13, color: c.tag),
                                SizedBox(width: 4),
                                Icon(FeatherIcons.chevronRight, size: 14, color: c.tag),
                              ],
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: c.greenLight2,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ],
                  ),
                  if(widget.urlImage?.length!=null)SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      // var product = '${data!['p_name']}';
                      // product = product.replaceAll(" ","_");
                      // var res = await networkHandler.get("/home/getPost/viewPost/" + widget.id! + "/" + product);
                      // print(res);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewPost(
                        img: profileModel.img,
                        username: widget.username,
                        fullname: fullname,
                        id: widget.id,
                        body: widget.post,
                        urlImage: widget.urlImage,
                        listProduct : product,
                        professor: professor,
                        influencer: influencer,
                        comment: widget.comment,
                        favorite: countFav,

                      )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Inter(text: widget.post!, size: 12, color: c.postText, fontWeight: f.regular),
                    ),
                  ),
                  if(widget.urlImage?.length==null)SizedBox(height: 8),
                  if(widget.urlImage?.length==null)Row(
                    children: [
                      // SizedBox(width: 60),
                      Inter(text: 'reviewed', size: 11, color: c.blackMain, fontWeight: f.medium),
                      SizedBox(width: 5),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 9, right: 4,top: 2.5,bottom: 2.5),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => comparepage(id: '${data?['_id']}', currentState: 0)));
                            },
                            child: Row(
                              children: [
                                // Inter(
                                //     text: brand!,
                                //     size: 10,
                                //     color: Colors.white,
                                //     fontWeight: f.semiBold
                                // ),
                                // SizedBox(
                                //     height: 20,
                                //     child: VerticalDivider(
                                //       color: Colors.white,
                                //       thickness: 1.5,
                                //       indent: 3.3,
                                //       endIndent: 3.3,
                                //       width: 13,
                                //     )
                                // ),
                                Container(
                                  constraints: BoxConstraints(maxWidth: 125),
                                  child: Inter_Crop(
                                      text: '${data?['p_brand']}' + " " + '${data?['p_name']}',
                                      size: 10,
                                      color: c.tag,
                                      fontWeight: f.semiBold
                                  ),
                                ),
                                SizedBox(width: 7),
                                Inter(
                                    text: widget.rating.toString(),
                                    size: 10,
                                    color: c.tag,
                                    fontWeight: f.semiBold
                                ),
                                SizedBox(width: 2),
                                Icon(Boxicons.bxs_star, size: 13, color: c.tag),
                                SizedBox(width: 4),
                                Icon(FeatherIcons.chevronRight, size: 14, color: c.tag),
                              ],
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: c.greenLight2,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(FeatherIcons.messageSquare, size:19, color: c.greyMain),
                      SizedBox(width: 3),
                      Inter(text: widget.comment.toString(), size: 11, color: c.greyMain, fontWeight: f.medium),
                      Expanded(child: Container()),
                      if(isFav == false)InkWell(
                          onTap: () async {
                            // Map<String, String> data = {
                            //   "favorite":widget.id!
                            // };
                            // print(data);
                            // var idStorage = await storage.read(key: 'id');
                            // await networkHandler.post("/home/addFav/" + idStorage!, data);
                            setState(() {
                              countFav+=1;
                              isFav = true;
                            });
                          },
                          child: Icon(FeatherIcons.heart, size:19, color: c.greyMain)
                      ),
                      if(isFav == true)InkWell(
                          onTap: () async {
                            // Map<String, String> data = {
                            //   "favorite":widget.id!
                            // };
                            // print(data);
                            // var idStorage = await storage.read(key: 'id');
                            // await networkHandler.post("/home/unFav/" + idStorage!, data);
                            setState(() {
                              countFav-=1;
                              isFav = false;
                            });
                          },
                          child: Icon(Boxicons.bxs_heart, size:19, color: c.redMain)
                      ),
                      SizedBox(width: 3),
                      if(isFav == false)Inter(text: countFav.toString(), size: 11, color: c.greyMain, fontWeight: f.medium),
                      if(isFav == true)Inter(text: countFav.toString(), size: 11, color: c.redMain, fontWeight: f.medium),
                      Expanded(child: Container()),
                      IconButton(
                        icon: Icon(FeatherIcons.share2, size:19, color: c.greyMain),
                        onPressed: () async {
                          final urlImage = 'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1608828061-skinceuticals-1544737345.jpg?crop=1xw:1xh;center,top&resize=768:*';
                          final url = Uri.parse(urlImage);
                          final response = await http.get(url);
                          final bytes = response.bodyBytes;

                          final temp = await getTemporaryDirectory();
                          final path = '${temp.path}/image.jpg';
                          File(path).writeAsBytesSync(bytes);

                          await Share.shareFiles([path], text: 'This is Skin Ceuticals.');
                        },
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 6),
            Divider(
              color: c.greyMain,
              thickness: 0.5,
              height: 0,
            ),
          ],
        ),
      ),
    );
  }
}

class Posts extends StatefulWidget {
  String? postTime, username, post, id;
  String query;
  int comment;
  List? urlImage;

  Posts(
      {Key? key, this.postTime, this.username, this.post, required this.comment,this.urlImage, this.id, required this.query})
      : super(key: key);

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  final _key = GlobalKey();
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();
  bool isFav = false;
  String? fullname='',influencer='',professor='';
  List? favorite=[];
  int countFav = 0;
  PostModel postModel = PostModel(
      favorite: [],
      product: []
  );
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
  List myfav = [];
  ProfileModel myprofileModel = ProfileModel(
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
  @override
  void initState() {
    fetchSearchProductPost(widget.query);
    // TODO: implement initState
    super.initState();
    print("fetchSearchPost");
    print(widget.query);
  }

  fetchSearchProductPost(query) async{
    print(query);
    var response = await networkHandler.get("/profile/getOtherData/" + widget.username!);
    var response2 = await networkHandler.get("/home/getIDPost/" + widget.id!);
    var response3 = await networkHandler.get("/home/getComment/" + widget.id!);
    setState(() {
      profileModel = ProfileModel.fromJson(response["data"]);
      fullname = profileModel.fullname;
      influencer = profileModel.influencer;
      professor = profileModel.professor;

      postModel = PostModel.fromJson(response2["getPost"]);
      favorite = postModel.favorite!;
      countFav = favorite!.length;

      widget.comment = response3["countComment"];
    });
  }

  fetchComment () async {
    var response4 = await networkHandler.get("/profile/getData/");
    var response3 = await networkHandler.get("/home/getComment/" + widget.id!);
    setState(() {

      widget.comment = response3["countComment"];
      myprofileModel = ProfileModel.fromJson(response4["data"]);
      myfav = myprofileModel.favorite;
      var i=0;
      for(i;i<myfav.length;i++){
        if(widget.id == myfav[i]){
          // print(widget.id);
          // print(myfav[i]);
          // print('same naja'+i.toString());
          setState(() {
            isFav = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchComment(),
      builder: (context, snapshot) => Container(
        child: Column(
          children: [
            SizedBox(height: 8),
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
                        child: CachedNetworkImage(imageUrl: profileModel.img,fit: BoxFit.cover,errorWidget: (context, url, error) => Container(),),
                      )
                  ),
                  SizedBox( width: 8 ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            child: Poppins(
                              text: fullname!,
                              fontWeight: f.semiBold,
                              size: 13,
                              color: Colors.black,
                            ),
                            onTap: () async {
                              var x = await storage.read(key: "username");
                              print('fuck leo');
                              print(x);
                              print(widget.username);
                              if(x != widget.username){
                                await storage.write(
                                    key: "anotherprofile", value: widget.username);
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => anotherProfile()));
                              }
                              else{
                                Navbar(currentState: 4);
                              }
                            },
                          ),
                          SizedBox( width: 5 ),
                          Inter(text: widget.postTime!, size: 11, color: c.graySub2, fontWeight: f.medium)
                        ],
                      ),
                      Inter(text: '@'+widget.username!, size: 11, color: c.textUsername, fontWeight: f.medium),
                      SizedBox( height: 7 ),
                      Row(
                        children: [
                          (professor=="")?
                          Container():Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 7, left: 7, top: 4, bottom: 4),
                              child: Inter(
                                  text: professor!,
                                  size: 8,
                                  color: Colors.white,
                                  fontWeight: f.semiBold),
                            ),
                            decoration: BoxDecoration(
                                color: c.greenMain,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          SizedBox( width: 5 ),
                          (influencer=="")?
                          Container():Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 5, left: 5, top: 2, bottom: 2),
                              child: Inter(
                                  text: influencer!,
                                  size: 8,
                                  color: c.blueMain,
                                  fontWeight: f.bold),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: c.blueMain,
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
                    child: IconButton(
                      onPressed: () {
                        ModalBottomSheetPost.Dialog_Settings(context);
                      },
                      alignment: Alignment.topRight,
                      icon: Icon(Boxicons.bx_dots_vertical_rounded, size: 30, color: c.greyMain),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 80, right: 23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if(widget.urlImage?.length==null)Container(),
                  if(widget.urlImage?.length==1)Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            key: _key,
                            height: 285,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: c.graySub2,
                                image: DecorationImage(
                                    image: NetworkImage(widget.urlImage![0]),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                              urlImage: widget.urlImage,
                            )));
                          },
                        ),
                      ),
                    ],
                  ),
                  if(widget.urlImage?.length==2)Row(
                    children: [
                      // SizedBox(width: 60),
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            height: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    bottomLeft: Radius.circular(12)
                                ),
                                color: c.graySub2,
                                image: DecorationImage(
                                    image: NetworkImage(widget.urlImage![0]),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                              urlImage: widget.urlImage,
                            )));
                          },
                        ),
                      ),
                      SizedBox( width: 5 ),
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            height: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(12),
                                    bottomRight: Radius.circular(12)
                                ),
                                color: c.graySub2,
                                image: DecorationImage(
                                    image: NetworkImage(widget.urlImage![1]),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                urlImage: widget.urlImage,
                                index: 2
                            )));
                          },
                        ),
                      )
                    ],
                  ),
                  if(widget.urlImage?.length==3)Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                key: _key,
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![0]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                  urlImage: widget.urlImage,
                                )));
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox( height: 5 ),
                      Row(
                        children: [
                          // SizedBox(width: 60),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        bottomLeft: Radius.circular(12)
                                    ),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![1]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                  urlImage: widget.urlImage,
                                )));
                              },
                            ),
                          ),
                          SizedBox( width: 5 ),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        bottomRight: Radius.circular(12)
                                    ),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![2]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                    urlImage: widget.urlImage,
                                    index: 2
                                )));
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  if(widget.urlImage?.length==4)Column(
                    children: [
                      Row(
                        children: [
                          // SizedBox(width: 60),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        bottomLeft: Radius.circular(12)
                                    ),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![0]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                  urlImage: widget.urlImage,
                                )));
                              },
                            ),
                          ),
                          SizedBox( width: 5 ),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        bottomRight: Radius.circular(12)
                                    ),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![1]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                    urlImage: widget.urlImage,
                                    index: 2
                                )));
                              },
                            ),
                          )
                        ],
                      ),
                      SizedBox( height: 5 ),
                      Row(
                        children: [
                          // SizedBox(width: 60),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        bottomLeft: Radius.circular(12)
                                    ),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![2]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                  urlImage: widget.urlImage,
                                )));
                              },
                            ),
                          ),
                          SizedBox( width: 5 ),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        bottomRight: Radius.circular(12)
                                    ),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![3]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                    urlImage: widget.urlImage,
                                    index: 2
                                )));
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  if(widget.urlImage?.length!=null)SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      // var res = await networkHandler.get("/home/getPost/viewPost/" + widget.id!);
                      // print(res);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewPost(
                        img: profileModel.img,
                        username: widget.username,
                        fullname: fullname,
                        id: widget.id,
                        body: widget.post,
                        urlImage: widget.urlImage,
                        professor: professor,
                        influencer: influencer,
                        comment: widget.comment,
                        favorite: countFav,

                      )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Inter(text: widget.post!, size: 12, color: c.postText, fontWeight: f.regular),
                    ),
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(FeatherIcons.messageSquare, size:19, color: c.greyMain),
                      SizedBox(width: 3),
                      Inter(text: widget.comment.toString(), size: 11, color: c.greyMain, fontWeight: f.medium),
                      Expanded(child: Container()),
                      if(isFav == false)InkWell(
                          onTap: () async {
                            // Map<String, String> data = {
                            //   "favorite":widget.id!
                            // };
                            // print(data);
                            // var idStorage = await storage.read(key: 'id');
                            // await networkHandler.post("/home/addFav/" + idStorage!, data);
                            setState(() {
                              countFav+=1;
                              isFav = true;
                            });
                          },
                          child: Icon(FeatherIcons.heart, size:19, color: c.greyMain)
                      ),
                      if(isFav == true)InkWell(
                          onTap: () async {
                            // Map<String, String> data = {
                            //   "favorite":widget.id!
                            // };
                            // print(data);
                            // var idStorage = await storage.read(key: 'id');
                            // await networkHandler.post("/home/unFav/" + idStorage!, data);
                            setState(() {
                              countFav-=1;
                              isFav = false;
                            });
                          },
                          child: Icon(Boxicons.bxs_heart, size:19, color: c.redMain)
                      ),
                      SizedBox(width: 3),
                      if(isFav == false)Inter(text: countFav.toString(), size: 11, color: c.greyMain, fontWeight: f.medium),
                      if(isFav == true)Inter(text: countFav.toString(), size: 11, color: c.redMain, fontWeight: f.medium),
                      Expanded(child: Container()),
                      IconButton(
                        icon: Icon(FeatherIcons.share2, size:19, color: c.greyMain),
                        onPressed: () async {
                          final urlImage = 'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1608828061-skinceuticals-1544737345.jpg?crop=1xw:1xh;center,top&resize=768:*';
                          final url = Uri.parse(urlImage);
                          final response = await http.get(url);
                          final bytes = response.bodyBytes;

                          final temp = await getTemporaryDirectory();
                          final path = '${temp.path}/image.jpg';
                          File(path).writeAsBytesSync(bytes);

                          await Share.shareFiles([path], text: 'This is Skin Ceuticals.');
                        },
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 6),
            Divider(
              color: c.greyMain,
              thickness: 0.5,
              height: 0,
            ),
          ],
        ),
      ),
    );
  }
}



/////////////////////////////////////////////////////////

class MentionPosts2 extends StatefulWidget {
  String? name, postTime, username, post, id,professor,influencer, profileImg;
  String query;
  int comment;
  List? urlImage;

  MentionPosts2(
      {Key? key, this.name, this.postTime, this.profileImg, this.username, this.post, required this.comment, required this.professor, required this.influencer
        ,this.urlImage, this.id, required this.query})
      : super(key: key);

  @override
  _MentionPosts2State createState() => _MentionPosts2State();
}

class _MentionPosts2State extends State<MentionPosts2> {
  final _key = GlobalKey();
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();
  bool isFav = false;
  List favorite=[];
  List product=[], staticData=[];
  int countFav = 0;
  Map? data;
  PostModel postModel = PostModel(
      favorite: [],
      product: []
  );
  List myfav = [];
  ProfileModel myprofileModel = ProfileModel(
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchSearchProductPost(widget.query);
  }

  fetchSearchProductPost(query) async{
    var response2 = await networkHandler.get("/home/getIDPost/" + widget.id!);
    var response3 = await networkHandler.get("/home/getComment/" + widget.id!);
    setState(() {
      postModel = PostModel.fromJson(response2["getPost"]);

      favorite = postModel.favorite!;
      countFav = favorite.length;

      product = postModel.product!;
      print('product');
      print(product);
      widget.comment = response3["countComment"];
    });
  }

  fetchComment () async {
    var response4 = await networkHandler.get("/profile/getData/");
    var response3 = await networkHandler.get("/home/getComment/" + widget.id!);
    setState(() {
      widget.comment = response3["countComment"];
      myprofileModel = ProfileModel.fromJson(response4["data"]);
      myfav = myprofileModel.favorite;
      var i=0;
      for(i;i<myfav.length;i++){
        if(widget.id == myfav[i]){
          // print(widget.id);
          // print(myfav[i]);
          // print('same naja'+i.toString());
          setState(() {
            isFav = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if( product != null && product.length !=0 ){
      data = product[0];
    }
    return FutureBuilder(
      future: fetchComment(),
      builder: (context, snapshot) => Container(
        child: Column(
          children: [
            SizedBox(height: 8),
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
                        child: CachedNetworkImage(imageUrl: widget.profileImg!,fit: BoxFit.cover,errorWidget: (context, url, error) => Container(),),
                      )
                  ),

                  SizedBox( width: 8 ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            child: Poppins(
                              text: widget.name!,
                              fontWeight: f.semiBold,
                              size: 13,
                              color: Colors.black,
                            ),
                            onTap: () async {
                              var x = await storage.read(key: "username");
                              print('fuck leo');
                              print(x);
                              print(widget.username);
                              if(x != widget.username){
                                await storage.write(
                                    key: "anotherprofile", value: widget.username);
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => anotherProfile()));
                              }
                              else{
                                Navbar(currentState: 4);
                              }
                            },
                          ),
                          SizedBox( width: 5 ),
                          Inter(text: widget.postTime!, size: 11, color: c.graySub2, fontWeight: f.medium)
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
                                  text: widget.professor!,
                                  size: 8,
                                  color: Colors.white,
                                  fontWeight: f.semiBold),
                            ),
                            decoration: BoxDecoration(
                                color: c.greenMain,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          SizedBox( width: 5 ),
                          (widget.influencer=="")?
                          Container():Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 5, left: 5, top: 2, bottom: 2),
                              child: Inter(
                                  text: widget.influencer!,
                                  size: 8,
                                  color: c.blueMain,
                                  fontWeight: f.bold),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: c.blueMain,
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
                    child: IconButton(
                      onPressed: () {
                        ModalBottomSheetPost.Dialog_Settings(context);
                      },
                      alignment: Alignment.topRight,
                      icon: Icon(Boxicons.bx_dots_vertical_rounded, size: 30, color: c.greyMain),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 80, right: 23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if(widget.urlImage?.length==null)Container(),
                  if(widget.urlImage?.length==1)Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            key: _key,
                            height: 285,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: c.graySub2,
                                image: DecorationImage(
                                    image: NetworkImage(widget.urlImage![0]),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                              urlImage: widget.urlImage,
                            )));
                          },
                        ),
                      ),
                    ],
                  ),
                  if(widget.urlImage?.length==2)Row(
                    children: [
                      // SizedBox(width: 60),
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            height: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    bottomLeft: Radius.circular(12)
                                ),
                                color: c.graySub2,
                                image: DecorationImage(
                                    image: NetworkImage(widget.urlImage![0]),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                              urlImage: widget.urlImage,
                            )));
                          },
                        ),
                      ),
                      SizedBox( width: 5 ),
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            height: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(12),
                                    bottomRight: Radius.circular(12)
                                ),
                                color: c.graySub2,
                                image: DecorationImage(
                                    image: NetworkImage(widget.urlImage![1]),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                urlImage: widget.urlImage,
                                index: 2
                            )));
                          },
                        ),
                      )
                    ],
                  ),
                  if(widget.urlImage?.length==3)Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                key: _key,
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![0]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                  urlImage: widget.urlImage,
                                )));
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox( height: 5 ),
                      Row(
                        children: [
                          // SizedBox(width: 60),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        bottomLeft: Radius.circular(12)
                                    ),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![1]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                  urlImage: widget.urlImage,
                                )));
                              },
                            ),
                          ),
                          SizedBox( width: 5 ),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        bottomRight: Radius.circular(12)
                                    ),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![2]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                    urlImage: widget.urlImage,
                                    index: 2
                                )));
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  if(widget.urlImage?.length==4)Column(
                    children: [
                      Row(
                        children: [
                          // SizedBox(width: 60),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        bottomLeft: Radius.circular(12)
                                    ),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![0]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                  urlImage: widget.urlImage,
                                )));
                              },
                            ),
                          ),
                          SizedBox( width: 5 ),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        bottomRight: Radius.circular(12)
                                    ),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![1]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                    urlImage: widget.urlImage,
                                    index: 2
                                )));
                              },
                            ),
                          )
                        ],
                      ),
                      SizedBox( height: 5 ),
                      Row(
                        children: [
                          // SizedBox(width: 60),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        bottomLeft: Radius.circular(12)
                                    ),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![2]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                  urlImage: widget.urlImage,
                                )));
                              },
                            ),
                          ),
                          SizedBox( width: 5 ),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        bottomRight: Radius.circular(12)
                                    ),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![3]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                    urlImage: widget.urlImage,
                                    index: 2
                                )));
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  if(widget.urlImage?.length!=null)SizedBox(height: 10),
                  if(widget.urlImage?.length!=null)Row(
                    children: [
                      // SizedBox(width: 60),
                      Inter(text: 'mention to', size: 11, color: c.blackMain, fontWeight: f.medium),
                      SizedBox(width: 5),
                      Container(
                        child: Padding(
                            padding: const EdgeInsets.only(left: 9, right: 4, top: 3, bottom: 3),
                            child: product.length==1?GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => comparepage(id: '${data?['_id']}', currentState: 0)));
                              },
                              child: Row(
                                children: [
                                  Container(
                                    constraints: BoxConstraints(maxWidth: 160),
                                    child: Inter_Crop(
                                        text: '${data?['p_brand']}' + " " + '${data?['p_name']}',
                                        size: 10,
                                        color: c.tag,
                                        fontWeight: f.semiBold
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(FeatherIcons.chevronRight, size: 14, color: c.tag),
                                ],
                              ),
                            ):(product.length == 2 || product.length == 3 || product.length == 4)?
                            GestureDetector(
                              onTap: () {
                                ModalViewProduct.Dialog_Settings(context ,product);
                              },
                              child: Row(
                                children: [
                                  Inter_Crop(
                                      text: product.length.toString() + " products",
                                      size: 10,
                                      color: c.tag,
                                      fontWeight: f.semiBold
                                  ),
                                  SizedBox(width: 4),
                                  Icon(FeatherIcons.chevronRight, size: 14, color: c.tag),
                                ],
                              ),
                            ):Container()
                        ),
                        decoration: BoxDecoration(
                            color: c.greenLight2,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ],
                  ),
                  if(widget.urlImage?.length!=null)SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      // var product = widget.product!;
                      // product = product.replaceAll(" ","_");
                      // var res = await networkHandler.get("/home/getPost/viewPost/" + widget.id! + "/" + product);
                      // print(res);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewPost(
                        img: widget.profileImg,
                        username: widget.username,
                        fullname: widget.name,
                        id: widget.id,
                        body: widget.post,
                        urlImage: widget.urlImage,
                        listProduct : product,
                        professor: widget.professor,
                        influencer: widget.influencer,
                        comment: widget.comment,
                        favorite: countFav,

                      )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Inter(text: widget.post!, size: 12, color: c.postText, fontWeight: f.regular),
                    ),
                  ),
                  if(widget.urlImage?.length==null)SizedBox(height: 8),
                  if(widget.urlImage?.length==null)Row(
                    children: [
                      // SizedBox(width: 60),
                      Inter(text: 'mention to', size: 11, color: c.blackMain, fontWeight: f.medium),
                      SizedBox(width: 5),
                      Container(
                        child: Padding(
                            padding: const EdgeInsets.only(left: 9, right: 4, top: 3, bottom: 3),
                            child: product.length==1?GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => comparepage(id: '${data?['_id']}', currentState: 0)));
                              },
                              child: Row(
                                children: [
                                  Container(
                                    constraints: BoxConstraints(maxWidth: 160),
                                    child: Inter_Crop(
                                        text: '${data?['p_brand']}' + " " + '${data?['p_name']}',
                                        size: 10,
                                        color: c.tag,
                                        fontWeight: f.semiBold
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(FeatherIcons.chevronRight, size: 14, color: c.tag),
                                ],
                              ),
                            ):(product.length == 2 || product.length == 3 || product.length == 4)?
                            GestureDetector(
                              onTap: () {
                                ModalViewProduct.Dialog_Settings(context ,product);
                              },
                              child: Row(
                                children: [
                                  Inter_Crop(
                                      text: product.length.toString() + " products",
                                      size: 10,
                                      color: c.tag,
                                      fontWeight: f.semiBold
                                  ),
                                  SizedBox(width: 4),
                                  Icon(FeatherIcons.chevronRight, size: 14, color: c.tag),
                                ],
                              ),
                            ):Container()
                        ),
                        decoration: BoxDecoration(
                            color: c.greenLight2,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(FeatherIcons.messageSquare, size:19, color: c.greyMain),
                      SizedBox(width: 3),
                      Inter(text: widget.comment.toString(), size: 11, color: c.greyMain, fontWeight: f.medium),
                      Expanded(child: Container()),
                      if(isFav == false)InkWell(
                          onTap: () async {
                            // Map<String, String> data = {
                            //   "favorite":widget.id!
                            // };
                            // print(data);
                            // var idStorage = await storage.read(key: 'id');
                            // await networkHandler.post("/home/addFav/" + idStorage!, data);
                            setState(() {
                              countFav+=1;
                              isFav = true;
                            });
                          },
                          child: Icon(FeatherIcons.heart, size:19, color: c.greyMain)
                      ),
                      if(isFav == true)InkWell(
                          onTap: () async {
                            Map<String, String> data = {
                              "favorite":widget.id!
                            };
                            print(data);
                            var idStorage = await storage.read(key: 'id');
                            await networkHandler.post("/home/unFav/" + idStorage!, data);
                            setState(() {
                              countFav-=1;
                              isFav = false;
                            });
                          },
                          child: Icon(Boxicons.bxs_heart, size:19, color: c.redMain)
                      ),
                      SizedBox(width: 3),
                      if(isFav == false)Inter(text: countFav.toString(), size: 11, color: c.greyMain, fontWeight: f.medium),
                      if(isFav == true)Inter(text: countFav.toString(), size: 11, color: c.redMain, fontWeight: f.medium),
                      Expanded(child: Container()),
                      IconButton(
                        icon: Icon(FeatherIcons.share2, size:19, color: c.greyMain),
                        onPressed: () async {
                          final urlImage = 'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1608828061-skinceuticals-1544737345.jpg?crop=1xw:1xh;center,top&resize=768:*';
                          final url = Uri.parse(urlImage);
                          final response = await http.get(url);
                          final bytes = response.bodyBytes;

                          final temp = await getTemporaryDirectory();
                          final path = '${temp.path}/image.jpg';
                          File(path).writeAsBytesSync(bytes);

                          await Share.shareFiles([path], text: 'This is Skin Ceuticals.');
                        },
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 6),
            Divider(
              color: c.greyMain,
              thickness: 0.5,
              height: 0,
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewPosts2 extends StatefulWidget {
  String? name, postTime, username, post, id,professor,influencer, profileImg;
  String query;
  int comment;
  double rating;
  List? urlImage;

  ReviewPosts2(
      {Key? key,required this.professor,required this.influencer , this.profileImg, this.name, this.postTime, this.username, this.post, required this.comment, this.urlImage, this.id, required this.rating, required this.query})
      : super(key: key);

  @override
  _ReviewPosts2State createState() => _ReviewPosts2State();
}

class _ReviewPosts2State extends State<ReviewPosts2> {
  final _key = GlobalKey();
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();
  bool isFav = false;
  List favorite=[];
  List product=[], staticData=[];
  int countFav = 0;
  Map? data;
  PostModel postModel = PostModel(
      favorite: [],
      product: []
  );
  List myfav = [];
  ProfileModel myprofileModel = ProfileModel(
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchSearchProductPost(widget.query);
  }

  fetchSearchProductPost(query) async{
    var response2 = await networkHandler.get("/home/getIDPost/" + widget.id!);
    var response3 = await networkHandler.get("/home/getComment/" + widget.id!);
    setState(() {
      postModel = PostModel.fromJson(response2["getPost"]);

      favorite = postModel.favorite!;
      countFav = favorite.length;

      product = postModel.product!;
      print('product');
      print(product);

      widget.comment = response3["countComment"];
    });
  }

  fetchComment () async {
    var response4 = await networkHandler.get("/profile/getData/");
    var response3 = await networkHandler.get("/home/getComment/" + widget.id!);
    setState(() {
      widget.comment = response3["countComment"];
      myprofileModel = ProfileModel.fromJson(response4["data"]);
      myfav = myprofileModel.favorite;
      var i=0;
      for(i;i<myfav.length;i++){
        if(widget.id == myfav[i]){
          // print(widget.id);
          // print(myfav[i]);
          // print('same naja'+i.toString());
          setState(() {
            isFav = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if( product != null && product.length !=0 ){
      data = product[0];
    }
    return FutureBuilder(
      future: fetchComment(),
      builder: (context, snapshot) => Container(
        child: Column(
          children: [
            SizedBox(height: 8),
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
                        child: CachedNetworkImage(imageUrl: widget.profileImg!,fit: BoxFit.cover,errorWidget: (context, url, error) => Container(),),
                      )
                  ),
                  SizedBox( width: 8 ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            child: Poppins(
                              text: widget.name!,
                              fontWeight: f.semiBold,
                              size: 13,
                              color: Colors.black,
                            ),
                            onTap: () async {

                              var x = await storage.read(key: "username");
                              print('fuck leo');
                              print(x);
                              print(widget.username);
                              if(x != widget.username){
                                await storage.write(
                                    key: "anotherprofile", value: widget.username);
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => anotherProfile()));
                              }
                              else{
                                Navbar(currentState: 4);
                              }

                            },
                          ),
                          SizedBox( width: 5 ),
                          Inter(text: widget.postTime!, size: 11, color: c.graySub2, fontWeight: f.medium)
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
                                  text: widget.professor!,
                                  size: 8,
                                  color: Colors.white,
                                  fontWeight: f.semiBold),
                            ),
                            decoration: BoxDecoration(
                                color: c.greenMain,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          SizedBox( width: 5 ),
                          (widget.influencer=="")?
                          Container():Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 5, left: 5, top: 2, bottom: 2),
                              child: Inter(
                                  text: widget.influencer!,
                                  size: 8,
                                  color: c.blueMain,
                                  fontWeight: f.bold),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: c.blueMain,
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
                    child: IconButton(
                      onPressed: () {
                        ModalBottomSheetPost.Dialog_Settings(context);
                      },
                      alignment: Alignment.topRight,
                      icon: Icon(Boxicons.bx_dots_vertical_rounded, size: 30, color: c.greyMain),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 80, right: 23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if(widget.urlImage?.length==null)Container(),
                  if(widget.urlImage?.length==1)Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            key: _key,
                            height: 285,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: c.graySub2,
                                image: DecorationImage(
                                    image: NetworkImage(widget.urlImage![0]),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                              urlImage: widget.urlImage,
                            )));
                          },
                        ),
                      ),
                    ],
                  ),
                  if(widget.urlImage?.length==2)Row(
                    children: [
                      // SizedBox(width: 60),
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            height: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    bottomLeft: Radius.circular(12)
                                ),
                                color: c.graySub2,
                                image: DecorationImage(
                                    image: NetworkImage(widget.urlImage![0]),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                              urlImage: widget.urlImage,
                            )));
                          },
                        ),
                      ),
                      SizedBox( width: 5 ),
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            height: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(12),
                                    bottomRight: Radius.circular(12)
                                ),
                                color: c.graySub2,
                                image: DecorationImage(
                                    image: NetworkImage(widget.urlImage![1]),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                urlImage: widget.urlImage,
                                index: 2
                            )));
                          },
                        ),
                      )
                    ],
                  ),
                  if(widget.urlImage?.length==3)Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                key: _key,
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![0]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                  urlImage: widget.urlImage,
                                )));
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox( height: 5 ),
                      Row(
                        children: [
                          // SizedBox(width: 60),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        bottomLeft: Radius.circular(12)
                                    ),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![1]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                  urlImage: widget.urlImage,
                                )));
                              },
                            ),
                          ),
                          SizedBox( width: 5 ),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        bottomRight: Radius.circular(12)
                                    ),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![2]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                    urlImage: widget.urlImage,
                                    index: 2
                                )));
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  if(widget.urlImage?.length==4)Column(
                    children: [
                      Row(
                        children: [
                          // SizedBox(width: 60),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        bottomLeft: Radius.circular(12)
                                    ),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![0]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                  urlImage: widget.urlImage,
                                )));
                              },
                            ),
                          ),
                          SizedBox( width: 5 ),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        bottomRight: Radius.circular(12)
                                    ),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![1]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                    urlImage: widget.urlImage,
                                    index: 2
                                )));
                              },
                            ),
                          )
                        ],
                      ),
                      SizedBox( height: 5 ),
                      Row(
                        children: [
                          // SizedBox(width: 60),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        bottomLeft: Radius.circular(12)
                                    ),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![2]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                  urlImage: widget.urlImage,
                                )));
                              },
                            ),
                          ),
                          SizedBox( width: 5 ),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        bottomRight: Radius.circular(12)
                                    ),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![3]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                    urlImage: widget.urlImage,
                                    index: 2
                                )));
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  if(widget.urlImage?.length!=null)SizedBox(height: 10),
                  if(widget.urlImage?.length!=null)Row(
                    children: [
                      // SizedBox(width: 60),
                      Inter(text: 'reviewed', size: 11, color: c.blackMain, fontWeight: f.medium),
                      SizedBox(width: 5),
                      Container(
                        child: Padding(
                            padding: const EdgeInsets.only(left: 9, right: 4,top: 2.5,bottom: 2.5),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => comparepage(id: '${data?['_id']}', currentState: 0)));
                              },
                              child: Row(
                                children: [
                                  Container(
                                    constraints: BoxConstraints(maxWidth: 125),
                                    child: Inter_Crop(
                                        text: '${data?['p_brand']}' + " " + '${data?['p_name']}',
                                        size: 10,
                                        color: c.tag,
                                        fontWeight: f.semiBold
                                    ),
                                  ),
                                  SizedBox(width: 7),
                                  Inter(
                                      text: widget.rating.toString(),
                                      size: 10,
                                      color: c.tag,
                                      fontWeight: f.semiBold
                                  ),
                                  SizedBox(width: 2),
                                  Icon(Boxicons.bxs_star, size: 13, color: c.tag),
                                  SizedBox(width: 4),
                                  Icon(FeatherIcons.chevronRight, size: 14, color: c.tag),
                                ],
                              ),
                            )
                        ),
                        decoration: BoxDecoration(
                            color: c.greenLight2,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ],
                  ),
                  if(widget.urlImage?.length!=null)SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      // var product = widget.product!;
                      // product = product.replaceAll(" ","_");
                      // var res = await networkHandler.get("/home/getPost/viewPost/" + widget.id! + "/" + product);
                      // print(res);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewPost(
                        img: widget.profileImg,
                        username: widget.username,
                        fullname: widget.name,
                        id: widget.id,
                        body: widget.post,
                        urlImage: widget.urlImage,
                        listProduct : product,
                        professor: widget.professor,
                        influencer: widget.influencer,
                        comment: widget.comment,
                        favorite: countFav,

                      )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Inter(text: widget.post!, size: 12, color: c.postText, fontWeight: f.regular),
                    ),
                  ),
                  if(widget.urlImage?.length==null)SizedBox(height: 8),
                  if(widget.urlImage?.length==null)Row(
                    children: [
                      // SizedBox(width: 60),
                      Inter(text: 'reviewed', size: 11, color: c.blackMain, fontWeight: f.medium),
                      SizedBox(width: 5),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 9, right: 4,top: 2.5,bottom: 2.5),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => comparepage(id: '${data?['_id']}', currentState: 0)));
                            },
                            child: Row(
                              children: [
                                Container(
                                  constraints: BoxConstraints(maxWidth: 125),
                                  child: Inter_Crop(
                                      text: '${data?['p_brand']}' + " " + '${data?['p_name']}',
                                      size: 10,
                                      color: c.tag,
                                      fontWeight: f.semiBold
                                  ),
                                ),
                                SizedBox(width: 7),
                                Inter(
                                    text: widget.rating.toString(),
                                    size: 10,
                                    color: c.tag,
                                    fontWeight: f.semiBold
                                ),
                                SizedBox(width: 2),
                                Icon(Boxicons.bxs_star, size: 13, color: c.tag),
                                SizedBox(width: 4),
                                Icon(FeatherIcons.chevronRight, size: 14, color: c.tag),
                              ],
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: c.greenLight2,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(FeatherIcons.messageSquare, size:19, color: c.greyMain),
                      SizedBox(width: 3),
                      Inter(text: widget.comment.toString(), size: 11, color: c.greyMain, fontWeight: f.medium),
                      Expanded(child: Container()),
                      if(isFav == false)InkWell(
                          onTap: () async {
                            Map<String, String> data = {
                              "favorite":widget.id!
                            };
                            print(data);
                            var idStorage = await storage.read(key: 'id');
                            await networkHandler.post("/home/addFav/" + idStorage!, data);
                            setState(() {
                              countFav+=1;
                              isFav = true;
                            });
                          },
                          child: Icon(FeatherIcons.heart, size:19, color: c.greyMain)
                      ),
                      if(isFav == true)InkWell(
                          onTap: () async {
                            Map<String, String> data = {
                              "favorite":widget.id!
                            };
                            print(data);
                            var idStorage = await storage.read(key: 'id');
                            await networkHandler.post("/home/unFav/" + idStorage!, data);
                            setState(() {
                              countFav-=1;
                              isFav = false;
                            });
                          },
                          child: Icon(Boxicons.bxs_heart, size:19, color: c.redMain)
                      ),
                      SizedBox(width: 3),
                      if(isFav == false)Inter(text: countFav.toString(), size: 11, color: c.greyMain, fontWeight: f.medium),
                      if(isFav == true)Inter(text: countFav.toString(), size: 11, color: c.redMain, fontWeight: f.medium),
                      Expanded(child: Container()),
                      IconButton(
                        icon: Icon(FeatherIcons.share2, size:19, color: c.greyMain),
                        onPressed: () async {
                          final urlImage = 'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1608828061-skinceuticals-1544737345.jpg?crop=1xw:1xh;center,top&resize=768:*';
                          final url = Uri.parse(urlImage);
                          final response = await http.get(url);
                          final bytes = response.bodyBytes;

                          final temp = await getTemporaryDirectory();
                          final path = '${temp.path}/image.jpg';
                          File(path).writeAsBytesSync(bytes);

                          await Share.shareFiles([path], text: 'This is Skin Ceuticals.');
                        },
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 6),
            Divider(
              color: c.greyMain,
              thickness: 0.5,
              height: 0,
            ),
          ],
        ),
      ),
    );
  }
}

class Posts2 extends StatefulWidget {
  String? name, postTime, username, post, id,professor,influencer, profileImg;
  String query;
  int comment;
  List? urlImage;

  Posts2(
      {Key? key, this.name, this.postTime, this.username, this.profileImg, this.post, required this.comment, required this.professor, required this.influencer
        ,this.urlImage, this.id, required this.query})
      : super(key: key);

  @override
  _Posts2State createState() => _Posts2State();
}

class _Posts2State extends State<Posts2> {
  final _key = GlobalKey();
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();
  bool isFav = false;
  List favorite=[];
  int countFav = 0;
  PostModel postModel = PostModel(
      favorite: []
  );
  List myfav = [];
  ProfileModel myprofileModel = ProfileModel(
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchSearchProductPost(widget.query);
  }

  fetchSearchProductPost(query) async{
    var response = await networkHandler.get("/home/getIDPost/" + widget.id!);
    var response3 = await networkHandler.get("/home/getComment/" + widget.id!);
    setState(() {
      postModel = PostModel.fromJson(response["getPost"]);

      favorite = postModel.favorite!;
      countFav = favorite.length;

      widget.comment = response3["countComment"];
    });
  }

  fetchComment () async {
    var response4 = await networkHandler.get("/profile/getData/");
    var response3 = await networkHandler.get("/home/getComment/" + widget.id!);
    setState(() {

      widget.comment = response3["countComment"];

      myprofileModel = ProfileModel.fromJson(response4["data"]);
      myfav = myprofileModel.favorite;
      var i=0;
      for(i;i<myfav.length;i++){
        if(widget.id == myfav[i]){
          // print(widget.id);
          // print(myfav[i]);
          // print('same naja'+i.toString());
          setState(() {
            isFav = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchComment(),
      builder: (context, snapshot) => Container(
        child: Column(
          children: [
            SizedBox(height: 8),
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
                        child: CachedNetworkImage(imageUrl: widget.profileImg!,fit: BoxFit.cover,errorWidget: (context, url, error) => Container(),),
                      )
                  ),
                  SizedBox( width: 8 ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            child: Poppins(
                              text: widget.name!,
                              fontWeight: f.semiBold,
                              size: 13,
                              color: Colors.black,
                            ),
                            onTap: () async {
                              var x = await storage.read(key: "username");
                              print('fuck leo');
                              print(x);
                              print(widget.username);
                              if(x != widget.username){
                                await storage.write(
                                    key: "anotherprofile", value: widget.username);
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => anotherProfile()));
                              }
                              else{
                                Navbar(currentState: 4);
                              }
                            },
                          ),
                          SizedBox( width: 5 ),
                          Inter(text: widget.postTime!, size: 11, color: c.graySub2, fontWeight: f.medium)
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
                                  text: widget.professor!,
                                  size: 8,
                                  color: Colors.white,
                                  fontWeight: f.semiBold),
                            ),
                            decoration: BoxDecoration(
                                color: c.greenMain,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          SizedBox( width: 5 ),
                          (widget.influencer=="")?
                          Container():Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 5, left: 5, top: 2, bottom: 2),
                              child: Inter(
                                  text: widget.influencer!,
                                  size: 8,
                                  color: c.blueMain,
                                  fontWeight: f.bold),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: c.blueMain,
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
                    child: IconButton(
                      onPressed: () {
                        ModalBottomSheetPost.Dialog_Settings(context);
                      },
                      alignment: Alignment.topRight,
                      icon: Icon(Boxicons.bx_dots_vertical_rounded, size: 30, color: c.greyMain),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 80, right: 23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if(widget.urlImage?.length==null)Container(),
                  if(widget.urlImage?.length==1)Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            key: _key,
                            height: 285,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: c.graySub2,
                                image: DecorationImage(
                                    image: NetworkImage(widget.urlImage![0]),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                              urlImage: widget.urlImage,
                            )));
                          },
                        ),
                      ),
                    ],
                  ),
                  if(widget.urlImage?.length==2)Row(
                    children: [
                      // SizedBox(width: 60),
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            height: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    bottomLeft: Radius.circular(12)
                                ),
                                color: c.graySub2,
                                image: DecorationImage(
                                    image: NetworkImage(widget.urlImage![0]),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                              urlImage: widget.urlImage,
                            )));
                          },
                        ),
                      ),
                      SizedBox( width: 5 ),
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            height: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(12),
                                    bottomRight: Radius.circular(12)
                                ),
                                color: c.graySub2,
                                image: DecorationImage(
                                    image: NetworkImage(widget.urlImage![1]),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                urlImage: widget.urlImage,
                                index: 2
                            )));
                          },
                        ),
                      )
                    ],
                  ),
                  if(widget.urlImage?.length==3)Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                key: _key,
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![0]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                  urlImage: widget.urlImage,
                                )));
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox( height: 5 ),
                      Row(
                        children: [
                          // SizedBox(width: 60),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        bottomLeft: Radius.circular(12)
                                    ),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![1]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                  urlImage: widget.urlImage,
                                )));
                              },
                            ),
                          ),
                          SizedBox( width: 5 ),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        bottomRight: Radius.circular(12)
                                    ),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![2]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                    urlImage: widget.urlImage,
                                    index: 2
                                )));
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  if(widget.urlImage?.length==4)Column(
                    children: [
                      Row(
                        children: [
                          // SizedBox(width: 60),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        bottomLeft: Radius.circular(12)
                                    ),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![0]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                  urlImage: widget.urlImage,
                                )));
                              },
                            ),
                          ),
                          SizedBox( width: 5 ),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        bottomRight: Radius.circular(12)
                                    ),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![1]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                    urlImage: widget.urlImage,
                                    index: 2
                                )));
                              },
                            ),
                          )
                        ],
                      ),
                      SizedBox( height: 5 ),
                      Row(
                        children: [
                          // SizedBox(width: 60),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        bottomLeft: Radius.circular(12)
                                    ),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![2]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                  urlImage: widget.urlImage,
                                )));
                              },
                            ),
                          ),
                          SizedBox( width: 5 ),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        bottomRight: Radius.circular(12)
                                    ),
                                    color: c.graySub2,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.urlImage![3]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                    urlImage: widget.urlImage,
                                    index: 2
                                )));
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  if(widget.urlImage?.length!=null)SizedBox(height: 8),
                  GestureDetector(
                    onTap: () async {
                      var res = await networkHandler.get("/home/getPost/viewPost/" + widget.id!);
                      print(res);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewPost(
                        img: widget.profileImg,
                        username: widget.username,
                        fullname: widget.name,
                        id: widget.id,
                        body: widget.post,
                        urlImage: widget.urlImage,
                        professor: widget.professor,
                        influencer: widget.influencer,
                        comment: widget.comment,
                        favorite: countFav,

                      )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Inter(text: widget.post!, size: 12, color: c.postText, fontWeight: f.regular),
                    ),
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(FeatherIcons.messageSquare, size:19, color: c.greyMain),
                      SizedBox(width: 3),
                      Inter(text: widget.comment.toString(), size: 11, color: c.greyMain, fontWeight: f.medium),
                      Expanded(child: Container()),
                      if(isFav == false)InkWell(
                          onTap: () async {
                            Map<String, String> data = {
                              "favorite":widget.id!
                            };
                            print(data);
                            var idStorage = await storage.read(key: 'id');
                            await networkHandler.post("/home/addFav/" + idStorage!, data);
                            setState(() {
                              countFav+=1;
                              isFav = true;
                            });
                          },
                          child: Icon(FeatherIcons.heart, size:19, color: c.greyMain)
                      ),
                      if(isFav == true)InkWell(
                          onTap: () async {
                            Map<String, String> data = {
                              "favorite":widget.id!
                            };
                            print(data);
                            var idStorage = await storage.read(key: 'id');
                            await networkHandler.post("/home/unFav/" + idStorage!, data);
                            setState(() {
                              countFav-=1;
                              isFav = false;
                            });
                          },
                          child: Icon(Boxicons.bxs_heart, size:19, color: c.redMain)
                      ),
                      SizedBox(width: 3),
                      if(isFav == false)Inter(text: countFav.toString(), size: 11, color: c.greyMain, fontWeight: f.medium),
                      if(isFav == true)Inter(text: countFav.toString(), size: 11, color: c.redMain, fontWeight: f.medium),
                      Expanded(child: Container()),
                      IconButton(
                        icon: Icon(FeatherIcons.share2, size:19, color: c.greyMain),
                        onPressed: () async {
                          final urlImage = 'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1608828061-skinceuticals-1544737345.jpg?crop=1xw:1xh;center,top&resize=768:*';
                          final url = Uri.parse(urlImage);
                          final response = await http.get(url);
                          final bytes = response.bodyBytes;

                          final temp = await getTemporaryDirectory();
                          final path = '${temp.path}/image.jpg';
                          File(path).writeAsBytesSync(bytes);

                          await Share.shareFiles([path], text: 'This is Skin Ceuticals.');
                        },
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 6),
            Divider(
              color: c.greyMain,
              thickness: 0.5,
              height: 0,
            ),
          ],
        ),
      ),
    );
  }
}





