
import 'package:Florxy/Model/brands.dart';
import 'package:Florxy/pages/AllProductBrand.dart';
import 'package:Florxy/pages/productoverview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:boxicons/boxicons.dart';
import 'package:Florxy/pages/comparepage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:Florxy/NetworkHandler.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../postProvider.dart';

class Brandoverview extends StatefulWidget {
  String? p_brand;

  Brandoverview({Key? key, this.p_brand}) : super(key: key);

  @override
  _BrandoverviewState createState() => _BrandoverviewState();
}

class _BrandoverviewState extends State<Brandoverview> {
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();
  BrandModel brand = BrandModel(
      id:'' ,
      name: '',
      owners: [],
      about: '',
      banner: '',
      recommend: []
  );

  @override
  void fetchData() async {
    print(widget.p_brand);
    await storage.write(key: "p_brand", value: widget.p_brand);
    var response = await networkHandler.get("/product/accoutbrand/" +widget.p_brand!);
    setState(() {
      brand = BrandModel.fromJson(response["data"]);
    });
    var x = await storage.read(key: "num");
    if (x == null) {
      storage.write(key: "num", value: '0');
    }
  }

  @override
  void initState() {
    fetchData();
    // TODO: implement initState

    Provider.of<PostProvider>(context, listen: false).fetchBrandOverview();
    Provider.of<PostProvider>(context, listen: false).fetchTopreviewProduct();
    Provider.of<PostProvider>(context, listen: false).fetchTopmentionProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(Icons.arrow_back_ios_new_rounded),
                        color: c.blackMain,
                        iconSize: 29,
                        onPressed: () => Navigator.of(context).pop()),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Poppins(
                        text: widget.p_brand as String,
                        color: c.blackMain,
                        fontWeight: f.semiBold,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.only(right: 28, left: 28),
                width: MediaQuery.of(context).size.width,
                child: Divider(
                  height: 0,
                  color: c.greyMain,
                  thickness: 0.4,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              brand.banner != "" ?
              Container(
                height: MediaQuery.of(context).size.height * 0.26,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("${brand.banner}"),
                    fit: BoxFit.fill,
                  ),
                ),
              ):Container(),
              brand.about != ''?
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 28, top: 30, bottom: 5),
                    child: Poppins(
                      text: "About Brand",
                      color: Color(0xFF254231),
                      fontWeight: f.semiBold,
                      size: 20,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 28, right: 28),
                    child: Text(
                      brand.about,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.inter(
                          fontSize: 12.5,
                          fontWeight: f.regular,
                          color: Color(0xFF828282)),
                    ),
                  ),
                ]
              ):Container(),
              brand.owners == []?
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 28, top: 30, bottom: 16),
                    child: Poppins(
                      text: "Related Account",
                      color: Color(0xFF254231),
                      fontWeight: f.semiBold,
                      size: 20,
                    ),
                  ),
                  Stack(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 28, right: 28, bottom: 20),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.255,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: c.shadow.withOpacity(0.32),
                                  spreadRadius: 0,
                                  blurRadius: 10,
                                  offset:
                                  Offset(0, 0), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 15, left: 18),
                                      child: Container(
                                        height: 56,
                                        width: 56,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 1.5,
                                            color: Color(
                                                0xFF986A4E), //                   <--- border width here
                                          ),
                                          borderRadius: BorderRadius.circular(28),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/img/pixi-logo.gif"),
                                            fit: BoxFit.fill,
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
                                            height: 15,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  (widget.p_brand).toString() +
                                                      " Official",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 16,
                                                      fontWeight: f.semiBold,
                                                      color: Color(0xFF053118)),
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                              ),
                                              Container(
                                                child: InkWell(
                                                  onTap: () {},
                                                  child: Icon(
                                                    Boxicons
                                                        .bx_dots_vertical_rounded,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 6, bottom: 5),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Poppins(
                                                          text: "14K",
                                                          size: 14,
                                                          color: c.blackMain,
                                                          fontWeight: f.semiBold),
                                                      Inter(
                                                          text: "Followers",
                                                          size: 12.5,
                                                          color: c.greyMain,
                                                          fontWeight: f.semiBold),
                                                    ],
                                                  ),
                                                  onTap: () {},
                                                ),
                                                SizedBox(
                                                    width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                        18
                                                  // width: 30,
                                                ),
                                                GestureDetector(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Poppins(
                                                          text: "14",
                                                          size: 14,
                                                          color: c.blackMain,
                                                          fontWeight: f.semiBold),
                                                      Inter(
                                                          text: "Followering",
                                                          size: 12.5,
                                                          color: c.greyMain,
                                                          fontWeight: f.semiBold),
                                                    ],
                                                  ),
                                                  onTap: () {},
                                                ),
                                                SizedBox(
                                                    width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                        18
                                                  // width: 30,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 5, bottom: 5, top: 7),
                                      child: Inter(
                                          text: "@" +
                                              (widget.p_brand).toString() ,
                                          size: 13,
                                          color: Color(0xFF97AFA2),
                                          fontWeight: f.medium),
                                    ),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 6, left: 6, top: 4, bottom: 4),
                                        child: Inter(
                                            text: "Beauty Advisor",
                                            size: 11,
                                            color: Colors.white,
                                            fontWeight: f.semiBold),
                                      ),
                                      decoration: BoxDecoration(
                                          color: c.greenMain,
                                          borderRadius: BorderRadius.circular(10)),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 5, left: 5, top: 2, bottom: 4),
                                        child: Inter(
                                            text: "Beauty Owner",
                                            size: 11,
                                            color: c.blueMain,
                                            fontWeight: f.bold),
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: c.blueMain,
                                          ),
                                          borderRadius: BorderRadius.circular(10)),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15, top: 6),
                                  child: Text(
                                    "Backed by more than 20 years of real world experience as a makeup artist and product developer, Petra Strand launched Pixi, a line of products that give skin a naturally radiant look. As a working mother of four, Petra understood the time challenges women on-the-go face daily",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.inter(
                                        fontSize: 11.5,
                                        fontWeight: f.medium,
                                        color: Color(0xFF828282)),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.6, left: 15, right: 15),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                      MediaQuery.of(context).size.height / 24,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 5, left: 5, top: 2, bottom: 4),
                                        child: Center(
                                          child: Inter(
                                              text: "View Profile",
                                              size: 12,
                                              color: Colors.white,
                                              fontWeight: f.bold),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: c.greenMain,
                                          borderRadius: BorderRadius.circular(7)),
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
                ],
              ):Container(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 28, top: 22, bottom: 6),
                    child: Poppins(
                      text: "Most Popular",
                      color: Color(0xFF254231),
                      fontWeight: f.semiBold,
                      size: 20,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.24,
                    width: MediaQuery.of(context).size.height,
                    // color: c.redMain,
                    child: Consumer<PostProvider>(
                      builder: (context, model, _) => FutureBuilder(
                        future: model.fetchTopreviewProduct(),
                        builder: (context, snapshot) => ListView.separated(
                          padding: EdgeInsets.only(left: 28, right: 2),
                          itemCount: model.topreview?.length ?? 0,
                          separatorBuilder: (context, _) => SizedBox(width: 10),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => buildCard_Popular(
                            model.topreview![index]['p_name'],
                            model.topreview![index]['p_img'],
                            model.topreview![index]['_id'],
                            model.topreview![index]['p_desc'],
                            model.topreview![index]['p_cate'],
                            model.topreview![index]['rating'].toDouble(),
                            model.topreview![index]['numReview'],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 28, top: 22),
                    child: Poppins(
                      text: "Recommend Product",
                      color: Color(0xFF254231),
                      fontWeight: f.semiBold,
                      size: 20,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.372,
                    width: MediaQuery.of(context).size.width,
                    // color: c.redMain,
                    child: Consumer<PostProvider>(
                      builder: (context, model, _) => FutureBuilder(
                        future: model.fetchTopmentionProduct(),
                        builder: (context, snapshot) => ListView.separated(
                          padding: EdgeInsets.only(left: 28, right: 2),
                          itemCount: model.topmention?.length ?? 0,
                          separatorBuilder: (context, _) => SizedBox(width: 10),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              buildCard_recommended(
                                model.topmention![index]['p_name'],
                                model.topmention![index]['p_img'],
                                model.topmention![index]['_id'],
                                model.topmention![index]['numReview'],
                                model.topmention![index]['p_desc'],

                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AllProductofbrand(p_brand: widget.p_brand)));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 28, right: 28),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 18,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 5, left: 9, top: 10, bottom: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Icon(
                              Icons.border_all_rounded,
                              color: c.blackMain,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Poppins(
                              text:
                              "All Product of " + widget.p_brand.toString(),
                              size: 17,
                              color: Colors.black,
                              fontWeight: f.semiBold),
                          Expanded(child: Container()),
                          Container(
                            color: Colors.white,
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: c.blackMain,
                            ),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: c.shadow.withOpacity(0.32),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard_Popular(String p_name, String p_img, String id,
      String p_desc, String p_brand, var rating, int numReview) =>
      Container(
        width: MediaQuery.of(context).size.width * 0.75,
        height: MediaQuery.of(context).size.height * 0.195,
        child: Stack(
          children: [
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ProductOverview(id: id )));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: MediaQuery.of(context).size.height * 0.195,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: c.shadow.withOpacity(0.32),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Center(
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    image: DecorationImage(
                                        image: NetworkImage(p_img),
                                        fit: BoxFit.contain)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12, right: 12),
                            child: Container(
                              width: 190,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  p_brand != ''?
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10,
                                          left: 10,
                                          top: 5,
                                          bottom: 5),
                                      child: Inter_Crop(
                                          text: p_brand,
                                          size: 13,
                                          color: c.textWhite,
                                          fontWeight: f.semiBold),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Color(0xFF86CA89),
                                        borderRadius:
                                        BorderRadius.circular(50)),
                                  ):Container(),
                                  SizedBox(
                                    height: 5,
                                  ),

                                  Container(
                                    height: 45,
                                    padding:
                                    const EdgeInsets.only(top: 5, left: 0, right: 2),
                                    width: MediaQuery.of(context).size.width * 0.414,
                                    child: Text(
                                      p_name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: f.semiBold,
                                          color: Color(0xFF053118)),
                                    ),
                                  ),
                                  SizedBox(height: 7),
                                  Inter_Crop(
                                      text: p_desc,
                                      size: 12,
                                      color: Color(0xFF9D9D9D),
                                      fontWeight: f.regular),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  numReview != 0 ?
                                  Row(
                                    children: [
                                      RatingBarIndicator(
                                        rating: rating,
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        itemCount: 5,
                                        itemSize: 23.0,
                                        direction: Axis.horizontal,
                                        unratedColor:
                                        Colors.amber.withOpacity(0.31),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2, left: 4),
                                        child: Roboto(
                                            text: rating.toString(),
                                            size: 14,
                                            color: Color(0xFFFFC107),
                                            fontWeight: f.semiBold),
                                      ),
                                    ],
                                  ):Padding(
                                    padding: const EdgeInsets.only(
                                        top: 2, left: 0),
                                    child: Roboto(
                                        text: "No review",
                                        size: 14,
                                        color: Color(0xFFFFC107),
                                        fontWeight: f.semiBold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildCard_recommended(
      String p_name, String p_img, String id, int review, String p_desc) =>
      Container(
        width: MediaQuery.of(context).size.width * 0.40,
        height: MediaQuery.of(context).size.height * 0.313,
        child: Stack(
          children: [
            Center(
              child: InkWell(
                onTap: () async {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ProductOverview(id: id )));
                  await storage.write(key: "p_id", value: id);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.40,
                  height: MediaQuery.of(context).size.height * 0.313,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: c.shadow.withOpacity(0.32),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.414,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(p_img),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Container(
                        height: 45,
                        padding:
                        const EdgeInsets.only(top: 5, left: 10, right: 2),
                        width: MediaQuery.of(context).size.width * 0.414,
                        child: Text(
                          p_name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: f.semiBold,
                              color: Color(0xFF254231)),
                        ),
                      ),
                      Container(
                        height: 45,
                        padding:
                        const EdgeInsets.only(top: 8, left: 10, right: 2),
                        width: MediaQuery.of(context).size.width * 0.414,
                        child: Text(
                          p_desc,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                              fontSize: 11.5,
                              fontWeight: f.regular,
                              color: Color(0xFF9D9D9D)),
                        ),
                      ),
                      review != 0?
                      Container(
                        color: Colors.transparent,
                        width: MediaQuery.of(context).size.width / 3.25,
                        height: MediaQuery.of(context).size.height / 34,
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 34,
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 5, right: 3),
                                child: Icon(
                                  Boxicons.bxs_star,
                                  size: 13,
                                  color: Colors.white,
                                ),
                              ),

                              Container(
                                // color: Colors.red,
                                height: 45,
                                padding: const EdgeInsets.only(top: 5.12),
                                width:
                                MediaQuery.of(context).size.width / 13.57,
                                child: Text(
                                  review.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.inter(
                                      fontSize: 11.5,
                                      color: Colors.white,
                                      fontWeight: f.semiBold),
                                ),
                              ),
                              Inter(
                                text: "reviewed",
                                color: Colors.white,
                                fontWeight: f.semiBold,
                                size: 11.5,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: c.greenMain,
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ):Container(
                        color: Colors.transparent,
                        width: MediaQuery.of(context).size.width / 3.25,
                        height: MediaQuery.of(context).size.height / 34,
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 34,
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 5, right: 3),
                                child: Icon(
                                  Boxicons.bxs_star,
                                  size: 13,
                                  color: Colors.white,
                                ),
                              ),


                              Inter(
                                text: "No reviewed",
                                color: Colors.white,
                                fontWeight: f.semiBold,
                                size: 11.5,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: c.greenMain,
                              borderRadius: BorderRadius.circular(50)),
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

  Column _buildBottomNavigationMenu(context) {
    return Column(
      children: [
        Container(
          width: 88,
          child: Divider(
            height: 0,
            color: c.greyMain,
            thickness: 4,
          ),
        ),
        SizedBox(height: 10),
        Container(
          child: ListTile(
            // shape: Border.,
            leading: Icon(Boxicons.bx_user_plus, size: 30),
            iconColor: c.blackMain,
            textColor: c.blackMain,
            title: Inter(
                text: "Follow",
                size: 15,
                color: Color(0xFF063218),
                fontWeight: f.semiBold),
            onTap: () {},
          ),
          decoration: BoxDecoration(
              color: c.textWhite,
              border: Border(
                bottom:
                BorderSide(width: 0.8, color: c.greyMain.withOpacity(0.5)),
              )),
        ),
        Container(
          child: ListTile(
            leading: Icon(
              Boxicons.bx_volume_mute,
            ),
            iconColor: c.blackMain,
            textColor: c.blackMain,
            title: Inter(
                text: "Mute",
                size: 16,
                color: Color(0xFF063218),
                fontWeight: f.semiBold),
            onTap: () {},
          ),
          decoration: BoxDecoration(
              color: c.textWhite,
              border: Border(
                bottom:
                BorderSide(width: 0.8, color: c.greyMain.withOpacity(0.5)),
              )),
        ),
        Container(
          child: ListTile(
            leading: Icon(Icons.block_rounded),
            iconColor: c.blackMain,
            textColor: c.blackMain,
            title: Inter(
                text: "Block",
                size: 16,
                color: Color(0xFF063218),
                fontWeight: f.semiBold),
            onTap: () {},
          ),
          decoration: BoxDecoration(
              color: c.textWhite,
              border: Border(
                bottom:
                BorderSide(width: 0.8, color: c.greyMain.withOpacity(0.5)),
              )),
        ),
        Container(
          child: ListTile(
            leading: Icon(Icons.outlined_flag_outlined),
            iconColor: c.blackMain,
            textColor: c.blackMain,
            title: Inter(
                text: "Report Post",
                size: 16,
                color: Color(0xFF063218),
                fontWeight: f.semiBold),
            onTap: () {
              // Future.delayed(Duration(microseconds: 0));
            },
          ),
          decoration: BoxDecoration(
            color: c.textWhite,
          ),
        ),
      ],
    );
  }
}
