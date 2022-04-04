import 'dart:io';

import 'package:Florxy/Model/commentModel.dart';
import 'package:Florxy/Model/profileModel.dart';
import 'package:Florxy/pages/searchpage.dart';
import 'package:Florxy/widgets/CommentWidget.dart';
import 'package:Florxy/widgets/ViewPhotoWidget.dart';
import 'package:Florxy/widgets/button.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:boxicons/boxicons.dart';
import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';

import '../NetworkHandler.dart';
import '../postProvider.dart';
import 'CreatePost.dart';

class ViewPost extends StatefulWidget {
  String? fullname, username, post, brand, product, desc, productImg,id;
  int? comment,favorite,mention;
  List? urlImage;
  ViewPost({Key? key, this.fullname, this.username, this.post, this.brand, this.product, this.desc, this.productImg, this.comment, this.favorite, this.urlImage, this.mention, this.id}) : super(key: key);

  @override
  _ViewPostState createState() => _ViewPostState();
}

class _ViewPostState extends State<ViewPost> {
  final _key = GlobalKey();
  TextEditingController _commentController = TextEditingController();
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();
  String? myusername,myfullname;

  @override
  void initState() {
    fetchData();
    // TODO: implement initState
    Provider.of<PostProvider>(context,listen: false).fetchComment(widget.id!);
    super.initState();
  }

  void fetchData() async{
    var username = await storage.read(key: 'username');
    var fullname = await storage.read(key: 'myfullname');
    setState(() {
      myfullname = fullname;
      myusername = username;
    });

  }

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      backgroundColor: c.textWhite,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: Theme.of(context).platform==TargetPlatform.android?11:0),
              Container(
                child: SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 22),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(FeatherIcons.chevronLeft),
                          iconSize: 34,
                          color: Colors.black,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 11),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.orange,
                                // backgroundImage:
                                // NetworkHandler().getImage(profileModel.email),
                              ),
                              SizedBox( width: 8 ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Poppins(
                                    text: widget.fullname!,
                                    fontWeight: f.semiBold,
                                    size: 14,
                                    color: Colors.black,
                                  ),
                                  Inter(text: "@" + widget.username!, size: 12, color: c.textUsername, fontWeight: f.medium),
                                  SizedBox( height: 7 ),
                                  Row(
                                    children: [
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 7, left: 7, top: 4, bottom: 4),
                                          child: Inter(
                                              text: "Beauty Advisor",
                                              size: 8.5,
                                              color: Colors.white,
                                              fontWeight: f.semiBold),
                                        ),
                                        decoration: BoxDecoration(
                                            color: c.greenMain,
                                            borderRadius: BorderRadius.circular(10)),
                                      ),
                                      SizedBox( width: 5 ),
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 5, left: 5, top: 2, bottom: 2),
                                          child: Inter(
                                              text: "Brand Presenter",
                                              size: 8.5,
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
                            ],
                          ),
                        ),
                        Expanded(child: Container()),
                        IconButton(
                          icon: Icon(Boxicons.bx_dots_vertical_rounded),
                          iconSize: 28,
                          color: Colors.black,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(26),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: c.shadow.withOpacity(0.32),
                      spreadRadius: 0,
                      blurRadius: 29,
                      offset: Offset(-1, -16), // changes position of shadow
                    ),
                  ],
                  color: Colors.white
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 23, right: 23, top: 15),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Inter(text: widget.post!, size: 14, color: c.postText, fontWeight: f.regular)
                        ),
                        SizedBox(height: 15),
                        if(widget.urlImage?.length==null)SizedBox(height: 0),
                        if(widget.urlImage?.length==1)Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                child: Container(
                                  key: _key,
                                  height: 315,
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
                                  height: 155,
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
                                  height: 155,
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


                        if(widget.urlImage?.length==3)
                          Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    child: Container(
                                      // key: _key,
                                      height: 155,
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
                                      height: 155,
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
                                      height: 155,
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


                        if(widget.urlImage?.length==4)
                          Column(
                          children: [
                            Row(
                              children: [
                                // SizedBox(width: 60),
                                Expanded(
                                  child: GestureDetector(
                                    child: Container(
                                      height: 155,
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
                                      height: 155,
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
                                      height: 155,
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
                                      height: 155,
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

                        SizedBox(height: 8),
                        Row(
                          children: [
                            Inter(text: '19:26', size: 12.5, color: c.greyMain, fontWeight: f.regular),
                            SizedBox(width: 5),
                            Inter(text: '14/12/2564' + ' BE', size: 12.5, color: c.greyMain, fontWeight: f.regular),
                          ],
                        ),
                        SizedBox(height: 8),
                        Divider(
                          color: c.greyMain,
                          thickness: 0.7,
                          height: 0,
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Inter(text: widget.mention.toString(), size: 13.5, color: c.textBlack, fontWeight: f.bold),
                            SizedBox(width: 3),
                            Inter(text: 'Mention to', size: 12.5, color: c.textBlack, fontWeight: f.regular),
                          ],
                        ),
                        SizedBox(height: 8),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Container(
                                      height: 100,
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          image: DecorationImage(
                                              image: NetworkImage(widget.productImg!),
                                              fit: BoxFit.contain
                                          )
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 11),
                                  child: Container(
                                    width: 230,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 8),
                                              child: PoppinsLeft(text: widget.brand!, size: 10.5, color: Colors.white, fontWeight: f.semiBold),
                                            ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: c.greySub
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        PoppinsLeft(text: widget.product!, size: 13.5, color: c.textBlack, fontWeight: f.semiBold),
                                        SizedBox(height: 10),
                                        Roboto(text: 'It is a long established fact that a reader will be distracted.', size: 12, color: c.greyMain, fontWeight: f.regular)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: c.shadow.withOpacity(0.1),
                                spreadRadius: -15,
                                blurRadius: 41,
                                offset: Offset(3, 7), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        // Divider(
                        //   color: c.greyMain,
                        //   thickness: 0.7,
                        //   height: 0,
                        // ),
                        Row(
                          children: [
                            Inter(text: widget.comment!.toString(), size: 13.5, color: c.textBlack, fontWeight: f.bold),
                            SizedBox(width: 3),
                            Inter(text: 'Comments', size: 12.5, color: c.textBlack, fontWeight: f.regular),

                            SizedBox(width: 9),

                            Inter(text: widget.favorite!.toString(), size: 13.5, color: c.textBlack, fontWeight: f.bold),
                            SizedBox(width: 3),
                            Inter(text: 'Likes', size: 12.5, color: c.textBlack, fontWeight: f.regular),

                            SizedBox(width: 9),

                            Inter(text: 16.toString(), size: 13.5, color: c.textBlack, fontWeight: f.bold),
                            SizedBox(width: 3),
                            Inter(text: 'Shared', size: 12.5, color: c.textBlack, fontWeight: f.regular),
                          ],
                        ),
                        SizedBox(height: 8),
                        Divider(
                          color: c.greyMain,
                          thickness: 0.7,
                          height: 0,
                        ),
                        SizedBox(height: 9),
                        Row(

                          children: [
                            // Expanded(child: Container()),
                            Padding(
                              padding: const EdgeInsets.only(left: 45),
                              child: Icon(FeatherIcons.messageSquare, size:19, color: c.greyMain),
                            ),
                            Expanded(child: Container()),
                            Icon(FeatherIcons.heart, size:19, color: c.greyMain),
                            Expanded(child: Container()),
                            Padding(
                              padding: const EdgeInsets.only(right: 45),
                              child: IconButton(
                                icon: Icon(FeatherIcons.share2, size:19, color: c.greyMain),
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
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
                            ),
                            // Expanded(child: Container()),
                          ],
                        ),
                        SizedBox(height: 9),
                        Divider(
                          color: c.greyMain,
                          thickness: 0.7,
                          height: 0,
                        ),
                        Consumer<PostProvider>(builder: (context,model,_) => FutureBuilder(
                          future: model.fetchComment(widget.id!),
                          builder: (context,snapshot) => MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              // scrollDirection: Axis.vertical,
                              itemCount: model.comment?.length??0,
                              itemBuilder: (context,int index){
                                // fetchData(model.comment![index]['owner']);
                                return Comment(
                                  name: 'profileModel.fullname',
                                  username: model.comment![index]['owner'],
                                  postTime: model.comment![index]['updatedAt'].toString().substring(0, 10),
                                  body: model.comment![index]['body'],
                                  comment: model.comment![index]['comment'],
                                  favorite: model.comment![index]['favorite'],
                                  owner: widget.username,
                                );
                              },
                            ),
                          ),
                        )),
                        SizedBox(height: 90)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 12),
                child: Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.orange,
                              // backgroundImage:
                              // NetworkHandler().getImage(profileModel.email),
                            ),
                            SizedBox(width: 5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Poppins(
                                  text: myfullname!,
                                  fontWeight: f.semiBold,
                                  size: 11.5,
                                  color: Colors.black,
                                ),
                                Inter(text: "@" + myusername!, size: 10, color: c.textUsername, fontWeight: f.medium),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        // Icon(FeatherIcons.camera, size:25, color: Colors.black),
                        // SizedBox(width: 13),
                        Expanded(
                          child: Container(
                            height: 35,
                            child: TextFormField(
                              controller: _commentController,
                              onTap: () {
                                FocusScopeNode currentFocus = FocusScope.of(context);
                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: c.searchbar,
                                contentPadding: EdgeInsets.fromLTRB(18, 0, 0, 0),
                                hintText: 'Write a comment...',
                                hintStyle: TextStyle(
                                    fontSize: 13.5,
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
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              icon: Icon(FeatherIcons.camera, size:22, color: c.greenMain),
                            ),
                            SizedBox(width: 17),
                            IconButton(
                                onPressed: () {},
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                                icon: Icon(FeatherIcons.image, color: c.greenMain, size: 22)
                            ),
                            Expanded(child: Container()),
                            GestureDetector(
                              child: GreenButton(
                                text: 'POST',
                                size: 10,
                                color: Colors.white,
                                width: 55,
                                height: 25,
                              ),
                              onTap: () async {
                                var username = await storage.read(key: 'username');
                                Map<String, String> data = {
                                  "owner": username!,
                                  "mainpost": widget.id!,
                                  "comment": _commentController.text,
                                };
                                var response = await networkHandler.post("/home/comment", data);
                                print(response);
                                setState(() {
                                  Provider.of<PostProvider>(context,listen: false).fetchComment(widget.id!);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
