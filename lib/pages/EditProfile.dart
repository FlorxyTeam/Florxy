import 'dart:io';
import 'package:Florxy/Model/profileModel.dart';
import 'package:Florxy/NetworkHandler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/fontWeight.dart';

import 'aliaspage.dart';


class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  bool circular = false;
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();
  final _globalkey = GlobalKey<FormState>();
  TextEditingController _fullname = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _bio = TextEditingController();
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
    listfollowing: [],);

  File? image;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchData();
  }
  void fetchData() async{
    var response = await networkHandler.get("/profile/getData");
    setState(() {
      profileModel = ProfileModel.fromJson(response["data"]);
      circular = false;
    });
  }
  Future takePhoto(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: c.shadow.withOpacity(0.32),
                spreadRadius: -17,
                blurRadius: 30,
                offset: Offset(0, 6), // changes position of shadow
              ),
            ],
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(26),
            )),
            title: Padding(
              padding: const EdgeInsets.only(top: 18.5, left: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: Icon(Icons.close_rounded),
                      color: c.blackMain,
                      iconSize: 30,
                      onPressed: () => Navigator.of(context).pop()
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Inter(
                        text: "Edit profile",
                        size: 18,
                        color: c.blackMain,
                        fontWeight: f.semiBold),
                  ),
                  Expanded(child: Container()),
                  TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                      ),
                      onPressed: () async {

                        setState(() {
                          circular = true;
                        });
                        if (_globalkey.currentState!.validate()) {
                          Map<String, String> data = {
                            "fullname": _fullname.text,
                            "bio": _bio.text,
                          };
                          var response =
                          await networkHandler.patch("/profile/update", data);

                          if (response.statusCode == 200 ||
                              response.statusCode == 201) {
                            if (image != null) {
                              var imageResponse = await networkHandler.patchImage(
                                  "/profile/add/image", image!.path);
                              if (imageResponse.statusCode == 200 ||
                                  imageResponse.statusCode == 201) {
                                setState(() {
                                  circular = false;
                                });
                                Navigator.of(context).pop();
                              }else {
                                setState(() {
                                  circular = false;
                                });
                              }

                            } else {
                              setState(() {
                                circular = false;
                              });
                              Navigator.of(context).pop();
                            }
                          }else {
                            setState(() {
                              circular = false;
                            });
                          }
                        }else {
                          setState(() {
                            circular = false;
                          });
                        }
                      },
                      child: circular
                          ? Padding(
                        padding:
                        const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Center(
                            child: CircularProgressIndicator()
                        ),
                      )
                          : Inter(
                        text: "Save",
                        fontWeight: f.bold,
                        color: c.greenMain,
                        size: 18,
                      )
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        // resizeToAvoidBottomInset: true,

        child: Center(
          child: Form(
            key: _globalkey,
            child: ListView(
              padding: const EdgeInsets.all(30.0),
              children: <Widget>[
                imageProfile(),
                SizedBox(
                  height: 20,
                ),
               Center(
                 child: Inter(
                   text:  '@'+profileModel.username,
                   color: c.blackMain,
                   fontWeight: f.semiBold,
                   size: 20,
                 ),
               ),SizedBox(
                  height: 20,
                ),

                nameTextField(),

                // usernameTextField(),
                SizedBox(
                  height: 30,
                ),
                bioTextField(),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        color: c.greyMain,
                        height: 55,
                        onPressed: () async{
                          await storage.write(key: "myusername", value: profileModel.username);
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AliasPage()));

                          },

                        child: Inter(
                          text: "Switch to Professional Account",
                          size: 13,
                          color: c.textWhite,
                          fontWeight: f.bold,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget PickImage(){
  //   return Center(
  //     child: Stack(
  //       children: <Widget>[
  //         image != null
  //             ? Image.file(
  //           image!,
  //           width: 200,
  //           height: 200,
  //         )
  //             : FlutterLogo(
  //           size: 120,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: <Widget>[
          Container(
            child: image == null ? Container(
              child:  CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkHandler().getImage(profileModel.email)
              ),
            ) : Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(50)
              ),
              child: ClipOval(
                child: Image.file(
                  image!,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: c.blackMain.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(50)),
              child: InkWell(
                onTap: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      actions: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 7),
                          child: Column(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                    bottom: BorderSide(
                                        width: 0.8,
                                        color: c.greyMain.withOpacity(0.5)),

                                  )),
                                  child: ListTile(
                                      onTap: () async {
                                        Future.delayed(Duration(seconds: 5));
                                       Navigator.of(context).pop();
                                        await takePhoto(ImageSource.camera);
                                      },
                                      title: Inter(
                                        text: "Take photo",
                                        color: c.blackMain,
                                        size: 14,
                                        fontWeight: f.medium,
                                      ))),
                              Container(
                                  child: ListTile(
                                onTap: () async {
                                  Future.delayed(Duration(seconds: 5));
                                  Navigator.of(context).pop();
                                  await takePhoto(ImageSource.gallery);
                                },
                                title: Inter(
                                  text: "Choose existing photo",
                                  color: c.blackMain,
                                  size: 14,
                                  fontWeight: f.medium,
                                ),
                              ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //Name
  Widget nameTextField() {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Poppins(
              text: 'Name', size: 14, color: c.blackSub, fontWeight: f.medium),
        ),
        SizedBox(height: 5),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(13.0)),
          ),
          child: TextFormField(
            controller: _fullname,
              decoration: InputDecoration(
            hintText: profileModel.fullname,
            hintStyle: TextStyle(
                fontSize: 14, color: c.graySub2, fontWeight: f.medium),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(13.0)),
              borderSide:
                  BorderSide(color: c.graySub2.withOpacity(0), width: 2),
            ),
            prefixText: '---',
            prefixStyle: TextStyle(color: Colors.transparent),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(13.0)),
              borderSide: BorderSide(color: c.greenMain, width: 2),
            ),
          )),
        ),
      ],
    );
  }

  // Widget usernameTextField() {
  //   return Column(
  //     children: [
  //       Align(
  //         alignment: Alignment.topLeft,
  //         child: Poppins(
  //             text: 'Username',
  //             size: 14,
  //             color: c.blackSub,
  //             fontWeight: f.medium),
  //       ),
  //       SizedBox(height: 5),
  //       Container(
  //         height: 50,
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.all(Radius.circular(13.0)),
  //         ),
  //         child: TextFormField(
  //           enabled: false,
  //           controller: _username,
  //             decoration: InputDecoration(
  //           hintText: '@'+profileModel.username,
  //           hintStyle: TextStyle(
  //               fontSize: 14, color: c.graySub2, fontWeight: f.medium),
  //           enabledBorder: OutlineInputBorder(
  //             borderRadius: BorderRadius.all(Radius.circular(13.0)),
  //             borderSide:
  //                 BorderSide(color: c.graySub2.withOpacity(0), width: 2),
  //           ),
  //           prefixText: '---',
  //           prefixStyle: TextStyle(color: Colors.transparent),
  //           focusedBorder: OutlineInputBorder(
  //             borderRadius: BorderRadius.all(Radius.circular(13.0)),
  //             borderSide: BorderSide(color: c.greenMain, width: 2),
  //           ),
  //         )),
  //       ),
  //     ],
  //   );
  // }

  Widget bioTextField() {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Poppins(
              text: 'BIO', size: 14, color: c.blackSub, fontWeight: f.medium),
        ),
        SizedBox(height: 5),
        Container(
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(13.0)),
          ),
          child: TextFormField(
            controller: _bio,
              maxLines: 4,
              decoration: InputDecoration(
                hintText:
                    profileModel.bio,
                hintStyle: TextStyle(
                    fontSize: 14, color: c.graySub2, fontWeight: f.medium),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                  borderSide:
                      BorderSide(color: c.graySub2.withOpacity(0), width: 2),
                ),
                prefixText: '---',
                prefixStyle: TextStyle(color: Colors.transparent),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                  borderSide: BorderSide(color: c.greenMain, width: 2),
                ),
              )),
        ),
      ],
    );
  }


}
