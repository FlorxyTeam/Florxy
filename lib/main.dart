// import 'package:Florxy/pages/lastthingspage.dart';
// import 'package:Florxy/pages/navbar.dart';
// import 'package:Florxy/pages/registerpage.dart';
// import 'package:Florxy/pages/welcomepage.dart';
// import 'package:Florxy/widgets/font.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:Florxy/widgets/fontWeight.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:flutter/services.dart';
//
//
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   Widget page = WelcomePage();
//   final storage = new FlutterSecureStorage();
//   // This widget is the root of your application.
//
//   @override
//   void initState(){
//     super.initState();
//     checkLogin();
//   }
//   void checkLogin() async{
//     String? token = await storage.read(key: "token");
//     if(token != null){
//       setState(() {
//         page=Navbar();
//       });
//     }else{
//       setState(() {
//         page= WelcomePage();
//       });
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(systemNavigationBarColor: Colors.white),);
//
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Florxy',
//         theme: ThemeData(),
//         home: page
//         );
//   }
// }

import 'package:flutter/material.dart';
import 'package:Florxy/pages/Laboratory.dart';
import 'package:Florxy/pages/brandoverview.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Brandoverview(),
    );
  }
}
