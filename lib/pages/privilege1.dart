import 'package:Florxy/widgets/fontWeight.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/button.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/pages/editprofile.dart';


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
                                      size: 16,
                                      color: c.blackSub,
                                      fontWeight: f.bold),
                                ),
                                SizedBox(height: 15),
                                Align(
                                  alignment: Alignment.center,
                                  child: Poppins(
                                      text: 'Lorem Ipsum is simply dummy text of the printing',
                                      size: 11,
                                      color: c.blackSub,
                                      fontWeight: f.medium),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Poppins(
                                      text: 'and typesetting industry.',
                                      size: 11,
                                      color: c.blackSub,
                                      fontWeight: f.medium),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 580),
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