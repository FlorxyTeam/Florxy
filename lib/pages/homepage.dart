import 'package:Florxy/widgets/font.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/button.dart';
import 'package:Florxy/pages/cameranavbar.dart';
import 'package:flutter/services.dart';
import 'navbar.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  }
}
