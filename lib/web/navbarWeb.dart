import 'dart:io';
import 'package:Florxy/NetworkHandler.dart';
import 'package:Florxy/pages/homepage.dart';
import 'package:Florxy/pages/notificationpage.dart';
import 'package:Florxy/pages/profilepage.dart';
import 'package:Florxy/pages/searchpage.dart';
import 'package:Florxy/web/adminWeb.dart';
// import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/services.dart';
import 'package:Florxy/pages/Laboratory.dart';

// import 'package:flutter_icons/flutter_icons.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../widgets/font.dart';
import 'homePageWeb.dart';



class NavbarWeb extends StatefulWidget {
  final int currentState;
  const NavbarWeb({Key? key, required this.currentState}) : super(key: key);

  @override
  _NavbarWebState createState() => _NavbarWebState();
}

class _NavbarWebState extends State<NavbarWeb> {
  List pages = [HomePageWeb(), AdminWeb(), laboratory(),NotificationPage(), ProfilePage()];
  int _currentIndex = 0;
  bool isAdmin = false;
  String creator = "";
  NetworkHandler networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();

  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex = widget.currentState;
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      print("WidgetsBinding");
      await storage.write(key: "id", value: "hi");
      print(await storage.read(key:"hi"));
      fetchData();

      // print(results);
    });

  }
  void fetchData() async{
    var response = await networkHandler.get("/profile/getData");
    await storage.write(key: "id", value: response['data']['_id']);
    await storage.write(key: "username", value: response['data']['username']);
    await storage.write(key: "myfullname", value: response['data']['fullname']);
    creator = response['data']['influencer'];
    print("here");
    print(creator);
    isAdmin = creator.contains("Brand Owner")?true:false;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          pages[_currentIndex],
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: size.width,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,),
                child: Row(
                  children: [

                    SizedBox(width: 70,),
                    Poppins(
                      text: 'FLORXY',
                      fontWeight: f.semiBold,
                      color: c.blackMain,
                      size: 25,
                    ),
                    Expanded(child: Container()),
                    Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: _currentIndex == 0
                                ? c.greenLight2.withOpacity(0.8)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                _currentIndex = 0;
                              });
                            },
                            icon: Icon(Boxicons.bx_home_circle),
                            iconSize: 25,
                            color:
                                _currentIndex == 0 ? c.greenMain : Colors.black,
                        )),
                    isAdmin?Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: _currentIndex == 1
                                ? c.greenLight2.withOpacity(0.8)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              print(_currentIndex);
                              setState(() {
                                _currentIndex = 1;
                              });
                            },
                            icon: Icon(Boxicons.bxs_dashboard),
                            iconSize: 25,
                            color:
                                _currentIndex == 1 ? c.greenMain : Colors.black,)):Container(),
                    Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: _currentIndex == 2
                                ? c.greenLight2.withOpacity(0.8)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                _currentIndex = 2;
                              });
                            },
                            icon: Icon(Boxicons.bxs_flask),
                            iconSize: 25,
                            color:
                                _currentIndex == 2 ? c.greenMain : Colors.black,)),
                    Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: _currentIndex == 3
                                ? c.greenLight2.withOpacity(0.8)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                _currentIndex = 3;
                              });
                            },
                            icon: Icon(Boxicons.bx_bell),
                            iconSize: 25,
                            color:
                            _currentIndex == 3 ? c.greenMain : Colors.black,)),
                    Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: _currentIndex == 4
                                ? c.greenLight2.withOpacity(0.8)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                _currentIndex = 4;
                              });
                            },
                            icon: Icon(Boxicons.bx_user_circle),
                            iconSize: 25,
                            color:
                                _currentIndex == 4 ? c.greenMain : Colors.black,)),
                    SizedBox(width: 70,),

                  ],
                ),
              ))
        ],
      ),
    );
  }
}
