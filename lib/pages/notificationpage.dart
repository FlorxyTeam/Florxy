import 'package:Florxy/widgets/font.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/material.dart';

import 'cameranavbar.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.only(top: 100, left: 35, right: 270),
          child: ElevatedButton(
            onPressed: () async {
              await availableCameras().then(
                    (value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CameraNavbar(cameras: value,),
                  ),
                ),
              );
            },
            child: const Text('Camera'),
          ),
        ),
      ),
    );
    return Center(
      child: Poppins(text: "Notification Page", size: 20, color: c.greenMain, fontWeight: f.medium),
    );
  }
}
