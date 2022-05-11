import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../pages/navbar.dart';
import '../postProvider.dart';
import '../widgets/font.dart';
import '../widgets/fontWeight.dart';

class CreatPostLoadingScreen extends StatefulWidget {
  const CreatPostLoadingScreen({Key? key}) : super(key: key);

  @override
  State<CreatPostLoadingScreen> createState() => _CreatPostLoadingScreenState();
}

class _CreatPostLoadingScreenState extends State<CreatPostLoadingScreen> {
  @override
  void initState() {
    super.initState();
    // print(isLoaded);
    Provider.of<PostProvider>(context, listen: false).fetchData().then((value) =>
        Future.delayed(Duration(seconds: 1),(){
          Navigator.of(context).pushReplacement(
              PageTransition(type: PageTransitionType.fade, child: Navbar(currentState: 0,), duration: Duration(milliseconds: 0)));
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
        child: Center(
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/img/2.gif",width: 18),
              SizedBox(width: 5),
              Inter(text: 'Posting...', size: 15, color: Colors.black, fontWeight: f.semiBold),
            ],
          ),
        ),
      ),
    );
  }
}
