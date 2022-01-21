import 'package:flutter/material.dart';
import 'package:slide_popup_dialog_null_safety/pill_gesture.dart';
import 'package:slide_popup_dialog_null_safety/slide_dialog.dart';
import 'package:slide_popup_dialog_null_safety/slide_popup_dialog.dart';

class EditProfile {
  static Edit(context) {
    showDialog(
        context: context,
        builder: (context) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(title: Text('Edit protile')),
            ),
          );
        });
  }
}
