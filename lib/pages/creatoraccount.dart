import 'package:Florxy/pages/creatorlicense.dart';
import 'package:Florxy/pages/license.dart';
import 'package:Florxy/pages/professororcreator.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:Florxy/widgets/button.dart';



class CreatorAccount extends StatefulWidget {
  const CreatorAccount({Key? key}) : super(key: key);

  @override
  _CreatorAccountState createState() => _CreatorAccountState();
}

class _CreatorAccountState extends State<CreatorAccount> {
  final storage = new FlutterSecureStorage();
  String alias = '';
  @override

  changeText1() {
    setState(() {
      alias = 'Brand Presenter';
    });
  }

  changeText2() {
    setState(() {
      alias = 'Brand Owner';
    });
  }

  changeText3() {
    setState(() {
      alias = 'Blogger';
    });
  }

  changeText4() {
    setState(() {
      alias = 'Beauty Blogger';
    });
  }

  changeText5() {
    setState(() {
      alias = 'Youtuber';
    });
  }

  changeText6() {
    setState(() {
      alias = 'Tiktoker';
    });
  }

  changeText7() {
    setState(() {
      alias = 'Beauty Supplier';
    });
  }

  changeText8() {
    setState(() {
      alias = 'Beauty Supply Store';
    });
  }

  changeText9() {
    setState(() {
      alias = 'Cosmetic Store';
    });
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
                              Navigator.of(context).pop();
                            },
                          ),
                          SizedBox(height: 18),
                          Padding(
                            padding: EdgeInsets.only(left: 0, right: 0, top: 80),
                            child: Column(
                              children: [
                                Poppins(
                                    text: '        Select best Alias for',
                                    size: 15,
                                    color: c.blackSub,
                                    fontWeight: f.bold
                                ),
                                Poppins(
                                    text: 'Creator account',
                                    size: 15,
                                    color: c.blackSub,
                                    fontWeight: f.bold
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 20, right: 20, top: 140),
                              child: alias == 'Brand Presenter' ? Container(
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Color(0xff781e0e),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () {},
                                      text: 'Brand Presenter',
                                      textStyle : TextStyle(color: Colors.white, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xff781e0e),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xff781e0e),
                                        borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                      ),
                                      child : Icon(
                                        Icons.check_outlined,color: Colors.white,size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ) : Container(
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Color(0xff781e0e).withOpacity(0),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () => changeText1(),
                                      text: 'Brand Presenter',
                                      textStyle : TextStyle(color: c.blackMain, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xff781e0e),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xff781e0e).withOpacity(0),
                                        borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                      ),
                                      child : Icon(
                                        Icons.check_outlined,color: Colors.white,size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 20, right: 20, top: 170),
                              child: alias == 'Brand Owner' ? Container(
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Color(0xffa42c17),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () {},
                                      text: 'Brand Owner',
                                      textStyle : TextStyle(color: Colors.white, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xffa42c17),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xffa42c17),
                                        borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                      ),
                                      child : Icon(
                                        Icons.check_outlined,color: Colors.white,size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ) : Container(
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Color(0xffa42c17).withOpacity(0),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () => changeText2(),
                                      text: 'Brand Owner',
                                      textStyle : TextStyle(color: c.blackMain, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xffa42c17),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xffa42c17).withOpacity(0),
                                        borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                      ),
                                      child : Icon(
                                        Icons.check_outlined,color: Colors.white,size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 18.5, right: 20, top: 200),
                              child: alias == 'Blogger' ? Container(
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Color(0xffe73324),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () {},
                                      text: 'Blogger',
                                      textStyle : TextStyle(color: Colors.white, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xffe73324),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xffe73324),
                                        borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                      ),
                                      child : Icon(
                                        Icons.check_outlined,color: Colors.white,size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ) : Container(
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Color(0xffe73324).withOpacity(0),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () => changeText3(),
                                      text: 'Blogger',
                                      textStyle : TextStyle(color: c.blackMain, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xffe73324),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xffe73324).withOpacity(0),
                                        borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                      ),
                                      child : Icon(
                                        Icons.check_outlined,color: Colors.white,size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 20, right: 20, top: 230),
                              child: alias == 'Beauty Blogger' ? Container(
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Color(0xffe64826),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () {},
                                      text: 'Beauty Blogger',
                                      textStyle : TextStyle(color: Colors.white, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xffe64826),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xffe64826),
                                        borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                      ),
                                      child : Icon(
                                        Icons.check_outlined,color: Colors.white,size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ) : Container(
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Color(0xffe64826).withOpacity(0),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () => changeText4(),
                                      text: 'Beauty Blogger',
                                      textStyle : TextStyle(color: c.blackMain, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xffe64826),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xffe64826).withOpacity(0),
                                        borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                      ),
                                      child : Icon(
                                        Icons.check_outlined,color: Colors.white,size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 20, right: 20, top: 260),
                              child: alias == 'Youtuber' ? Container(
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Color(0xffea6f2e),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () {},
                                      text: 'Youtuber',
                                      textStyle : TextStyle(color: Colors.white, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xffea6f2e),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xffea6f2e),
                                        borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                      ),
                                      child : Icon(
                                        Icons.check_outlined,color: Colors.white,size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ) : Container(
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Color(0xffea6f2e).withOpacity(0),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () => changeText5(),
                                      text: 'Youtuber',
                                      textStyle : TextStyle(color: c.blackMain, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xffea6f2e),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xffea6f2e).withOpacity(0),
                                        borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                      ),
                                      child : Icon(
                                        Icons.check_outlined,color: Colors.white,size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 20, right: 20, top: 290),
                              child: alias == 'Tiktoker' ? Container(
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Color(0xffec8532),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () {},
                                      text: 'Tiktoker',
                                      textStyle : TextStyle(color: Colors.white, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xffec8532),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xffec8532),
                                        borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                      ),
                                      child : Icon(
                                        Icons.check_outlined,color: Colors.white,size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ) : Container(
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Color(0xffec8532).withOpacity(0),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () => changeText6(),
                                      text: 'Tiktoker',
                                      textStyle : TextStyle(color: c.blackMain, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xffec8532),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xffec8532).withOpacity(0),
                                        borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                      ),
                                      child : Icon(
                                        Icons.check_outlined,color: Colors.white,size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 20, right: 20, top: 320),
                              child: alias == 'Beauty Supplier' ? Container(
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Color(0xffee9d39),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () {},
                                      text: 'Beauty Supplier',
                                      textStyle : TextStyle(color: Colors.white, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xffee9d39),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xffee9d39),
                                        borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                      ),
                                      child : Icon(
                                        Icons.check_outlined,color: Colors.white,size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ) : Container(
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Color(0xffee9d39).withOpacity(0),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () => changeText7(),
                                      text: 'Beauty Supplier',
                                      textStyle : TextStyle(color: c.blackMain, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xffee9d39),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xffee9d39).withOpacity(0),
                                        borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                      ),
                                      child : Icon(
                                        Icons.check_outlined,color: Colors.white,size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 20, right: 20, top: 350),
                              child: alias == 'Beauty Supply Store' ? Container(
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Color(0xff9e6b23),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () {},
                                      text: 'Beauty Supply Store',
                                      textStyle : TextStyle(color: Colors.white, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xff9e6b23),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xff9e6b23),
                                        borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                      ),
                                      child : Icon(
                                        Icons.check_outlined,color: Colors.white,size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ) : Container(
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Color(0xff9e6b23).withOpacity(0),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () => changeText8(),
                                      text: 'Beauty Supply Store',
                                      textStyle : TextStyle(color: c.blackMain, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xff9e6b23),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xff9e6b23).withOpacity(0),
                                        borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                      ),
                                      child : Icon(
                                        Icons.check_outlined,color: Colors.white,size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 20, right: 20, top: 380),
                              child: alias == 'Cosmetic Store' ? Container(
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Color(0xff734c17),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () {},
                                      text: 'Cosmetic Store',
                                      textStyle : TextStyle(color: Colors.white, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xff734c17),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xff734c17),
                                        borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                      ),
                                      child : Icon(
                                        Icons.check_outlined,color: Colors.white,size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ) : Container(
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Color(0xff734c17).withOpacity(0),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () => changeText9(),
                                      text: 'Cosmetic Store',
                                      textStyle : TextStyle(color: c.blackMain, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xff734c17),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xff734c17).withOpacity(0),
                                        borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                      ),
                                      child : Icon(
                                        Icons.check_outlined,color: Colors.white,size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              )
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
                    alias == '' ? Container(
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
                          onTap: () async {
                            await storage.write(key: "influencer", value: alias);
                            String? aliasname = await storage.read(key: "influencer");
                            print("Select: $aliasname");
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => creatorLicense(alias : alias)));
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