import 'package:flutter/material.dart';
import 'package:Florxy/pages/navbar.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/fontWeight.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Inter(
        //       text: "Settings", size: 16, color: c.blackMain, fontWeight: f.bold),
        //   centerTitle: true,
        //   backgroundColor: Colors.white,
        //   iconTheme: IconThemeData(color: c.blackMain),
        //   leading: IconButton(icon: IconsData.arrow_back, onPressed: () {}),
        // ),
        body: Container(
          child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: c.blackSub),
              onPressed: () => Navigator.of(context).pop()),
        ),
      ),
    );
  }
}
