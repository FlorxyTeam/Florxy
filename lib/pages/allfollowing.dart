import 'package:Florxy/Model/profileModel.dart';
import 'package:Florxy/NetworkHandler.dart';
import 'package:Florxy/pages/followprofile.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:Florxy/pages/navbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../widgets/font.dart';
import 'allfollower.dart';
import 'anotherProfile.dart';
class allFollowing extends StatefulWidget {
  String? another_username;
  allFollowing({Key? key, this.another_username}) : super(key: key);

  @override
  _allFollowingState createState() => _allFollowingState();
}


class _allFollowingState extends State<allFollowing> {
  List data = [];
  String my_username='';
  final storage = new FlutterSecureStorage();
  final networkHandler = NetworkHandler();
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


  @override
  void initState(){
    fetchData();
    // TODO: implement initState
    super.initState();
  }

  void fetchData() async {
    String? username = await storage.read(key: "username");
    // print(profile);
    var response = await networkHandler.get("/profile/getOtherData/" + widget.another_username!);
    // print("widget.another_username");
    // print(widget.another_username);
    setState(() {
      profileModel = ProfileModel.fromJson(response["data"]);
      data = profileModel.listfollowing;
      my_username = username!;
      // print(data);
    });

  }


  @override
  Widget build(BuildContext context) {
    // print(data);
    List staticData = data;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(FeatherIcons.chevronLeft),
                      iconSize: 34,
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      color: Colors.black,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Center(
                    child: Poppins(
                      text: "Following",
                      size: 18,
                      color: c.blackMain,
                      fontWeight: f.semiBold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (builder, index) {
                Map data = staticData[index];
                return InkWell(
                  onTap: () {
                    setState(() async{
                      await storage.write(key: "anotherfollowprofile", value: data['username']);
                      String? myuseranme = await storage.read(key: "username");
                      print('${data['username']}');
                      print('${myuseranme}');
                      if(myuseranme == data['username']){
                        print("same as fuck");
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Navbar(currentState: 4)));
                      }
                      else{
                        print("not same as fuck");
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => anotherProfile( another_username: '${data['username']}'))).then((value) => fetchData());
                      }

                    });
                  },
                  child: Column(
                    children: [
                      ListTile(
                          title: Align(
                              alignment: Alignment.centerLeft,
                              child: Poppins(text: "${data['fullname']}", size: 14, color: c.blackMain, fontWeight: f.semiBold)
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Inter(text: "@${data['username']}", size: 12, color: c.textUsername, fontWeight: f.medium,),
                              SizedBox(height: 5),
                              Alias(username: "${data['username']}")
                            ],
                          ),
                          leading: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFFE5E5E5)
                              ),
                              width: 55,
                              height: 55,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: CachedNetworkImage(imageUrl: "${data['img']}",fit: BoxFit.cover,errorWidget: (context, url, error) => Container(),),
                              )
                          ),
                          trailing: my_username != "${data['username']}"?ButtonFollow( username: "${data['username']}" ):null
                      ),
                      SizedBox(height: 14),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Divider(
                          color: c.greyMain,
                          thickness: 0.5,
                          height: 0,
                        ),
                      ),
                      SizedBox(height: 10)
                    ],
                  ),
                );
              },
              itemCount: profileModel.listfollowing.length,
            ),
          ],
        ),
      ),
    );
  }

}
