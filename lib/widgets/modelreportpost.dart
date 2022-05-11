import 'package:Florxy/pages/PostReply.dart';
import 'package:Florxy/pages/reportpage.dart';
import 'package:Florxy/provider/google_sign_in.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:boxicons/boxicons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/pages/EditProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:slide_popup_dialog_null_safety/slide_popup_dialog.dart'
as slideDialog;

import '../Model/profileModel.dart';
import '../NetworkHandler.dart';
import '../pages/navbar.dart';

class ModalBottomSheetPost {
  static Dialog_Settings(context, String post_username, String my_username, String idpost) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            color: Colors.transparent,
            height: 250,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: ListMenu(
                    post_username: post_username,
                    my_username: my_username,
                    idpost: idpost,
                )
              ),
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(38),
                      topRight: const Radius.circular(38))),
            ),
          );
        });
  }
}


class ListMenu extends StatefulWidget {
  String? post_username,my_username,idpost;
  // Future? fetchpinned;
  ListMenu({Key? key, this.my_username, this.idpost, this.post_username}) : super(key: key);

  @override
  _ListMenuState createState() => _ListMenuState();
}

class _ListMenuState extends State<ListMenu> {
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

  void fetchdata() async {
    var response = await networkHandler.get("/profile/getData");
    setState(() {
      profileModel = ProfileModel.fromJson(response["data"]);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchdata();
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: Container(
              height: 152,
              width: 270,
              child: Expanded(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Boxicons.bx_pin),
                        SizedBox(width: 3),
                        Inter(text: "You haved a pin post", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ],
                    ),
                    SizedBox(height: 9),
                    Inter(text: "You can only pin one post. Are you", size: 13, color: c.graySub2, fontWeight: f.medium),
                    SizedBox(height: 3),
                    Inter(text: " sure you want to pin this post?", size: 13, color: c.graySub2, fontWeight: f.medium),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        children: [
                          Divider(
                            color: c.greyMain,
                            thickness: 0.7,
                            height: 0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Center(child: Inter(text: "Cancle", size: 15, color: c.graySub2, fontWeight: f.semiBold)))),
                                Container(
                                  height: 43,
                                  child: VerticalDivider(
                                    color: c.greyMain,
                                    thickness: 0.7,
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () async {
                                      Map<String, String> data = {
                                        "pinPost" : widget.idpost!
                                      };
                                      await networkHandler.post("/profile/addPinned/" + widget.my_username!, data);
                                      fetchdata();
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pushReplacement(
                                          PageTransition(type: PageTransitionType.fade, child: Navbar(currentState: 4), duration: Duration(milliseconds: 0)));
                                    },
                                    child: Center(child: Inter(text: "Pin", size: 15, color: c.redMain, fontWeight: f.semiBold))),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
          );
        }
    );
  }

  void showDeleteDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: Container(
              height: 146,
              width: MediaQuery.of(context).size.width/2,
              child: Expanded(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Inter(text: "Delete Post", size: 15, color: c.blackMain, fontWeight: f.bold),
                    SizedBox(height: 9),
                    Inter(text: "Are you sure you want to", size: 13, color: c.graySub2, fontWeight: f.medium),
                    SizedBox(height: 3),
                    Inter(text: "delete post?", size: 13, color: c.graySub2, fontWeight: f.medium),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        children: [
                          Divider(
                            color: c.greyMain,
                            thickness: 0.7,
                            height: 0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Center(child: Inter(text: "Cancle", size: 15, color: c.graySub2, fontWeight: f.semiBold)))),
                                Container(
                                  height: 43,
                                  child: VerticalDivider(
                                    color: c.greyMain,
                                    thickness: 0.7,
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                      onTap: () async {
                                        Map<String, String> data = {
                                          "idPost" : widget.idpost!
                                        };
                                        Map<String, String> data2 = {
                                          "pinPost" : widget.idpost!
                                        };
                                        Map<String, String> data3 = {
                                          "pinPost" : widget.idpost!
                                        };
                                        await networkHandler.post("/profile/deletePinned/" + widget.my_username!, data2);
                                        await networkHandler.post("/profile/deletepost",data);

                                        fetchdata();
                                        Navigator.of(context).pop();
                                      },
                                      child: Center(child: Inter(text: "Delete", size: 15, color: c.redMain, fontWeight: f.semiBold))),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 78,
          child: Divider(
            height: 0,
            color: c.greyMain,
            thickness: 3.5,
          ),
        ),
        SizedBox(height: 15),
        if(widget.post_username == widget.my_username && profileModel.pinned != widget.idpost )Column(
          children: [
            Container(
              child: ListTile(
                horizontalTitleGap: 0,
                // shape: Border.,
                leading: Icon(Boxicons.bx_pin),
                iconColor: c.blackMain,
                textColor: c.blackMain,
                title: Inter(
                    text: "Pin post to your profile",
                    size: 15,
                    color: c.blackMain,
                    fontWeight: f.semiBold),
                onTap: () async {
                  if(profileModel.pinned==null){
                    Map<String, String> data = {
                      "pinPost" : widget.idpost!
                    };
                    await networkHandler.post("/profile/addPinned/" + widget.my_username!, data);
                    fetchdata();
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacement(
                    PageTransition(type: PageTransitionType.fade, child: Navbar(currentState: 4), duration: Duration(milliseconds: 0)));

                  } else showAlertDialog(context);
                },
              ),
            ),
            Divider(
              height: 0,
              color: c.greySub,
              thickness: 1.5,
            ),
          ],
        ),
        if(profileModel.pinned == widget.idpost )Column(
          children: [
            Container(
              child: ListTile(
                horizontalTitleGap: 0,
                // shape: Border.,
                leading: Icon(Boxicons.bx_pin),
                iconColor: c.blackMain,
                textColor: c.blackMain,
                title: Inter(
                    text: "Unpin from profile",
                    size: 15,
                    color: c.blackMain,
                    fontWeight: f.semiBold),
                onTap: () async {
                  Map<String, String> data = {
                    "pinPost" : widget.idpost!
                  };
                  await networkHandler.post("/profile/deletePinned/" + widget.my_username!, data);
                  fetchdata();
                  // widget.fetchpinned;
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacement(
                      PageTransition(type: PageTransitionType.fade, child: Navbar(currentState: 4), duration: Duration(milliseconds: 0)));
                },
              ),
            ),
            Divider(
              height: 0,
              color: c.greySub,
              thickness: 1.5,
            ),
          ],
        ),
        if(widget.post_username != widget.my_username)Column(
          children: [
            Container(
              child: ListTile(
                horizontalTitleGap: 0,
                leading: Icon(Boxicons.bx_error_circle),
                iconColor: c.blackMain,
                textColor: c.blackMain,
                title: Inter(
                    text: "Report Post",
                    size: 15,
                    color: c.blackMain,
                    fontWeight: f.semiBold),
                onTap: () async {
                  // Future.delayed(Duration(microseconds: 0));
                  closeDialog(context);
                  await Navigator.of(context).push(_createRoute());
                },
              ),
              decoration: BoxDecoration(
                color: c.textWhite,
              ),
            ),
            Divider(
              height: 0,
              color: c.greySub,
              thickness: 1.5,
            ),
          ],
        ),
        if(widget.post_username == widget.my_username)Container(
          child: ListTile(
            horizontalTitleGap: 0,
            leading: Icon(FeatherIcons.trash2),
            iconColor: c.redMain,
            textColor: c.redMain,
            title: Inter(
                text: "Delete this Post",
                size: 15,
                color: c.redMain,
                fontWeight: f.semiBold),
            onTap: () async {
              Map<String, String> data = {
                "idPost" : widget.idpost!
              };
              // Future.delayed(Duration(microseconds: 0));
              showDeleteDialog(context);
            },
          ),
          decoration: BoxDecoration(
            color: c.textWhite,
          ),
        ),
      ],
    );
  }
}



//close Dialog
void closeDialog(context) {
  Navigator.of(context).pop();
}

//Edit
Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const ReportPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}



