import 'package:Florxy/pages/welcomepage.dart';
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
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:slide_popup_dialog_null_safety/slide_popup_dialog.dart'
as slideDialog;
import 'package:Florxy/pages/EditProfile.dart';
import 'package:Florxy/pages/setting.dart';

class ModalBottomSheet {
  static Dialog_Settings(context,username) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            color: Colors.transparent,
            height: 390,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: _buildBottomNavigationMenu(context,username),
              ),
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(40),
                      topRight: const Radius.circular(40))),
            ),
          );
        });
  }
}

Column _buildBottomNavigationMenu(context,username) {
  final storage = new FlutterSecureStorage();
  return Column(
    children: [
      Container(
        width: 88,
        child: Divider(
          height: 0,
          color: c.greyMain,
          thickness: 4,
        ),
      ),
      SizedBox(height: 10),
      Container(
        child: ListTile(
          // shape: Border.,
          leading: Icon(Boxicons.bx_edit_alt),
          iconColor: c.blackMain,
          textColor: c.blackMain,
          title: Inter(
              text: "Edit profile",
              size: 15,
              color: c.blackMain,
              fontWeight: f.semiBold),
          onTap: () async {
            Future.delayed(Duration(microseconds: 0));
            closeDialog(context);
            await Navigator.of(context).push(_createRoute());
          },
        ),
        decoration: BoxDecoration(
            color: c.textWhite,
            border: Border(
              bottom: BorderSide(width: 0.8, color: c.greyMain),
            )),
      ),
      Container(
        child: ListTile(
          leading: Icon(
            Boxicons.bx_box,
          ),
          iconColor: c.blackMain,
          textColor: c.blackMain,
          title: Inter(
              text: "Product seen",
              size: 15,
              color: c.blackMain,
              fontWeight: f.semiBold),
          onTap: () {},
        ),
        decoration: BoxDecoration(
            color: c.textWhite,
            border: Border(
              bottom: BorderSide(width: 0.8, color: c.greyMain),
            )),
      ),
      Container(
        child: ListTile(
          leading: Icon(Icons.post_add_outlined),
          iconColor: c.blackMain,
          textColor: c.blackMain,
          title: Inter(
              text: "Archive post",
              size: 15,
              color: c.blackMain,
              fontWeight: f.semiBold),
          onTap: () {},
        ),
        decoration: BoxDecoration(
            color: c.textWhite,
            border: Border(
              bottom:
              BorderSide(width: 0.8, color: c.greyMain.withOpacity(0.4)),
            )),
      ),
      Container(
        child: ListTile(
          leading: Icon(Icons.settings_outlined),
          iconColor: c.blackMain,
          textColor: c.blackMain,
          title: Inter(
              text: "Settings",
              size: 15,
              color: c.blackMain,
              fontWeight: f.semiBold),
          onTap: () async {
            // Future.delayed(Duration(microseconds: 0));
            closeDialog(context);
            await Navigator.of(context).push(_createRoute1());
          },
        ),
        decoration: BoxDecoration(
            color: c.textWhite,
            border: Border(
              bottom:
              BorderSide(width: 0.8, color: c.greyMain.withOpacity(0.4)),
            )),
      ),
      Container(
        child: ListTile(
          leading: Icon(Icons.logout_outlined),
          iconColor: c.redMain,
          textColor: c.redMain,
          title: Inter(
              text: "Log out",
              size: 15,
              color: c.redMain,
              fontWeight: f.semiBold),
          onTap: () => showDialog<String>(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(27.0))),
              title: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      color: c.blackMain,
                      size: 20.0,
                    ),
                    Inter(
                      text: "Log out @"+username,
                      color: c.blackMain,
                      fontWeight: f.bold,
                      size: 16,
                    ),
                  ],
                ),
              ),
              content: Builder(
                builder: (context){
                  return Container(
                    width: 10,

                    child:
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Inter(
                        text: "Logging out will remove all post data from this device",
                        color: c.greyMain,
                        fontWeight: f.regular,
                        size: 14,
                      ),
                    ),
                  );
                }

              ),
              actions: <Widget>[
                Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(

                            border: Border(
                              bottom:
                              BorderSide(width: 0.8, color: c.greyMain.withOpacity(0.5)),
                              top:
                              BorderSide(width: 0.8, color: c.greyMain.withOpacity(0.5)),
                            )),
                        child: ListTile(
                            onTap: () async {
                              await storage.delete(key: "token");
                              await storage.delete(key: "username");
                              final user = FirebaseAuth.instance.currentUser;
                              print(user);
                              if(user?.providerData[0].providerId=='facebook.com'){
                                final AccessToken? accessToken = await FacebookAuth.instance.accessToken;
                                if (accessToken != null) {
                                  print(accessToken);
                                  await FacebookAuth.instance.logOut();
                                  FacebookAuth.i.logOut();
                                  FirebaseAuth.instance.signOut();
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => WelcomePage()),
                                          (route) => false);
                                }
                              }
                              else if(user?.providerData[0].providerId=='google.com'){
                                final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
                                provider.logout();
                              }

                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WelcomePage()),
                                      (route) => false);
                            },
                            title: Center(
                              child: Inter(
                                text: "Log out",
                                color: c.redMain,
                                size: 14,
                                fontWeight: f.bold,

                              ),
                            )
                        )),
                    Container(
                        child: ListTile(
                          onTap: () => Navigator.pop(context, 'Cancel'),
                          title: Center(
                            child: Inter(
                              text: "Cancle",
                              color: c.blackMain,
                              size: 14,
                              fontWeight: f.bold,
                            ),
                          ),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

//close Dialog
void closeDialog(context) {
  Navigator.of(context).pop();
}

//Edit
Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const EditPage(),
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

//Setting
Route _createRoute1() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Setting(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
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


