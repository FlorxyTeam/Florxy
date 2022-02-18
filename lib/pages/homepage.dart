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
    return Center(
      child: Poppins(text: "Home Page", size: 20, color: c.greenMain, fontWeight: f.medium),
    );
  }
}
