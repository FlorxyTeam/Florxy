import 'package:Florxy/Model/profileModel.dart';
import 'package:Florxy/NetworkHandler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class myFollower extends StatefulWidget {
  const myFollower({Key? key}) : super(key: key);

  @override
  _myFollowerState createState() => _myFollowerState();
}


class _myFollowerState extends State<myFollower> {
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
    var response = await networkHandler.get("/profile/getData");
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
