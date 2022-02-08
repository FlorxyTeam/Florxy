import 'package:boxicons/boxicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
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
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 28, top: 30, bottom: 16),
                  child: Poppins(
                    text: "Tools",
                    color: c.blackMain,
                    fontWeight: f.semiBold,
                    size: 18,
                  ),
                ),
                Stack(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 28, right: 28, bottom: 27),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height:  MediaQuery.of(context).size.height * 0.12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: c.shadow.withOpacity(0.32),
                                  spreadRadius: -17,
                                  blurRadius: 30,
                                  offset: Offset(
                                      0, 6), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 22, right: 22),
                                  child: Container(
                                    height: 58,
                                    width: 58,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/img/check-list.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 9, bottom: 8),
                                        child: Poppins(
                                            text: "Ingredient Checker",
                                            size: 15,
                                            color: Color(0xFF053118),
                                            fontWeight: f.semiBold),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8),
                                        child: Inter(
                                            text:
                                                "Lorem Ipsum is simply dummy text of the printing and typesetting",
                                            size: 13,
                                            color: Color(0xFF053118)
                                                .withOpacity(0.51),
                                            fontWeight: f.regular),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 28, right: 28, bottom: 27),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height:  MediaQuery.of(context).size.height * 0.12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: c.shadow.withOpacity(0.32),
                                  spreadRadius: -17,
                                  blurRadius: 30,
                                  offset: Offset(
                                      0, 6), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 22, right: 22),
                                  child: Container(
                                    height: 58,
                                    width: 58,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/img/ab-testing.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 9, bottom: 8),
                                        child: Poppins(
                                            text: "Compare Products",
                                            size: 15,
                                            color: Color(0xFF053118),
                                            fontWeight: f.semiBold),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8),
                                        child: Inter(
                                            text:
                                                "Lorem Ipsum is simply dummy text of the printing and typesetting",
                                            size: 13,
                                            color: Color(0xFF053118)
                                                .withOpacity(0.51),
                                            fontWeight: f.regular),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 28, right: 28, bottom: 27),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: c.shadow.withOpacity(0.32),
                                  spreadRadius: -17,
                                  blurRadius: 30,
                                  offset: Offset(
                                      0, 6), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 22, right: 22),
                                  child: Container(
                                    height: 58,
                                    width: 58,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/img/opacity.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 9, bottom: 8),
                                        child: Poppins(
                                            text: "Similar Products",
                                            size: 15,
                                            color: Color(0xFF053118),
                                            fontWeight: f.semiBold),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8),
                                        child: Inter(
                                            text:
                                                "Lorem Ipsum is simply dummy text of the printing and typesetting",
                                            size: 13,
                                            color: Color(0xFF053118)
                                                .withOpacity(0.51),
                                            fontWeight: f.regular),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28, top: 22, bottom: 16),
                  child: Poppins(
                    text: "Most Mention Product",
                    color: c.blackMain,
                    fontWeight: f.semiBold,
                    size: 18,
                  ),
                ),
                Stack(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 28, right: 28, bottom: 27),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.11,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: c.shadow.withOpacity(0.32),
                                  spreadRadius: -17,
                                  blurRadius: 30,
                                  offset: Offset(
                                      0, 6), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 22),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height * 0.11,
                                    width: 67,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(18),
                                        bottomLeft: Radius.circular(18),
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/img/pixi.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Poppins(
                                          text: "Bioderma | Sensibio Defensive",
                                          size: 15,
                                          color: Color(0xFF053118),
                                          fontWeight: f.semiBold,
                                           ),


                                        //  Text(
                                        //   'Bioderma | Sensibio Defensive',
                                        //    style: TextStyle(fontFamily: 'google_fonts/Poppins'),
                                        //     overflow: TextOverflow.ellipsis,
                                        //     maxLines: 1,
                                        // ),

                                      Padding(
                                        padding:
                                        const EdgeInsets.only(right: 8),
                                        child: Poppins(
                                            text:
                                            "3 rank updown",
                                            size: 12,
                                            color: c.greenMain,
                                            fontWeight: f.medium),
                                      ),
                                      Expanded(child: Container()),
                                      Poppins(
                                        text: "2,433 mentions",
                                        size: 12,
                                        color: c.blackMain,
                                        fontWeight: f.regular,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 28, right: 28, bottom: 27),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.11,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: c.shadow.withOpacity(0.32),
                                  spreadRadius: -17,
                                  blurRadius: 30,
                                  offset: Offset(
                                      0, 6), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 22),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height * 0.11,
                                    width: 67,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(18),
                                        bottomLeft: Radius.circular(18),
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/img/bioderma.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Poppins(
                                        text: "Bioderma | Sensibio Defensive",
                                        size: 15,
                                        color: Color(0xFF053118),
                                        fontWeight: f.semiBold,
                                      ),


                                      //  Text(
                                      //   'Bioderma | Sensibio Defensive',
                                      //    style: TextStyle(fontFamily: 'google_fonts/Poppins'),
                                      //     overflow: TextOverflow.ellipsis,
                                      //     maxLines: 1,
                                      // ),

                                      Padding(

                                        padding:
                                        const EdgeInsets.only(right: 8),
                                        child: Poppins(
                                            text:
                                            "1 rank downvote",
                                            size: 12,
                                            color: c.redMain,
                                            fontWeight: f.medium),
                                      ),
                                      Expanded(child: Container()),
                                      Poppins(
                                        text: "2,315 mentions",
                                        size: 12,
                                        color: c.blackMain,
                                        fontWeight: f.regular,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            )
          ],
        ),
      ),
    );
  }


}
