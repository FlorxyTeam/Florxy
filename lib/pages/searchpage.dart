import 'dart:async';
import 'dart:ffi';

import 'package:Florxy/Model/postModel.dart';
import 'package:Florxy/Post/addPost.dart';
import 'package:Florxy/pages/searchpost.dart';
import 'package:Florxy/pages/sensepage.dart';
import 'package:Florxy/widgets/SearchMentionPostWidget.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:boxicons/boxicons.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/scrapper/incidecoder.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_rx/src/rx_workers/rx_workers.dart';
import 'package:provider/provider.dart';


import '../NetworkHandler.dart';
import '../postProvider.dart';
import '../widgets/ModalMentionPost.dart';
import '../widgets/PostWidget.dart';
import '../widgets/searchwidget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}
  NetworkHandler networkHandler = NetworkHandler();



class _SearchPageState extends State<SearchPage> {

  @override
  Widget build(BuildContext context) {
    // product();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            Theme.of(context).platform == TargetPlatform.android ? 75 : 66.0),
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
            leading: Padding(
              padding: EdgeInsets.only(
                  top: Theme.of(context).platform == TargetPlatform.android
                      ? 17.5
                      : 0,
                  left: 15),
              child: IconButton(
                icon: Icon(FeatherIcons.maximize),
                iconSize: 25,
                color: Colors.black,
                onPressed: () async {
                  await availableCameras().then((value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SensePage(cameras: value))));
                },
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(
                    top: Theme.of(context).platform == TargetPlatform.android
                        ? 22
                        : 0,
                    right: 20,
                    bottom: Theme.of(context).platform == TargetPlatform.android
                      ? 2
                      : 0,),
                child: GestureDetector(
                  onTap:  () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchPost()));
                  },
                  child : Container(
                    width: Theme.of(context).platform == TargetPlatform.android ? 275 : 0,
                    decoration: BoxDecoration(
                      color: c.greyLight,
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                    child: Row(
                      children: [
                        Text("   "),
                        Icon(Icons.search_rounded, size: 20, color: c.blackSub2),
                        Text(
                            "  Search anything",
                            style: TextStyle(fontSize: 13,height: 1.5,color: c.blackSub2,fontWeight: f.medium),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
