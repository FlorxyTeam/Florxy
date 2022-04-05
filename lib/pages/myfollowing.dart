import 'package:Florxy/Model/profileModel.dart';
import 'package:Florxy/NetworkHandler.dart';
import 'package:Florxy/pages/followprofile.dart';
import 'package:Florxy/pages/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class myFollowing extends StatefulWidget {
  const myFollowing({Key? key}) : super(key: key);

  @override
  _myFollowingState createState() => _myFollowingState();
}


class _myFollowingState extends State<myFollowing> {
  List data = [];
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
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var response = await networkHandler.get("/profile/getData");
    setState(() {
      profileModel = ProfileModel.fromJson(response["data"]);
      data = profileModel.listfollowing;
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => FollowProfile()));
                }

              });
            },
            child: ListTile(
              title: Text("${data['fullname']}"),
              subtitle: Text("@${data['username']}"),
              leading: CircleAvatar(
                child: Text('${data['img']}'),
              ),
            ),
          );
        },
        itemCount: profileModel.listfollowing.length,
      ),
    );
  }

}
