import 'package:Florxy/widgets/font.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      theme: ThemeData(

      ),
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 60),
          child: Inter(text: "test", size: 30, color: Colors.black, fontWeight: f.m)
        ),
      )
    );
  }
}
