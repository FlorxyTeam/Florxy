import 'dart:io';

import 'package:Florxy/widgets/ModalLogin.dart';
import 'package:Florxy/pages/navbar.dart';

import 'package:flutter/material.dart';
import 'package:Florxy/widgets/button.dart';
import 'package:Florxy/pages/profilepage.dart';

import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';
import 'package:image_picker/image_picker.dart';

class ImportPage extends StatefulWidget {
  const ImportPage({Key? key}) : super(key: key);

  @override
  _ImportPageState createState() => _ImportPageState();
}

class _ImportPageState extends State<ImportPage> {

  File? image;

  @override
  Future takePhoto(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: c.blackMain.withOpacity(0),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 0, right: 0, top: 0),
            child:
            Container(
                child: image == null ? Container(
                  height: 700,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0),
                    borderRadius: BorderRadius.all(Radius.circular(13.0)),
                  ),
                ) : Container(
                  height: 700,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0),
                    borderRadius: BorderRadius.all(Radius.circular(13.0)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(13.0)),
                    child: Image.file(
                      image!,
                      width: 700,
                      height: 700,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
            ),
          ),
          SizedBox(height: 250),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 200),
            child: Center(
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.remove_red_eye_outlined,
                            color: c.greyMain.withOpacity(0.8),
                          ),
                        ),
                        TextSpan(
                          text: ' Sense your product here',
                          style: TextStyle(
                            color: c.greyMain.withOpacity(0.8),
                            fontWeight: f.bold,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 270, right: 0, top: 600),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.white,
                  width: 3.0,
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0),
                      offset: Offset(0.0, 0.0),
                      blurRadius: 10.0
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(55.0),
                child: Align(
                  alignment: Alignment.center,
                  widthFactor: 0.90,
                  heightFactor: 0.70,
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),

                      ),
                      child: InkWell(
                        onTap: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(5.0))),
                              actions: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 7),
                                  child: Column(
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                    width: 0.8,
                                                    color: c.greyMain.withOpacity(0.5)),

                                              )),
                                          child: ListTile(
                                              onTap: () async {
                                                Future.delayed(Duration(seconds: 5));
                                                Navigator.of(context).pop();
                                                await takePhoto(ImageSource.gallery);
                                              },
                                              title: Inter(
                                                text: "Choose Image Product",
                                                color: c.blackMain,
                                                size: 14,
                                                fontWeight: f.medium,
                                              ))),
                                      Container(
                                          child: ListTile(
                                            onTap: () async {
                                              Future.delayed(Duration(seconds: 5));
                                              Navigator.of(context).pop();
                                              await takePhoto(ImageSource.gallery);
                                            },
                                            title: Inter(
                                              text: "Choose Barcode",
                                              color: c.blackMain,
                                              size: 14,
                                              fontWeight: f.medium,
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Icon(
                          Icons.image_search_outlined,
                          color: Colors.white,
                          size: 60,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 10, top: 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GFButton(
                          onPressed:  () {
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute
                              (builder: (context)=>Navbar()), (route) => false);
                          },
                          text: 'on',
                          textStyle : TextStyle(color: Colors.yellow, fontSize: 15, fontWeight: FontWeight.bold),
                          icon: Icon(Icons.flash_on,size: 15,color: Colors.yellow,),
                          color: Colors.yellow,
                          type: GFButtonType.outline2x,
                          shape: GFButtonShape.pills,
                          size: GFSize.LARGE,
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute
                              (builder: (context)=>Navbar()), (route) => false);
                          },
                          icon: Icon(
                            Icons.close_rounded,
                            size: 36,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}