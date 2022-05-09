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
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:slide_popup_dialog_null_safety/slide_popup_dialog.dart'
as slideDialog;

class ModalBottomSheetPost {
  static Dialog_Settings(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            color: Colors.transparent,
            height: 280,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: _buildBottomNavigationMenu(context),
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

Column _buildBottomNavigationMenu(context) {
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
          leading: Icon(Icons.person_add_alt_outlined),
          iconColor: c.blackMain,
          textColor: c.blackMain,
          title: Inter(
              text: "Follow @opsst_",
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
          leading: Icon(
            Boxicons.bx_volume_mute,
          ),
          iconColor: c.blackMain,
          textColor: c.blackMain,
          title: Inter(
              text: "Mute @opsst_",
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
          leading: Icon(Icons.block),
          iconColor: c.blackMain,
          textColor: c.blackMain,
          title: Inter(
              text: "Block @opsst_",
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



