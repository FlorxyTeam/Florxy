import 'package:Florxy/Model/profileModel.dart';
import 'package:Florxy/NetworkHandler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class allFollower extends StatefulWidget {
  const allFollower({Key? key}) : super(key: key);

  @override
  _allFollowerState createState() => _allFollowerState();
}


class _allFollowerState extends State<allFollower> {
  List data = [];
  final storage = new FlutterSecureStorage();
  final networkHandler = NetworkHandler();
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
  void initState(){
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  void fetchData() async {
    String? profile = await storage.read(key: "anotherprofile");
    print(profile);
    var response = await networkHandler.get("/profile/getOtherData/$profile");

    setState(() {
      profileModel = ProfileModel.fromJson(response["data"]);
      data = profileModel.listfollower;
      print(data);
    });

  }


  @override
  Widget build(BuildContext context) {
    print(data);
    List staticData = data;
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (builder, index) {
          Map data = staticData[index];
          return ListTile(
            title: Text("${data['fullname']}"),
            subtitle: Text("@${data['username']}"),
            leading: CircleAvatar(
              child: Text('${data['img']}'),
            ),
          );
        },
        itemCount: profileModel.listfollower.length,
      ),
    );
  }

}
