import 'package:flutter/material.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';

class OpenSourceLibraries extends StatefulWidget {
  const OpenSourceLibraries({Key? key}) : super(key: key);

  @override
  _OpenSourceLibrariesState createState() => _OpenSourceLibrariesState();
}

class _OpenSourceLibrariesState extends State<OpenSourceLibraries> {

  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: c.shadow.withOpacity(0.32),
                spreadRadius: -17,
                blurRadius: 30,
                offset: Offset(0, 6), // changes position of shadow
              ),
            ],
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(26),
                )),
            title: Padding(
              padding: const EdgeInsets.only(top: 18.5, left: 0),
              child: Stack(
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back_ios_new_rounded),
                      color: c.blackMain,
                      iconSize: 30,
                      onPressed: () => Navigator.of(context).pop()),

                  Padding(
                    padding: const EdgeInsets.only(top: 13, left: 0 ),
                    child: Center(
                      child: Inter(
                          text: "Open Source Libraries",
                          size: 18,
                          color: c.blackMain,
                          fontWeight: f.semiBold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        // resizeToAvoidBottomInset: true,

        child: Container(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Form(
              child: ListView(
                padding: const EdgeInsets.only(top: 20,right: 30,left: 30),
                children: <Widget>[
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage('assets/img/icon2.png'),
                            height: 35,
                          ),
                          SizedBox(width: 20,),
                          Align(
                            alignment: Alignment.topCenter,
                            child:Text(
                              "List Of Open Source Libraries",
                              style: TextStyle(fontSize: 18,height: 1.5,fontWeight: f.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(
                        color: c.greyMain,
                        thickness: 0.5,
                        height: 0,
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "flutter:", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "  sdk: flutter", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "cupertino_icons: ^1.0.2", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "http:", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "flutter_launcher_icons: ^0.9.2", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "google_fonts: ^2.2.0", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "build_runner:", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "boxicons: ^2.1.3", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "liquid_pull_to_refresh: ^3.0.1", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "custom_refresh_indicator: ^1.0.0", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "custom_line_indicator_bottom_navbar: ^0.0.8", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "flutter_svg: ^1.0.2", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "tabbar: ^0.1.1", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "modal_bottom_sheet: ^2.0.0", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "pull_to_refresh: ^2.0.0", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "slide_popup_dialog_null_safety: ^1.0.0", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "page_transition: ^2.0.4", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "flutter_icons: ^1.1.0", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "flutter_typeahead: ^3.2.4", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "logger: ^1.1.0", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "flutter_secure_storage: ^5.0.2", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "image_picker: ^0.8.4+4", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "json_annotation:", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "flutter_linear_datepicker: ^2.0.4", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "get: ^4.6.1", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "html:", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "getwidget: ^2.0.4", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "camera: ^0.9.4+14", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "ionicons: ^0.1.2", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "flutter_feather_icons: ^2.0.0+1", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "material_design_icons_flutter: ^5.0.6595", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "photo_view: ^0.13.0", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "flutter_cupertino_datetime_picker: ^3.0.0", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "intl:", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "firebase_auth: ^3.3.5", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "google_sign_in: ^5.2.3", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "provider: ^6.0.2", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "flappy_search_bar_ns: ^2.0.2", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "flutter_facebook_auth: ^4.0.1", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "screenshot: ^1.2.3", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "path_provider: ^2.0.9", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "share_plus: ^3.1.0", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "firebase_messaging: ^11.2.12", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "flutter_local_notifications: ^9.5.2", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "firebase_core: ^1.16.0", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "firebase_storage: 10.2.15", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "file_picker:", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "firebase_app_check: ^0.0.6+11", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "socket_io_client: ^0.9.12", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "json_serializable:", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "flat_icons_flutter:", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "tflite: ^1.1.1", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "meta:", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "cached_network_image: ^3.2.0", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "flutter_cache_manager: ^3.3.0", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "flutter_rating_bar: ^4.0.0", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Divider(
                        color: c.greyMain,
                        thickness: 0.5,
                        height: 0,
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}