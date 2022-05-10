import 'package:Florxy/Model/commentModel.dart';
import 'package:Florxy/Model/profileModel.dart';
import 'package:boxicons/boxicons.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
  int? countVote;
  String? postTime='';

  @override
  void initState() {
    fetchData();
    setDate();
    // TODO: implement initState
    super.initState();
  }

  void setDate() {
    setState(() {
      postTime = widget.postTime!.substring(8,10) + "/" + widget.postTime!.substring(5,7) + "/" + widget.postTime!.substring(0,4);
    });
  }

  fetchData() async{
    final networkHandler = NetworkHandler();
    var response = await networkHandler.get("/profile/getOtherData/" + widget.username!);
    var response2 = await networkHandler.get("/home/getDataComment/" + widget.idComment!);
    setState(() {
      profileModel = ProfileModel.fromJson(response["data"]);
      commentModel = CommentModel.fromJson(response2["dataComment"]);
      countVote = commentModel.vote!.length;
    });
  }

  fetchVote() async {
    final networkHandler = NetworkHandler();
    var response2 = await networkHandler.get("/home/getDataComment/" + widget.idComment!);
    setState(() {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFE5E5E5)
                      ),
                      width: 40,
                      height: 40,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: CachedNetworkImage(imageUrl: profileModel.img,fit: BoxFit.cover,errorWidget: (context, url, error) => Container(),),
                      )
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
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

                          ],
                        ),
                        SizedBox(height: 2),
                        Row(
                          children: [
                            Inter(text: 'Replying to', size: 11, color: c.blackSub2, fontWeight: f.regular),
                            SizedBox(width: 5),
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: 120
                              ),
                                child: Inter_Crop(text: '@'+widget.owner!, size: 12, color: c.greenMain, fontWeight: f.medium)),
                            SizedBox(width: 5),
                            Inter_Crop(text: postTime!, size: 11, color: c.graySub2, fontWeight: f.medium)
                          ],
                        ),
                        SizedBox(height: 15),
                        Inter(text: widget.body!, size: 12, color: c.postText, fontWeight: f.regular),
                      ],
                    ),
                  ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     Icon(Boxicons.bxs_up_arrow, size:21, color: c.greyMain),
                  //     Inter(text: countVote.toString(), size: 12, color: c.graySub2, fontWeight: f.medium)
                  //   ],
                  // )
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 47),
              //   child: Row(
              //     children: [
              //       Expanded(child: Inter(text: widget.body!, size: 12, color: c.postText, fontWeight: f.regular)),
              //       SizedBox(width: 10),
              //       Column(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         children: [
              //           Icon(Boxicons.bxs_up_arrow, size:18, color: c.greyMain),
              //           Inter(text: countVote.toString(), size: 12, color: c.graySub2, fontWeight: f.medium)
              //         ],
              //       )
              //     ],
              //   ),
              // ),
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
