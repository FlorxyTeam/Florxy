import 'package:Florxy/web/navbarWeb.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:page_transition/page_transition.dart';

import '../pages/navbar.dart';
class LoadingScreenWeb extends StatefulWidget {
  const LoadingScreenWeb({Key? key}) : super(key: key);

  @override
  _LoadingScreenWebState createState() => _LoadingScreenWebState();
}

class _LoadingScreenWebState extends State<LoadingScreenWeb> {

  @override
  void initState() {
    super.initState();
    // print(isLoaded);
    Future.delayed(Duration(seconds: 2),(){
      Navigator.of(context).pushReplacement(
          PageTransition(type: PageTransitionType.fade, child: NavbarWeb(currentState: 0,), duration: Duration(milliseconds: 600)));
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
            Image.asset("assets/img/2.gif",width: 50),
            Expanded(child: Container()),
            Poppins(text: 'FLORXY', size: 26, color: c.blackMain, fontWeight: f.semiBold)
          ],
        ),
      ),
    );
  }
}

