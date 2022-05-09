import 'package:Florxy/Model/profileModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../NetworkHandler.dart';
import 'fontWeight.dart';
import 'font.dart';

class Comment extends StatefulWidget {
  String? name,username,postTime,owner,body;
  int favorite,comment;
  Comment({Key? key, required this.favorite, this.username, this.name, this.body, this.postTime, this.owner, required this.comment}) : super(key: key);

  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> {
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

  @override
  void initState() {
    fetchData();
    // TODO: implement initState
    super.initState();
  }

  void fetchData() async{
    final networkHandler = NetworkHandler();
    var response = await networkHandler.get("/profile/getOtherData/" + widget.username!);
    setState(() {
      profileModel = ProfileModel.fromJson(response["data"]);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.orange,
                  // backgroundImage:
                  // NetworkHandler().getImage(profileModel.email),
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Poppins(
                          text: profileModel.fullname,
                          fontWeight: f.semiBold,
                          size: 13,
                          color: Colors.black,
                        ),
                        SizedBox(width: 5),
                        Inter(text: '@'+profileModel.username, size: 12, color: c.textUsername, fontWeight: f.medium),
                        SizedBox(width: 5),
                        Inter(text: widget.postTime!, size: 11, color: c.graySub2, fontWeight: f.medium)
                      ],
                    ),
                    Row(
                      children: [
                        Inter(text: 'Replying to', size: 11, color: c.blackSub2, fontWeight: f.regular),
                        SizedBox(width: 5),
                        Inter(text: '@'+widget.owner!, size: 12, color: c.greenMain, fontWeight: f.medium),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 47),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(child: Inter(text: widget.body!, size: 12, color: c.postText, fontWeight: f.regular)),
                      SizedBox(width: 10),
                      Column(
                        children: [
                          Icon(FeatherIcons.heart, size:19, color: c.greyMain),
                          SizedBox(height: 1),
                          Inter(text: widget.favorite.toString(), size: 11, color: c.graySub2, fontWeight: f.medium)
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(FeatherIcons.messageSquare, size:19, color: c.greyMain),
                      SizedBox(width: 18),
                      IconButton(
                        icon: Icon(FeatherIcons.share2, size:19, color: c.greyMain),
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        onPressed: () async {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Divider(
              color: c.greyMain,
              thickness: 0.7,
              height: 0,
            ),
          ],
        ),
      ),
    );
  }
}
