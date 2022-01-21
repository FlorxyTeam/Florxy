import 'package:Florxy/widgets/fontWeight.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/pages/EditProfile.dart';

class ModalBottomSheet {
  static Modal_Settings(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            color: Colors.transparent,
            height: 390,
            child: Container(
              child: _buildBottomNavigationMenu(context),
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
      Icon(
        Icons.minimize,
        size: 40,
      ),
      ListTile(
        // shape: Border.,
        leading: Icon(Boxicons.bx_edit_alt),
        iconColor: c.blackMain,
        textColor: c.blackMain,
        title: Text('Edit profile'),
        onTap: () {
          EditProfile.Edit(context);
        },
      ),
      ListTile(
        leading: Icon(
          Boxicons.bx_box,
        ),
        iconColor: c.blackMain,
        textColor: c.blackMain,
        title: Text('Product seen'),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(Icons.archive_outlined),
        iconColor: c.blackMain,
        textColor: c.blackMain,
        title: Text('Archive post'),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(Icons.settings_outlined),
        iconColor: c.blackMain,
        textColor: c.blackMain,
        title: Text('Settings'),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(Icons.logout_outlined),
        iconColor: c.redMain,
        textColor: c.redMain,
        title: Text(
          'Log out',
        ),
        onTap: () {},
      ),
    ],
  );
}
