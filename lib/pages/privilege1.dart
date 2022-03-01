import 'package:Florxy/pages/reportpage.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/pages/editprofile.dart';
import 'package:share_plus/share_plus.dart';


class Privilege1 extends StatefulWidget {
  const Privilege1({Key? key}) : super(key: key);

  @override
  _Privilege1State createState() => _Privilege1State();
}

class _Privilege1State extends State<Privilege1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF9F9F9),
        body: Stack(
          children: [
            SafeArea(
              child: Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Stack(
                        children: [
                          IconButton(
                            icon: Icon(Icons.close,),
                            iconSize: 30,
                            color: Colors.black,
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditPage()));
                            },
                          ),
                          SizedBox(height: 18),
                          Padding(
                            padding: const EdgeInsets.only(left: 0, right: 0, top: 100),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Poppins(
                                      text: 'Get a Creator or Professor Alias',
                                      size: 17,
                                      color: c.blackSub,
                                      fontWeight: f.bold),
                                ),
                                SizedBox(height: 15),
                                Align(
                                  alignment: Alignment.center,
                                  child: Poppins(
                                      text: 'Lorem Ipsum is simply dummy text of the printing',
                                      size: 11.5,
                                      color: c.blackSub,
                                      fontWeight: f.medium),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Poppins(
                                      text: 'and typesetting industry.',
                                      size: 11.5,
                                      color: c.blackSub,
                                      fontWeight: f.medium),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 100, right: 100, top: 200),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => ReportPage()), (route) => false);
                              },
                              child: GreyButton(
                                text: 'Report',
                                size: 13,
                                color: c.textWhite,
                                height: 40,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 100, right: 100, top: 230),
                            child: GestureDetector(
                              onTap: () async {
                                await Share.share('Thia App is Florxy.');
                              },
                              child: GreyButton(
                                text: 'Share',
                                size: 13,
                                color: c.textWhite,
                                height: 40,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 570),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: c.greenMain,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: c.greySub,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: c.greySub,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}