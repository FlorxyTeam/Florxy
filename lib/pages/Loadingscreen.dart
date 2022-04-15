import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../postProvider.dart';
import 'navbar.dart';
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    // print(isLoaded);
    Provider.of<PostProvider>(context, listen: false).fetchData().then((value) =>
        Future.delayed(Duration(seconds: 1),(){
          Navigator.of(context).pushReplacement(
              PageTransition(type: PageTransitionType.fade, child: Navbar(currentState: 0,), duration: Duration(milliseconds: 600)));
        })
    );


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

