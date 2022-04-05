import 'package:Florxy/green_page.dart';
import 'package:Florxy/pages/Loadingscreen.dart';
import 'package:Florxy/pages/florxyScreen.dart';
import 'package:Florxy/pages/lastthingspage.dart';
import 'package:Florxy/pages/navbar.dart';
import 'package:Florxy/pages/registerpage.dart';
import 'package:Florxy/pages/welcomepage.dart';
import 'package:Florxy/provider/google_sign_in.dart';
import 'package:Florxy/red_page.dart';
import 'package:Florxy/services/local_notification_service.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'postProvider.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

Future<void> backgroundHandler(RemoteMessage message) async{
  print(message.data.toString());
  print(message.notification!.title);
}

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  await FirebaseAppCheck.instance.activate(
    webRecaptchaSiteKey: '6LcaODIfAAAAAMXSDY3Eo9pDPOqXJJHNXnSErkZt',
  );
  // print('test');
  String? token = await FirebaseAppCheck.instance.getToken();
  print(token);
  // await FirebaseAppCheck.instance.activate();
  await FirebaseAppCheck.instance.setTokenAutoRefreshEnabled(true);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget page = FlorxyScreen();
  final storage = new FlutterSecureStorage();
  // This widget is the root of your application.

  @override
  void initState(){
    super.initState();
    checkLogin();

  }
  void checkLogin() async{
    String? token = await storage.read(key: "token");
    print(token);
    if(token != null){
      setState(() {
        page= FlorxyScreen();
      });
    }else{
      setState(() {
        page= WelcomePage();
      });
    }
  }


  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Florxy',
          theme: ThemeData(),
          home: page,
          routes: {
            "red": (_) => RedPage(),
            "green": (_) => GreenPage(),
            },
          ),
      providers: [
        ChangeNotifierProvider( create: (_) => PostProvider()),
        ChangeNotifierProvider(create: (context) => GoogleSignInProvider())
      ]
    );
  }
}
