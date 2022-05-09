import 'package:Florxy/CompareProduct/searchProduct.dart';
import 'package:Florxy/pages/scrap.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:async';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Florxy/pages/brandoverview.dart';
import 'package:Florxy/pages/listOfbrand.dart';

class CardItem {
  final String urlImage;
  final String title;

  const CardItem({
    required this.urlImage,
    required this.title,
  });
}

class BrandsItem {
  final String urlImage;
  final String title;

  const BrandsItem({
    required this.urlImage,
    required this.title,
  });
}

var refreshKey = GlobalKey<RefreshIndicatorState>();

class laboratory extends StatefulWidget {
  const laboratory({Key? key}) : super(key: key);

  @override
  _laboratoryState createState() => _laboratoryState();
}

class _laboratoryState extends State<laboratory> {
  final storage = new FlutterSecureStorage();
  Future<void> _refreshPage() async {
    // refreshKey.currentState?.show(atTop: false);

      await storage.delete(key: "p_id1");
      await storage.delete(key: "p_id2");
      await storage.delete(key: "p_id3");
      storage.write(key: "num", value: '0');

    await Future.delayed(Duration(seconds: 1));
  }

  List<CardItem> items = [
    CardItem(
      urlImage: "assets/img/bioderma.jpg",
      title: "Make up",
    ),
    CardItem(
      urlImage: "assets/img/pixi.jpg",
      title: "Skincare",
    ),
    CardItem(
      urlImage: "assets/img/bioderma.jpg",
      title: "Body",
    ),
    CardItem(
      urlImage: "assets/img/pixi.jpg",
      title: "Hair",
    ),
    CardItem(
      urlImage: "assets/img/bioderma.jpg",
      title: "Fragrance",
    ),
    CardItem(
      urlImage: "assets/img/pixi.jpg",
      title: "Oral Care",
    ),
  ];

  List<BrandsItem> brands = [
    BrandsItem(
      urlImage: "assets/img/pixi_logo.png",
      title: "Pixi",
    ),
    BrandsItem(
      urlImage: "assets/img/laroache_logo.jpg",
      title: "Bioderma",
    ),
    BrandsItem(
      urlImage: "assets/img/bioderma_logo.png",
      title: "La Roche posay",
    ),
    BrandsItem(
      urlImage: "assets/img/laroache_logo.jpg",
      title: "innisfree",
    ),
    BrandsItem(
      urlImage: "assets/img/bioderma_logo.png",
      title: "Make up",
    ),
    BrandsItem(
      urlImage: "assets/img/laroache_logo.jpg",
      title: "Skincare",
    ),
  ];

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
                      onPressed: () {
                        // Scrap
                        // Navigator.of(context).push(
                        //     MaterialPageRoute(builder: (context) => Scrap()));
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
      body: LiquidPullToRefresh(
        onRefresh: _refreshPage,
        color: c.greenMain,
        height: 100,
        backgroundColor: c.textWhite,
        animSpeedFactor: 10,
        showChildOpacityTransition: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
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
                          height: MediaQuery.of(context).size.height * 0.12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: c.shadow.withOpacity(0.32),
                                spreadRadius: -17,
                                blurRadius: 30,
                                offset:
                                    Offset(0, 6), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 22, right: 22),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      padding: const EdgeInsets.only(right: 8),
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
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchToCompare()));
                        },
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
                                offset:
                                    Offset(0, 6), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 22, right: 22),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      padding: const EdgeInsets.only(right: 8),
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
                                offset:
                                    Offset(0, 6), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 22, right: 22),
                                child: Container(
                                  height: 58,
                                  width: 58,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage("assets/img/opacity.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      padding: const EdgeInsets.only(right: 8),
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
                        onTap: () {

                        },
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
                                offset:
                                    Offset(0, 6), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 22),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.11,
                                  width: 67,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(18),
                                      bottomLeft: Radius.circular(18),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage("assets/img/pixi.jpg"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Bioderma | Sensibio Defensive ",
                                        style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: f.semiBold,
                                            color: Color(0xFF053118)),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Poppins(
                                          text: "3 rank updown",
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
                                offset:
                                    Offset(0, 6), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 22),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.11,
                                  width: 67,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(18),
                                      bottomLeft: Radius.circular(18),
                                    ),
                                    image: DecorationImage(
                                      image:
                                          AssetImage("assets/img/bioderma.jpg"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Bioderma | Sensibio Defensive ",
                                        style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: f.semiBold,
                                            color: Color(0xFF053118)),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),

                                    //  Text(
                                    //   'Bioderma | Sensibio Defensive',
                                    //    style: TextStyle(fontFamily: 'google_fonts/Poppins'),
                                    //     overflow: TextOverflow.ellipsis,
                                    //     maxLines: 1,
                                    // ),

                                    Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Poppins(
                                          text: "1 rank downvote",
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 28, top: 22, bottom: 6),
                    child: Poppins(
                      text: "Search By Category",
                      color: c.blackMain,
                      fontWeight: f.semiBold,
                      size: 18,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: ListView.separated(
                      padding: EdgeInsets.only(left: 28, right: 2),
                      itemCount: 5,
                      separatorBuilder: (context, _) => SizedBox(width: 10),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          buildCard(item: items[index]),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 9,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 28, top: 22, bottom: 6),
                    child: Poppins(
                      text: "Search By Brand",
                      color: c.blackMain,
                      fontWeight: f.semiBold,
                      size: 18,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.height,
                    child: ListView.separated(
                      padding: EdgeInsets.only(left: 28, right: 2),
                      itemCount: 6,
                      separatorBuilder: (context, _) => SizedBox(width: 10),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          buildCard_brand(brandsItem: brands[index]),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 9,
              )
            ],
          ),
        ),
      ),
    );
  }

  //Search by category
  Widget buildCard({
    required CardItem item,
  }) =>
      Container(
        width: MediaQuery.of(context).size.width * 0.28,
        height: MediaQuery.of(context).size.height * 0.17,
        child: Stack(
          children: [
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => listOfbrand()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.28,
                  height: MediaQuery.of(context).size.height * 0.17,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.115,
                        width: MediaQuery.of(context).size.width * 0.34,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          image: DecorationImage(
                            image: AssetImage(item.urlImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 7),
                        child: Poppins(
                            text: item.title,
                            size: 14,
                            color: Color(0xFF254231),
                            fontWeight: f.semiBold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  //Search by Brand
  Widget buildCard_brand({
    required BrandsItem brandsItem,
  }) =>
      Container(
        width: MediaQuery.of(context).size.width * 0.28,
        height: MediaQuery.of(context).size.height * 0.17,
        child: Stack(
          children: [
            Center(
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.28,
                  height: MediaQuery.of(context).size.height * 0.17,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.115,
                        width: MediaQuery.of(context).size.width * 0.34,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          image: DecorationImage(
                            image: AssetImage(brandsItem.urlImage),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(top: 5, left: 7),
                          width: MediaQuery.of(context).size.width * 0.34,
                          child: Text(
                            brandsItem.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: f.semiBold,
                                color: Color(0xFF254231)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
