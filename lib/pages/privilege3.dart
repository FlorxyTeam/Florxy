import 'package:Florxy/pages/professororcreator.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/pages/editprofile.dart';

class Privilege3 extends StatefulWidget {
  const Privilege3({Key? key}) : super(key: key);

  @override
  _Privilege3State createState() => _Privilege3State();
}

class _Privilege3State extends State<Privilege3> {
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
                                SizedBox(width: 8),
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: c.greenMain,
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
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => ProfessorOrCreator()), (route) => false);
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