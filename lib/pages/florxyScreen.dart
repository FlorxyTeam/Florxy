import 'package:Florxy/pages/Loadingscreen.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:page_transition/page_transition.dart';

import 'navbar.dart';
class FlorxyScreen extends StatefulWidget {
  const FlorxyScreen({Key? key}) : super(key: key);

  @override
  _FlorxyScreenState createState() => _FlorxyScreenState();
}

class _FlorxyScreenState extends State<FlorxyScreen> {

  @override
  void initState() {
    super.initState();
    // print(isLoaded);
    Future.delayed(Duration(seconds: 1),(){
      Navigator.of(context).pushReplacement(
          PageTransition(type: PageTransitionType.fade, child: LoadingScreen(), duration: Duration(milliseconds: 200)));
    });

  }

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Container()),
            Image.asset("assets/img/icon2.png",width: 50),
            Expanded(child: Container()),
            Poppins(text: 'FLORXY', size: 26, color: c.blackMain, fontWeight: f.semiBold)
          ],
        ),
      ),
    );
  }
}

