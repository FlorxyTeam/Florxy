import 'package:Florxy/Model/profileModel.dart';
import 'package:Florxy/NetworkHandler.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class NotificationReply extends StatefulWidget {
  String? username,otherusername,type,body,createAt;


  NotificationReply(
      {Key? key, this.otherusername, this.username, this.body, this.type,
        this.createAt})
      : super(key: key);

  @override
  _NotificationReplyState createState() => _NotificationReplyState();
}

class _NotificationReplyState extends State<NotificationReply> {
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();

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
  late bool _isLoading;
  @override
  void initState() {
    // TODO: implement initState

    _isLoading = true;

    fetchData();
    super.initState();
  }

  void fetchData() async{
    var response = await networkHandler.get("/profile/getOtherData/" + widget.otherusername!);
    setState(() {
      profileModel = ProfileModel.fromJson(response["data"]);
      _isLoading =false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30,0,30,0),
      child: Column(
        children: [
          _isLoading
          ?DoubleCard()
          :Container(
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFE5E5E5)
                        ),
                        width: 56,
                        height: 56,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: CachedNetworkImage(imageUrl: profileModel.img,fit: BoxFit.cover,errorWidget: (context, url, error) => Container(),),
                        )
                    ),

                    Positioned(child: CircleAvatar(
                      child: Icon(

                          FeatherIcons.cornerUpLeft,
                          color: c.greenSub2,
                          size: 15,

                      ),
                      backgroundColor: Colors.white,
                      radius: 11.5,
                       ),
                      bottom: 0,
                      right: 0,
                    )
                  ],
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Poppins(text: profileModel.fullname, size: 13.5, color: Colors.black, fontWeight: f.bold),
                        Poppins(text: ' replies your post', size: 13.5, color: Colors.black, fontWeight: f.semiBold),
                      ],
                    ),
                  Poppins(text: widget.body!, size: 13, color: Colors.grey, fontWeight: f.medium),
                    SizedBox(height: 5,),
                  Poppins(text: widget.createAt!, size: 10, color: Colors.grey, fontWeight: f.medium),
                    SizedBox(height: 10,),
                ],)
              ],
            ),
          ),
        ],
      ),
    );
  }
}




class NotificationFollow extends StatefulWidget {
  String? username,otherusername,type,body,createAt;


  NotificationFollow(
      {Key? key, this.otherusername, this.username, this.body, this.type,
        this.createAt})
      : super(key: key);

  @override
  _NotificationFollowState createState() => _NotificationFollowState();
}

class _NotificationFollowState extends State<NotificationFollow> {
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();

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

  late bool _isLoading;
  @override
  void initState() {
    // TODO: implement initState

    _isLoading = true;
    fetchData();

    super.initState();
  }

  void fetchData() async{
    var response = await networkHandler.get("/profile/getOtherData/" + widget.otherusername!);
    setState(() {
      profileModel = ProfileModel.fromJson(response["data"]);
      _isLoading =false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30,0,30,0),
      child: Column(
        children: [
          _isLoading
              ?DoubleCard()
              : Container(
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFE5E5E5)
                        ),
                        width: 56,
                        height: 56,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: CachedNetworkImage(imageUrl: profileModel.img,fit: BoxFit.cover,errorWidget: (context, url, error) => Container(),),
                        )
                    ),
                    Positioned(child: CircleAvatar(
                      child: Icon(

                        Boxicons.bxs_user,
                        color: c.blueMain,
                        size: 15,

                      ),
                      backgroundColor: Colors.white,
                      radius: 11.5,
                    ),
                      bottom: 0,
                      right: 0,
                    )
                  ],
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Poppins(text: profileModel.fullname, size: 13.5, color: Colors.black, fontWeight: f.bold),
                        Poppins(text: ' follow you', size: 13.5, color: Colors.black, fontWeight: f.semiBold),
                      ],
                    ),
                    Poppins(text: widget.body!, size: 13, color: Colors.grey, fontWeight: f.medium),
                    SizedBox(height: 5,),
                    Poppins(text: widget.createAt!, size: 10, color: Colors.grey, fontWeight: f.medium),
                    SizedBox(height: 10,),
                  ],)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationFavPost extends StatefulWidget {
  String? username,otherusername,type,body,createAt;


  NotificationFavPost(
      {Key? key, this.otherusername, this.username, this.body, this.type,
        this.createAt})
      : super(key: key);

  @override
  _NotificationFavPostState createState() => _NotificationFavPostState();
}

class _NotificationFavPostState extends State<NotificationFavPost> {
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();

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

  late bool _isLoading;
  @override
  void initState() {
    // TODO: implement initState

    _isLoading = true;
    fetchData();
    super.initState();
  }

  void fetchData() async{
    var response = await networkHandler.get("/profile/getOtherData/" + widget.otherusername!);
    setState(() {
      profileModel = ProfileModel.fromJson(response["data"]);
      _isLoading =false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30,0,30,0),
      child: Column(
        children: [
          _isLoading
              ?DoubleCard()
              :Container(
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFE5E5E5)
                        ),
                        width: 56,
                        height: 56,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: CachedNetworkImage(imageUrl: profileModel.img,fit: BoxFit.cover,errorWidget: (context, url, error) => Container(),),
                        )
                    ),
                    Positioned(child: CircleAvatar(
                      child: Icon(

                        Boxicons.bxs_heart,
                        color: c.redMain,
                        size: 15,

                      ),
                      backgroundColor: Colors.white,
                      radius: 11.5,
                    ),
                      bottom: 0,
                      right: 0,
                    )
                  ],
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Poppins(text: profileModel.fullname, size: 13.5, color: Colors.black, fontWeight: f.bold),
                        Poppins(text: ' favorite your post', size: 13.5, color: Colors.black, fontWeight: f.semiBold),
                      ],
                    ),
                    Poppins(text: widget.body!, size: 13, color: Colors.grey, fontWeight: f.medium),
                    SizedBox(height: 5,),
                    Poppins(text: widget.createAt!, size: 10, color: Colors.grey, fontWeight: f.medium),
                    SizedBox(height: 10,),
                  ],)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DoubleCard extends StatelessWidget {
  const DoubleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 20,),
      NewCardSkeleton(),
      SizedBox(height: 20,),
      NewCardSkeleton(),
    ],);
  }
}


class NewCardSkeleton extends StatelessWidget {
  const NewCardSkeleton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CirSkeleton(
          height: 56,
          width: 56,
        ),
        SizedBox(width: 10,),
        Expanded(child: Column(
          children: [
            Row(children: [
              Expanded(child: Skeleton(height: 10,width: 10,)),
              SizedBox(width: 16,),
              Expanded(child: Skeleton(height: 10,width: 10,)),
            ],),
            SizedBox(height: 8,),
            Skeleton(height: 10,),
            SizedBox(height: 8,),
            Row(children: [
              Skeleton(height: 10,width: 100 ,),
            ],)

          ],
        ),),
      ],
    );
  }
}


class CirSkeleton extends StatelessWidget {
  const CirSkeleton({
    Key? key,
    this.height,
    this.width,
    this.radius,
  }): super(key:key);
  final double? height, width, radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: CircleAvatar(backgroundColor: Colors.black.withOpacity(0.04),radius: 28,),

    );
  }
}

class Skeleton extends StatelessWidget {
  const Skeleton({
    Key? key,
    this.height,
    this.width,
  }): super(key:key);
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
    );
  }
}
