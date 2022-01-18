import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/fontWeight.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Florxy',
        theme: ThemeData(),
        home: Scaffold(
          body: Container(
              padding: EdgeInsets.only(top: 60),
              child: Row(
                children: [
                  Poppins(text: "Putita สวัสดี ", size: 30, color: c.blackMain , fontWeight: f.bold),
                  Roboto(text: "Florxy ", size: 30, color: c.blackMain, fontWeight: f.bold,),
                  Inter(text: "Florxy ", size: 30, color: c.blackMain, fontWeight: f.bold)
                ],
              )
        )));
  }
}
