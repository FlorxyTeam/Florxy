import 'package:Florxy/pages/confirmtransformation.dart';
import 'package:Florxy/pages/creatorconfirmtransformation.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/button.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class creatorLicense extends StatefulWidget {
  final String alias;
  const creatorLicense({Key? key,required this.alias}) : super(key: key);

  @override
  _creatorLicenseState createState() => _creatorLicenseState();
}

class _creatorLicenseState extends State<creatorLicense> {
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
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom!= 0;
    String Choose = widget.alias;
    return Scaffold(
        body: Stack(
          children: [
            SafeArea(
              child: Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        if(!isKeyboard) Padding(
                          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                          child:
                          IconButton(
                              icon: Icon(Icons.arrow_back_ios_new,),
                              iconSize: 30,
                              color: Colors.black,
                              onPressed: () => Navigator.of(context).pop()
                          ),
                        ),
                        if(!isKeyboard) Padding(
                          padding: EdgeInsets.only(left: 25, right: 25, top: 80),
                          child:
                          Poppins(
                              text: 'Help us proved your account faster',
                              size: 17,
                              color: c.blackSub,
                              fontWeight: f.bold
                          ),
                        ),
                        if(!isKeyboard) Padding(
                          padding: EdgeInsets.only(left: 25, right: 25, top: 110),
                          child:
                          Row(
                              children:[
                                Text(
                                  'For your ',
                                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: c.blackMain),
                                ),
                                Choose == 'Pharmacy' ?Text(
                                  '$Choose',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffb92796),
                                  ),
                                ): Choose == 'Advisor' ?Text(
                                  '$Choose',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff861a8c),
                                  ),
                                ): Choose == 'Dermatologist' ?Text(
                                  '$Choose',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff5e0e93),
                                  ),
                                ): Choose == 'R&D Cosmetics' ?Text(
                                  '$Choose',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff3a0693),
                                  ),
                                ): Choose == 'Scientist' ?Text(
                                  '$Choose',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff2c0397),
                                  ),
                                ): Choose == 'Makeup Artist' ?Text(
                                  '$Choose',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff1a19aa),
                                  ),
                                ): Choose == 'Beauty Advisor' ?Text(
                                  '$Choose',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff1432bf),
                                  ),
                                ): Choose == 'Beauty & Personal Care' ?Text(
                                  '$Choose',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff2b64ac),
                                  ),
                                ): Choose == 'Hair Salon' ?Text(
                                  '$Choose',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff479ed2),
                                  ),
                                ): Choose == 'Barber Salon' ?Text(
                                  '$Choose',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff439596),
                                  ),
                                ): Choose == 'Cosmetic Dentist' ?Text(
                                  '$Choose',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff85b853),
                                  ),
                                ): Choose == 'Plastic Surgeon' ?Text(
                                  '$Choose',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff54b538),
                                  ),
                                ): Choose == 'Medical Spa' ?Text(
                                  '$Choose',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff469850),
                                  ),
                                ): Choose == 'Surgeon' ?Text(
                                  '$Choose',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff29614b),
                                  ),
                                ): Choose == 'Lasik/Laser Eye Surgeon' ?Text(
                                  '$Choose',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff1d494a),
                                  ),
                                ): Choose == 'Brand Presenter' ?Text(
                                  '$Choose',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff781e0e),
                                  ),
                                ): Choose == 'Brand Owner' ?Text(
                                  '$Choose',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffa42c17),
                                  ),
                                ): Choose == 'Blogger' ?Text(
                                  '$Choose',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffe73324),
                                  ),
                                ): Choose == 'Beauty Blogger' ?Text(
                                  '$Choose',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffe64826),
                                  ),
                                ): Choose == 'Youtuber' ?Text(
                                  '$Choose',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffea6f2e),
                                  ),
                                ): Choose == 'Tiktoker' ?Text(
                                  '$Choose',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffec8532),
                                  ),
                                ): Choose == 'Beauty Supplier' ?Text(
                                  '$Choose',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffee9d39),
                                  ),
                                ): Choose == 'Beauty Supply Store' ?Text(
                                  '$Choose',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff9e6b23),
                                  ),
                                ): Choose == 'Cosmetic Store' ?Text(
                                  '$Choose',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff734c17),
                                  ),
                                ): Text(
                                  '$Choose',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: c.blackMain,
                                  ),
                                ),
                                Text(
                                  ' Alias',
                                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),
                                ),
                              ]
                          ),
                        ),
                        if(!isKeyboard) Padding(
                          padding: EdgeInsets.only(left: 25, right: 25, top: 160),
                          child:
                          Poppins(
                            text: 'Confirmed License or Related Document',
                            size: 12,
                            color: c.blackSub,
                            fontWeight: f.medium,
                          ),
                        ),
                        if(!isKeyboard) Padding(
                          padding: EdgeInsets.only(right: 25, top: 145),
                          child: Align(
                            alignment: Alignment.topRight,
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
                        ),
                        if(!isKeyboard) Padding(
                          padding: EdgeInsets.only(left: 25, right: 25, top: 210),
                          child:
                          Container(
                              child: image == null ? Container(
                                height: 390,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                              ) : Container(
                                height: 390,
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
                        /*if(!isKeyboard) Padding(
                            padding: EdgeInsets.only(left: 25, right: 25, top: 510),
                            child:
                            Poppins(
                              text: 'Or If you have Activated Code',
                              size: 12,
                              color: c.blackSub,
                              fontWeight: f.medium,
                            ),
                          ),
                          if(!isKeyboard) Padding(
                            padding: EdgeInsets.only(left: 25, right: 25, top: 540),
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
                          if(isKeyboard) Padding(
                            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                            child:
                            IconButton(
                              icon: Icon(Icons.arrow_back_ios_new,),
                              iconSize: 30,
                              color: Colors.black,
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Privilege3()));
                              },
                            ),
                          ),
                          if(isKeyboard) Padding(
                            padding: EdgeInsets.only(left: 25, right: 25, top: 60),
                            child:
                            Poppins(
                                text: 'Help us proved your account faster',
                                size: 17,
                                color: c.blackSub,
                                fontWeight: f.bold
                            ),
                          ),
                          if(isKeyboard) Padding(
                            padding: EdgeInsets.only(left: 25, right: 25, top: 90),
                            child:
                            Row(
                                children:[
                                  Text(
                                    'For your ',
                                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: c.blackMain),
                                  ),
                                  Choose == 'Pharmacy' ?Text(
                                    '$Choose',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffb92796),
                                    ),
                                  ): Choose == 'Advisor' ?Text(
                                    '$Choose',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff861a8c),
                                    ),
                                  ): Choose == 'Dermatologist' ?Text(
                                    '$Choose',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff5e0e93),
                                    ),
                                  ): Choose == 'R&D Cosmetics' ?Text(
                                    '$Choose',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff3a0693),
                                    ),
                                  ): Choose == 'Scientist' ?Text(
                                    '$Choose',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff2c0397),
                                    ),
                                  ): Choose == 'Makeup Artist' ?Text(
                                    '$Choose',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff1a19aa),
                                    ),
                                  ): Choose == 'Beauty Advisor' ?Text(
                                    '$Choose',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff1432bf),
                                    ),
                                  ): Choose == 'Beauty & Personal Care' ?Text(
                                    '$Choose',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff2b64ac),
                                    ),
                                  ): Choose == 'Hair Salon' ?Text(
                                    '$Choose',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff479ed2),
                                    ),
                                  ): Choose == 'Barber Salon' ?Text(
                                    '$Choose',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff439596),
                                    ),
                                  ): Choose == 'Cosmetic Dentist' ?Text(
                                    '$Choose',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff85b853),
                                    ),
                                  ): Choose == 'Plastic Surgeon' ?Text(
                                    '$Choose',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff54b538),
                                    ),
                                  ): Choose == 'Medical Spa' ?Text(
                                    '$Choose',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff469850),
                                    ),
                                  ): Choose == 'Surgeon' ?Text(
                                    '$Choose',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff29614b),
                                    ),
                                  ): Choose == 'Lasik/Laser Eye Surgeon' ?Text(
                                    '$Choose',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff1d494a),
                                    ),
                                  ): Choose == 'Brand Presenter' ?Text(
                                    '$Choose',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff781e0e),
                                    ),
                                  ): Choose == 'Brand Owner' ?Text(
                                    '$Choose',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffa42c17),
                                    ),
                                  ): Choose == 'Blogger' ?Text(
                                    '$Choose',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffe73324),
                                    ),
                                  ): Choose == 'Beauty Blogger' ?Text(
                                    '$Choose',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffe64826),
                                    ),
                                  ): Choose == 'Youtuber' ?Text(
                                    '$Choose',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffea6f2e),
                                    ),
                                  ): Choose == 'Tiktoker' ?Text(
                                    '$Choose',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffec8532),
                                    ),
                                  ): Choose == 'Beauty Supplier' ?Text(
                                    '$Choose',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffee9d39),
                                    ),
                                  ): Choose == 'Beauty Supply Store' ?Text(
                                    '$Choose',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff9e6b23),
                                    ),
                                  ): Choose == 'Cosmetic Store' ?Text(
                                    '$Choose',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff734c17),
                                    ),
                                  ): Text(
                                    '$Choose',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: c.blackMain,
                                    ),
                                  ),
                                  Text(
                                    ' Alias',
                                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),
                                  ),
                                ]
                            ),
                          ),
                          if(isKeyboard) Padding(
                            padding: EdgeInsets.only(left: 25, right: 25, top: 130),
                            child:
                            Poppins(
                              text: 'Confirmed License or Related Document',
                              size: 12,
                              color: c.blackSub,
                              fontWeight: f.medium,
                            ),
                          ),
                          if(isKeyboard) Padding(
                            padding: EdgeInsets.only(left: 25, right: 25, top: 160),
                            child:
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(13.0)),
                              ),
                            ),
                          ),
                          if(isKeyboard) Padding(
                            padding: EdgeInsets.only(right: 55, top: 160),
                            child: Align(
                              alignment: Alignment.topRight,
                              child:
                              Container(
                                width: 20,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: c.greyLight,
                                ),
                              ),
                            ),
                          ),
                          if(isKeyboard) SizedBox(height: 15),
                          if(isKeyboard) Padding(
                            padding: EdgeInsets.only(right: 25, top: 160),
                            child: Align(
                              alignment: Alignment.topRight,
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
                          ),
                          if(isKeyboard) Padding(
                            padding: EdgeInsets.only(left: 25, right: 25, top: 220),
                            child:
                            Container(
                                child: image == null ? Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                ) : Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                          if(isKeyboard) Padding(
                            padding: EdgeInsets.only(left: 25, right: 25, top: 280),
                            child:
                            Poppins(
                              text: 'Or If you have Activated Code',
                              size: 12,
                              color: c.blackSub,
                              fontWeight: f.medium,
                            ),
                          ),
                          if(isKeyboard) Padding(
                            padding: EdgeInsets.only(left: 25, right: 25, top: 310),
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
                          ),*/
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 30,
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    image == null ? Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.only(left: 40,right: 40),
                        child: GestureDetector(
                          onTap: () {},
                          child: GreyButton(
                            text: 'CONTINUE',
                            size: 13,
                            color: c.textWhite,
                            height: 60,
                          ),
                        ),
                      ),
                    ) : Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.only(left: 40,right: 40),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => creatorConfirmTransformation()));
                          },
                          child: GreenButton(
                            text: 'CONTINUE',
                            size: 13,
                            color: c.textWhite,
                            height: 60,
                          ),
                        ),
                      ),
                    )
                  ],
                )
            )
          ],
        )
    );
  }
}
