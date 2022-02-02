import 'package:Florxy/widgets/font.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:flutter/services.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Theme.of(context).platform==TargetPlatform.android?75:66.0),
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
            backgroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(26),
                )),
            title: Padding(
              padding: EdgeInsets.only(top: Theme.of(context).platform==TargetPlatform.android?18.5:0),
              child: Poppins(
                text: 'FLORXY',
                fontWeight: f.semiBold,
                color: c.blackMain,
                size: 25,
              ),
            ),
            leading: Padding(
              padding: EdgeInsets.only(top: Theme.of(context).platform==TargetPlatform.android?17.5:0, left: 20),
              child: IconButton(
                icon: Icon(FeatherIcons.maximize),
                iconSize: 25,
                color: Colors.black,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(top: Theme.of(context).platform==TargetPlatform.android?17.5:0),
                child: IconButton(
                  icon: Icon(FeatherIcons.edit),
                  iconSize: 25,
                  color: Colors.black,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Theme.of(context).platform==TargetPlatform.android?17.5:0, right: 20),
                child: IconButton(
                  icon: Icon(FeatherIcons.send),
                  iconSize: 25,
                  color: Colors.black,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
