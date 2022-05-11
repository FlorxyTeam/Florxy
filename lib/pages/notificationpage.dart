import 'package:Florxy/Model/notificationModel.dart';
import 'package:Florxy/NetworkHandler.dart';
import 'package:Florxy/postProvider.dart';
import 'package:Florxy/widgets/NotificationWidget.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:boxicons/boxicons.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';


class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool vis = true;
  List data = [];
  final storage = new FlutterSecureStorage();
  final networkHandler = NetworkHandler();


  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    Provider.of<PostProvider>(context, listen: false).fetchNotification();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
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
            title: Padding(
              padding: const EdgeInsets.only(top: 12.0,left: 6),
              child: Poppins(
                text: 'Notification Center',
                fontWeight: f.semiBold,
                color: c.blackMain,
                size: 25,
              ),
            ),

          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height - 200,
        child: Consumer<PostProvider>(
            builder: (context, model, _) => FutureBuilder(
              future: model.fetchNotification(),
              builder: (context, snapshot) => ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: model.notification?.length ?? 0,
                itemBuilder: (context, int index) {
                  return
                    model.notification![index]['type'] == 'reply'
                  ? NotificationReply(
                    username: model.notification![index]['username'],
                    otherusername: model.notification![index]['otherusername'],
                    body: model.notification![index]['body'],
                    type: model.notification![index]['type'],
                    createAt: model.notification![index]['createdAt'].toString().substring(0, 10),
                  )
                   :model.notification![index]['type'] == 'follow'
                  ? NotificationFollow(
                    username: model.notification![index]['username'],
                    otherusername: model.notification![index]['otherusername'],
                    body: model.notification![index]['body'],
                    type: model.notification![index]['type'],
                    createAt: model.notification![index]['createdAt'].toString().substring(0, 10),
                  )
                   :model.notification![index]['type'] == 'fav'
                  ? NotificationFavPost(
                    username: model.notification![index]['username'],
                    otherusername: model.notification![index]['otherusername'],
                    body: model.notification![index]['body'],
                    type: model.notification![index]['type'],
                    createAt: model.notification![index]['createdAt'].toString().substring(0, 10),
                  )

                        : Container();
                },
              ),
            )),
      ),
    );
    return Center(
      child: Poppins(text: "Notification Page", size: 20, color: c.greenMain, fontWeight: f.medium),
    );
  }
}
