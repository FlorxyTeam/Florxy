import 'package:Florxy/widgets/fontWeight.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/pages/EditProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:slide_popup_dialog_null_safety/slide_popup_dialog.dart'
    as slideDialog;
import 'package:Florxy/pages/EditProfile.dart';
import 'package:Florxy/pages/setting.dart';

class ModalBottomSheet {
  static Dialog_Settings(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            color: Colors.transparent,
            height: 390,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
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

// class ModalBottomSheet {
//   static Dialog_Settings(context) {
//     slideDialog.showSlideDialog(
//       context: context,
//       pillColor: c.greyMain,
//       child: Container(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
//           child: _buildBottomNavigationMenu(context),
//         ),
//       ),
//     );
//   }
// }

Column _buildBottomNavigationMenu(context) {
  return Column(
    children: [
      Container(
        child: ListTile(
          // shape: Border.,
          leading: Icon(Boxicons.bx_edit_alt),
          iconColor: c.blackMain,
          textColor: c.blackMain,
          title: Inter(
              text: "Edit profile",
              size: 14,
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
              bottom:
                  BorderSide(width: 0.8, color: c.greyMain.withOpacity(0.5)),
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
              size: 14,
              color: c.blackMain,
              fontWeight: f.semiBold),
          onTap: () {},
        ),
        decoration: BoxDecoration(
            color: c.textWhite,
            border: Border(
              bottom:
                  BorderSide(width: 0.8, color: c.greyMain.withOpacity(0.5)),
            )),
      ),
      Container(
        child: ListTile(
          leading: Icon(Icons.post_add_outlined),
          iconColor: c.blackMain,
          textColor: c.blackMain,
          title: Inter(
              text: "Archive post",
              size: 14,
              color: c.blackMain,
              fontWeight: f.semiBold),
          onTap: () {},
        ),
        decoration: BoxDecoration(
            color: c.textWhite,
            border: Border(
              bottom:
                  BorderSide(width: 0.8, color: c.greyMain.withOpacity(0.5)),
            )),
      ),
      Container(
        child: ListTile(
          leading: Icon(Icons.settings_outlined),
          iconColor: c.blackMain,
          textColor: c.blackMain,
          title: Inter(
              text: "Settings",
              size: 14,
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
                  BorderSide(width: 0.8, color: c.greyMain.withOpacity(0.5)),
            )),
      ),
      Container(
        child: ListTile(
          leading: Icon(Icons.logout_outlined),
          iconColor: c.redMain,
          textColor: c.redMain,
          title: Inter(
              text: "Log out",
              size: 14,
              color: c.redMain,
              fontWeight: f.semiBold),
          onTap: () {},
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
