import 'package:Florxy/pages/privilege3.dart';
import 'package:Florxy/pages/confirmtransformation.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/button.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class License extends StatefulWidget {
  const License({Key? key}) : super(key: key);

  @override
  _LicenseState createState() => _LicenseState();
}

class _LicenseState extends State<License> {

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
        body: Stack(
          children: [
            SafeArea(
              child: Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Stack(
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back_ios_new,),
                            iconSize: 30,
                            color: Colors.black,
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Privilege3()));
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 25, right: 0, top: 80),
                            child:
                            Poppins(
                                text: 'Help us proved your account faster',
                                size: 18,
                                color: c.blackSub,
                                fontWeight: f.bold
                             ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 25, right: 0, top: 110),
                            child:
                            Poppins(
                                text: 'For your Pharmacy Alias',
                                size: 18,
                                color: c.blackSub,
                                fontWeight: f.bold
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 25, right: 0, top: 170),
                            child:
                            Poppins(
                                text: 'Confirmed License or Related Document',
                                size: 12,
                                color: c.blackSub,
                                fontWeight: f.medium,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 25, right: 25, top: 200),
                            child:
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(13.0)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 300, right: 50, top: 200),
                            child:
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: c.greyLight,
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: EdgeInsets.only(left: 300, right: 22, top: 200),
                            child:
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: c.greyLight,
                                borderRadius: BorderRadius.all(Radius.circular(13.0)),
                              ),
                                child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () async {
                                      Future.delayed(Duration(seconds: 5));
                                      await takePhoto(ImageSource.camera);
                                    },
                                    icon: Icon(Boxicons.bx_camera),
                                    iconSize: 30,),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 25, right: 25, top: 265),
                            child:
                            Container(
                                child: image == null ? Container(
                                  height: 250,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                  ),
                                ) : Container(
                                  height: 250,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
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
                          Padding(
                            padding: EdgeInsets.only(left: 25, right: 0, top: 530),
                            child:
                            Poppins(
                              text: 'Or If you have Activated Code',
                              size: 12,
                              color: c.blackSub,
                              fontWeight: f.medium,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 25, right: 0, top: 560),
                            child:
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(13.0)),
                              ),
                              child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Optional',
                                    hintStyle: TextStyle(fontSize: 14, color: c.graySub2, fontWeight: f.regular),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                      borderSide: BorderSide(color: c.graySub2.withOpacity(0), width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                      borderSide: BorderSide(color: c.greenMain, width: 2),
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 15,
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.only(left: 40,right: 40),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ConfirmTransformation()));
                          },
                          child: GreenButton(
                            text: 'CONTINUE',
                            size: 18,
                            color: c.textWhite,
                            height: 60,
                          ),
                        ),
                      ),
                    )],
                )
            )
          ],
        )
    );
  }
}
