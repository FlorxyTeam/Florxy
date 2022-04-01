import 'package:Florxy/pages/Loadingscreen.dart';
import 'package:Florxy/pages/navbar.dart';
import 'package:Florxy/pages/welcomepage.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import '../provider/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';


class GoogleStream extends StatelessWidget {
  const GoogleStream({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: WelcomePage());
          }else if(snapshot.hasData){
            print(user);
            return LoadingScreen();
          }else if (snapshot.hasError){
            return Center(child: Poppins(text: "Something went wrong", size: 24, color: c.blackMain, fontWeight: f.bold));
          }else{
          return Center(child: WelcomePage());
          }
        },

      ),
    );
  }
}
