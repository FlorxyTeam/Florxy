import 'package:Florxy/pages/privilege3.dart';
import 'package:Florxy/pages/license.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:Florxy/widgets/button.dart';



class CreatorAccount extends StatefulWidget {
  const CreatorAccount({Key? key}) : super(key: key);

  @override
  _CreatorAccountState createState() => _CreatorAccountState();
}

class _CreatorAccountState extends State<CreatorAccount> {
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
                          SizedBox(height: 18),
                          Padding(
                            padding: EdgeInsets.only(left: 0, right: 0, top: 80),
                            child: Column(
                              children: [
                                Poppins(
                                    text: '        Select best Alias for',
                                    size: 18,
                                    color: c.blackSub,
                                    fontWeight: f.bold
                                ),
                                Poppins(
                                    text: 'Creator account',
                                    size: 18,
                                    color: c.blackSub,
                                    fontWeight: f.bold
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 140),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GFButton(
                                  onPressed:  () {},
                                  text: 'Brand Presenter',
                                  textStyle : TextStyle(color: c.blackMain, fontSize: 14, fontWeight: f.bold),
                                  icon: Icon(
                                    Icons.circle,
                                    color: Color(0xff781e0e),
                                    size: 20,
                                  ),
                                  color: Colors.white,
                                ),
                                Icon(
                                  Icons.check_outlined,color: Colors.white,size: 20,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 170),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GFButton(
                                  onPressed:  () {},
                                  text: 'Brand Owner',
                                  textStyle : TextStyle(color: c.blackMain, fontSize: 14, fontWeight: f.bold),
                                  icon: Icon(
                                    Icons.circle,
                                    color: Color(0xffa42c17),
                                    size: 20,
                                  ),
                                  color: Colors.white,
                                ),
                                Icon(
                                  Icons.check_outlined,color: Colors.white,size: 20,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 200),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GFButton(
                                  onPressed:  () {},
                                  text: 'Blogger',
                                  textStyle : TextStyle(color: c.blackMain, fontSize: 14, fontWeight: f.bold),
                                  icon: Icon(
                                    Icons.circle,
                                    color: Color(0xffe73324),
                                    size: 20,
                                  ),
                                  color: Colors.white,
                                ),
                                Icon(
                                  Icons.check_outlined,color: Colors.white,size: 20,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 230),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GFButton(
                                  onPressed:  () {},
                                  text: 'Beauty Blogger',
                                  textStyle : TextStyle(color: c.blackMain, fontSize: 14, fontWeight: f.bold),
                                  icon: Icon(
                                    Icons.circle,
                                    color: Color(0xffe64826),
                                    size: 20,
                                  ),
                                  color: Colors.white,
                                ),
                                Icon(
                                  Icons.check_outlined,color: Colors.white,size: 20,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 260),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GFButton(
                                  onPressed:  () {},
                                  text: 'Youtuber',
                                  textStyle : TextStyle(color: c.blackMain, fontSize: 14, fontWeight: f.bold),
                                  icon: Icon(
                                    Icons.circle,
                                    color: Color(0xffea6f2e),
                                    size: 20,
                                  ),
                                  color: Colors.white,
                                ),
                                Icon(
                                  Icons.check_outlined,color: Colors.white,size: 20,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 290),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GFButton(
                                  onPressed:  () {},
                                  text: 'Tiktoker',
                                  textStyle : TextStyle(color: c.blackMain, fontSize: 14, fontWeight: f.bold),
                                  icon: Icon(
                                    Icons.circle,
                                    color: Color(0xffec8532),
                                    size: 20,
                                  ),
                                  color: Colors.white,
                                ),
                                Icon(
                                  Icons.check_outlined,color: Colors.white,size: 20,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 320),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GFButton(
                                  onPressed:  () {},
                                  text: 'Beauty Supplier',
                                  textStyle : TextStyle(color: c.blackMain, fontSize: 14, fontWeight: f.bold),
                                  icon: Icon(
                                    Icons.circle,
                                    color: Color(0xffee9d39),
                                    size: 20,
                                  ),
                                  color: Colors.white,
                                ),
                                Icon(
                                  Icons.check_outlined,color: Colors.white,size: 20,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 350),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GFButton(
                                  onPressed:  () {},
                                  text: 'Beauty Supply Store',
                                  textStyle : TextStyle(color: c.blackMain, fontSize: 14, fontWeight: f.bold),
                                  icon: Icon(
                                    Icons.circle,
                                    color: Color(0xff9e6b23),
                                    size: 20,
                                  ),
                                  color: Colors.white,
                                ),
                                Icon(
                                  Icons.check_outlined,color: Colors.white,size: 20,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 380),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GFButton(
                                  onPressed:  () {},
                                  text: 'Cosmetic Store',
                                  textStyle : TextStyle(color: c.blackMain, fontSize: 14, fontWeight: f.bold),
                                  icon: Icon(
                                    Icons.circle,
                                    color: Color(0xff734c17),
                                    size: 20,
                                  ),
                                  color: Colors.white,
                                ),
                                Icon(
                                  Icons.check_outlined,color: Colors.white,size: 20,
                                ),
                              ],
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
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => License()));
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