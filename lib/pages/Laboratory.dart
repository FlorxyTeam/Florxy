import 'package:boxicons/boxicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/button.dart';
import 'package:flutter/material.dart';

class Laboratory extends StatefulWidget {
  const Laboratory({Key? key}) : super(key: key);

  @override
  _LaboratoryState createState() => _LaboratoryState();
}

class _LaboratoryState extends State<Laboratory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(77.0),
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
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 13, left: 0),
                    child: Center(
                      child: Poppins(
                          text: "Laboratory",
                          size: 24,
                          color: c.blackMain,
                          fontWeight: f.semiBold),
                    ),
                  ),
                  Expanded(child: Container()),
                  IconButton(
                      icon: Icon(Icons.search_rounded),
                      color: c.blackMain,
                      iconSize: 30,
                      onPressed: () {}),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          // padding: const EdgeInsets.only(top: 20,right: 30,left: 30),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(padding: const EdgeInsets.only(left: 28, top: 30,bottom: 16),
                  child: Poppins(
                    text: "Tools",
                    color: c.blackMain,
                    fontWeight: f.semiBold,
                    size: 18,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 28, right: 28, bottom: 27),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 91,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: c.shadow.withOpacity(0.32),
                            spreadRadius: -17,
                            blurRadius: 30,
                            offset: Offset(0, 6), // changes position of shadow
                          ),
                        ],

                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 28, right: 28, bottom: 27),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 91,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: c.shadow.withOpacity(0.32),
                            spreadRadius: -17,
                            blurRadius: 30,
                            offset: Offset(0, 6), // changes position of shadow
                          ),
                        ],

                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 28, right: 28, bottom: 27),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 91,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: c.shadow.withOpacity(0.32),
                            spreadRadius: -17,
                            blurRadius: 30,
                            offset: Offset(0, 6), // changes position of shadow
                          ),
                        ],

                      ),
                    ),
                  ),
                ),



              ],
            )
          ],
        ),
      ),
    );
  }
}
