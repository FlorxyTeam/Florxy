import 'package:Florxy/Model/commentModel.dart';
import 'package:Florxy/Model/profileModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../NetworkHandler.dart';
import 'fontWeight.dart';
import 'font.dart';

class Comment extends StatefulWidget {
  String? username, postTime, body, owner, mainPost, idComment;
  Comment({Key? key, this.username, this.body, this.postTime, this.owner, this.mainPost, this.idComment}) : super(key: key);

  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> {
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
  CommentModel commentModel = CommentModel(
    vote: []
  );
  int countVote = 0;

  @override
  void initState() {
    fetchData();
    // TODO: implement initState
    super.initState();
  }

  void fetchData() async{
    final networkHandler = NetworkHandler();
    var response = await networkHandler.get("/profile/getOtherData/" + widget.username!);
    var response2 = await networkHandler.get("/home/getDataComment/" + widget.idComment!);
    setState(() {
      profileModel = ProfileModel.fromJson(response["data"]);
      commentModel = CommentModel.fromJson(response2["dataComment"]);
      countVote = commentModel.vote!.length;
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
                  backgroundImage: profileModel.img.isNotEmpty?
                  NetworkImage(profileModel.img)
                  :null
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
                          Icon(FeatherIcons.chevronsUp, size:23, color: c.greyMain),
                          Inter(text: countVote.toString(), size: 11, color: c.graySub2, fontWeight: f.medium)
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
