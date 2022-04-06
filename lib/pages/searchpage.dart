import 'dart:async';
import 'dart:ffi';

import 'package:Florxy/Model/postModel.dart';
import 'package:Florxy/Post/addPost.dart';
import 'package:Florxy/pages/searchpost.dart';
import 'package:Florxy/widgets/SearchMentionPostWidget.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/scrapper/incidecoder.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_rx/src/rx_workers/rx_workers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';


import '../NetworkHandler.dart';
import '../postProvider.dart';
import '../widgets/PostWidget.dart';
import '../widgets/searchwidget.dart';
import 'Laboratory.dart';
import 'listOfbrand.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}



class _SearchPageState extends State<SearchPage> {
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
        preferredSize: Size.fromHeight(
            Theme.of(context).platform == TargetPlatform.android ? 75 : 66.0),
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
            backgroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(26),
                )),
            leading: Padding(
              padding: EdgeInsets.only(
                  top: Theme.of(context).platform == TargetPlatform.android
                      ? 17.5
                      : 0,
                  left: 15),
              child: IconButton(
                icon: Icon(FeatherIcons.maximize),
                iconSize: 25,
                color: Colors.black,
                onPressed: () async {
                },
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(
                  top: Theme.of(context).platform == TargetPlatform.android
                      ? 22
                      : 0,
                  right: 22,
                  bottom: Theme.of(context).platform == TargetPlatform.android
                      ? 2
                      : 0,),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchPost()));
                  },
                  child: Container(
                    height: Theme.of(context).platform == TargetPlatform.android ? 50 : 0,
                    width: Theme.of(context).platform == TargetPlatform.android ? 275 : 0,
                    decoration: BoxDecoration(
                      color: c.greyLight,
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                    child: Row(
                      children: [
                        Text("   "),
                        Icon(Icons.search_rounded, size: 20, color: c.blackSub2),
                        Text(
                          ' Search Anything',
                          style: TextStyle(fontSize: 13, fontWeight: f.medium, color: c.blackSub2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
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
