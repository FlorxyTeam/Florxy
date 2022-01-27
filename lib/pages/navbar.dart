import 'dart:io';

import 'package:Florxy/pages/homepage.dart';
import 'package:Florxy/pages/notificationpage.dart';
import 'package:Florxy/pages/profilepage.dart';
import 'package:Florxy/pages/searchpage.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/services.dart';

// import 'package:flutter_icons/flutter_icons.dart';
import 'package:boxicons/boxicons.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  List pages = [HomePage(), SearchPage(), NotificationPage(), ProfilePage()];
  int _currentIndex = 0;

  @override

  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(systemNavigationBarColor: Colors.white),);
    return Scaffold(

      backgroundColor: c.textWhite,
      body: Stack(
        children: [
          pages[_currentIndex],
          Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: size.width,
                height: Theme.of(context).platform==TargetPlatform.android?70:95,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            color: _currentIndex == 0
                                ? c.greenLight2.withOpacity(0.8)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                _currentIndex = 0;
                              });
                            },
                            icon: Icon(Boxicons.bx_home_circle),
                            iconSize: 30,
                            color:
                                _currentIndex == 0 ? c.greenMain : c.greyMain)),
                    Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            color: _currentIndex == 1
                                ? c.greenLight2.withOpacity(0.8)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              print(_currentIndex);
                              setState(() {
                                _currentIndex = 1;
                              });
                            },
                            icon: Icon(Boxicons.bx_search),
                            iconSize: 30,
                            color:
                                _currentIndex == 1 ? c.greenMain : c.greyMain)),
                    Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            color: _currentIndex == 2
                                ? c.greenLight2.withOpacity(0.8)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                _currentIndex = 2;
                              });
                            },
                            icon: Icon(Boxicons.bx_bell),
                            iconSize: 30,
                            color:
                                _currentIndex == 2 ? c.greenMain : c.greyMain)),
                    Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            color: _currentIndex == 3
                                ? c.greenLight2.withOpacity(0.8)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                _currentIndex = 3;
                              });
                            },
                            icon: Icon(Boxicons.bx_user_circle),
                            iconSize: 30,
                            color:
                                _currentIndex == 3 ? c.greenMain : c.greyMain)),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
