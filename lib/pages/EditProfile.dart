import 'package:flutter/material.dart';
import 'package:slide_popup_dialog_null_safety/pill_gesture.dart';
import 'package:slide_popup_dialog_null_safety/slide_dialog.dart';
import 'package:slide_popup_dialog_null_safety/slide_popup_dialog.dart';

class EditPage extends StatelessWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Edit profile'),
      ),
    );
  }
}
