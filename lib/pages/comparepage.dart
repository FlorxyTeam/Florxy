import 'package:Florxy/widgets/fontWeight.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:boxicons/boxicons.dart';
import 'package:Florxy/pages/productoverview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Florxy/NetworkHandler.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class comparepage extends StatefulWidget {
  String? id;
  final int currentState;
  comparepage({Key? key, this.id, required this.currentState}) : super(key: key);

  @override
  _comparepageState createState() => _comparepageState();
}

class _comparepageState extends State<comparepage> {
  List pages = [ProductOverview()];
  int _currentIndex = 0;
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();

  @override
  void fetchData() async {
    print(widget.id);

    await storage.write(key: "p_id", value: widget.id);
    await networkHandler.get("/product/" + widget.id!);
  }

  @override
  void initState() {
    fetchData();
    // TODO: implement initState
    super.initState();
    _currentIndex = widget.currentState;
  }



  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          pages[_currentIndex],
          Positioned(
              bottom: 0,
              left: 0,
              child: InkWell(
                onTap: () {
                },
                child: Container(
                  width: size.width,
                  height: Theme.of(context).platform == TargetPlatform.android
                      ? 95
                      : 115,
                  decoration: BoxDecoration(
                      color: c.greenMain,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(39),
                          topRight: Radius.circular(39))),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 20),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 19,
                              width: MediaQuery.of(context).size.width / 2.3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  color: c.textWhite),
                              child: TextButton(
                                onPressed: () => showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  isScrollControlled: true,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20)),
                                  ),
                                  context: context,
                                  builder: (context) => buildCompare(),
                                ),
                                child: Inter(
                                    text: "ADD TO LIST",
                                    letterSpacing: 2,
                                    size: 15,
                                    color: Color(0xFF32A060),
                                    fontWeight: f.extraBold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2, left: 20),
                            child: Roboto(
                                text: "add product to compare",
                                size: 13,
                                color: Color(0xFFFFFFFF).withOpacity(0.68),
                                fontWeight: f.medium),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      Roboto(
                          text: "in list",
                          size: 16,
                          letterSpacing: 1.2,
                          color: Color(0xFFFFFFFF).withOpacity(0.68),
                          fontWeight: f.bold),
                      SizedBox(width: 6),
                      Container(
                        height: MediaQuery.of(context).size.height / 21,
                        width: MediaQuery.of(context).size.height / 21,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                          color: Color(0xFFFFFFFF).withOpacity(0.68),
                        ),
                        child: Center(
                          child: Inter(
                              text: "2",
                              size: 20,
                              color: Color(0xFF0B391E),
                              fontWeight: f.extraBold),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Widget buildCompare() => Container(
        height: MediaQuery.of(context).size.height * 0.92,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(42),
            topLeft: Radius.circular(42),
          ),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 88,
              child: Divider(
                height: 0,
                color: c.greyMain,
                thickness: 4,
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.17,
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/img/cds12002672-1-removebg-preview.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Expanded(
                    child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 10, left: 10, top: 5, bottom: 5),
                        child: Inter(
                            text: "Aesop",
                            size: 13,
                            color: Colors.white,
                            fontWeight: f.semiBold),
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xFF9FA8A3),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "B & Tea Balancing Toner",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                          color: Color(0xFF053118),
                          fontWeight: f.semiBold,
                          fontSize: 16),
                    ),
                    Roboto(
                        text:
                            "It is a long established fact that a reader will be distracted.",
                        size: 12,
                        color: Color(0xFF9D9D9D),
                        fontWeight: f.regular),
                  ],
                )),
                Container(
                  child: InkWell(
                    onTap: () {},
                    child:
                        Icon(Icons.close_rounded, color: c.redMain, size: 24),
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.height,
              child: Divider(
                height: 0,
                color: c.greyMain.withOpacity(0.5),
                thickness: 1,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage("assets/img/fresh-removebg-preview.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Expanded(
                    child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 10, left: 10, top: 5, bottom: 5),
                        child: Inter(
                            text: "Fresh",
                            size: 13,
                            color: Colors.white,
                            fontWeight: f.semiBold),
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xFF9FA8A3),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Rose Deep Hydration Facial Toner",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                          color: Color(0xFF053118),
                          fontWeight: f.semiBold,
                          fontSize: 16),
                    ),
                    Roboto(
                        text:
                            "It is a long established fact that a reader will be distracted.",
                        size: 12,
                        color: Color(0xFF9D9D9D),
                        fontWeight: f.regular),
                  ],
                )),
                Container(
                  child: InkWell(
                    onTap: () {},
                    child:
                        Icon(Icons.close_rounded, color: c.redMain, size: 24),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.height,
              child: Divider(
                height: 0,
                color: c.greyMain.withOpacity(0.5),
                thickness: 1,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/img/pixi-glow.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Expanded(
                    child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 10, left: 10, top: 5, bottom: 5),
                        child: Inter(
                            text: "Pixi Skintreast",
                            size: 13,
                            color: Colors.white,
                            fontWeight: f.semiBold),
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xFF9FA8A3),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Glow Tonic Facial Toner",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                          color: Color(0xFF053118),
                          fontWeight: f.semiBold,
                          fontSize: 16),
                    ),
                    Roboto(
                        text:
                            "It is a long established fact that a reader will be distracted.",
                        size: 12,
                        color: Color(0xFF9D9D9D),
                        fontWeight: f.regular),
                  ],
                )),
                Container(
                  child: InkWell(
                    onTap: () {},
                    child:
                        Icon(Icons.close_rounded, color: c.redMain, size: 24),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(top: 60),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "Compare between ",
                      style: GoogleFonts.roboto(
                          color: Color(0xFFBDBDBD),
                          fontWeight: f.medium,
                          fontSize: 14),
                    ),
                    TextSpan(
                      text: "3",
                      style: GoogleFonts.roboto(
                          color: Color(0xFF32A060),
                          fontWeight: f.bold,
                          fontSize: 13),
                    ),
                    TextSpan(
                      text: " products",
                      style: GoogleFonts.roboto(
                          color: Color(0xFFBDBDBD),
                          fontWeight: f.semiBold,
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 17,
              width: MediaQuery.of(context).size.width / 1.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Color(0xFF32A060),
              ),
              child: TextButton(
                onPressed: () {},
                child: Inter(
                    text: "COMPARE",
                    letterSpacing: 1.7,
                    size: 15,
                    color: Color(0xFFFFFFFF),
                    fontWeight: f.extraBold),
              ),
            )
          ],
        ),
      );
}
