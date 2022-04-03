import 'package:Florxy/pages/productoverview.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:boxicons/boxicons.dart';
import 'package:Florxy/pages/comparepage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:Florxy/NetworkHandler.dart';

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

  @override
  void fetchData() async {
    print(widget.p_brand);
    await storage.write(key: "p_brand", value: widget.p_brand);
    await networkHandler.get("/product/brand/" + widget.p_brand!);
  }

  @override
  void initState() {
    fetchData();
    // TODO: implement initState
    Provider.of<PostProvider>(context, listen: false).fetchBrandOverview();
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
              Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back_ios_new_rounded),
                      color: c.blackMain,
                      iconSize: 30,
                      onPressed: () => Navigator.of(context).pop()),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Poppins(
                      text: widget.p_brand as String,
                      color: c.blackMain,
                      fontWeight: f.regular,
                      size: 25,
                    ),
                  ),
                ],
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
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/img/pixi.gif"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
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
                        height: MediaQuery.of(context).size.height * 0.13,
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
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 15, left: 18),
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
                                    image:
                                        AssetImage("assets/img/pixi-logo.gif"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                          onTap: () => showModalBottomSheet(
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (context) {
                                                return Container(
                                                  color: Colors.transparent,
                                                  height: 320,
                                                  child: Container(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 20,
                                                              left: 20,
                                                              right: 20),
                                                      child:
                                                          _buildBottomNavigationMenu(
                                                              context),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        color: Theme.of(context)
                                                            .canvasColor,
                                                        borderRadius: BorderRadius.only(
                                                            topLeft: const Radius
                                                                .circular(42),
                                                            topRight: const Radius
                                                                .circular(42))),
                                                  ),
                                                );
                                              }),
                                          child: Icon(
                                            Boxicons.bx_dots_vertical_rounded,
                                            color: Color(0xFF9D9D9D),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8, bottom: 5),
                                    child: Inter(
                                        text: "@" +
                                            (widget.p_brand).toString() +
                                            "brand",
                                        size: 13,
                                        color: Color(0xFF97AFA2),
                                        fontWeight: f.medium),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 7,
                                              left: 7,
                                              top: 4,
                                              bottom: 4),
                                          child: Inter(
                                              text: "Beauty Advisor",
                                              size: 11,
                                              color: Colors.white,
                                              fontWeight: f.semiBold),
                                        ),
                                        decoration: BoxDecoration(
                                            color: c.greenMain,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 5,
                                              left: 5,
                                              top: 2,
                                              bottom: 2),
                                          child: Inter(
                                              text: "Beauty Owner",
                                              size: 11,
                                              color: c.blueMain,
                                              fontWeight: f.bold),
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: c.blueMain,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
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
                      text: "Most Mention",
                      color: Color(0xFF254231),
                      fontWeight: f.semiBold,
                      size: 20,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.31,
                    width: MediaQuery.of(context).size.height,
                    // color: c.redMain,
                    child: Consumer<PostProvider>(
                      builder: (context, model, _) => FutureBuilder(
                        future: model.fetchBrandOverview(),
                        builder: (context, snapshot) => ListView.separated(
                          padding: EdgeInsets.only(left: 28, right: 2),
                          itemCount: model.topmention?.length ?? 0,
                          separatorBuilder: (context, _) => SizedBox(width: 10),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              buildCard_brand_Mention(
                                  model.topmention![index]['p_name'],
                                  model.topmention![index]['p_img'],
                                  model.topmention![index]['_id'],
                                  model.topmention![index]['mention']
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
                    padding:
                        const EdgeInsets.only(left: 28, top: 22, bottom: 6),
                    child: Poppins(
                      text: "Top Review Ranking",
                      color: Color(0xFF254231),
                      fontWeight: f.semiBold,
                      size: 20,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.31,
                    width: MediaQuery.of(context).size.height,
                    // color: c.redMain,
                    child: Consumer<PostProvider>(
                      builder: (context, model, _) => FutureBuilder(
                        future: model.fetchBrandOverview(),
                        builder: (context, snapshot) => ListView.separated(
                          padding: EdgeInsets.only(left: 28, right: 2),
                          itemCount: model.topreview?.length ?? 0,
                          separatorBuilder: (context, _) => SizedBox(width: 10),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              buildCard_brand_Topreview(
                                  model.topreview![index]['p_name'],
                                  model.topreview![index]['p_img'],
                                  model.topreview![index]['_id'],
                                  model.topreview![index]['review']
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
                    padding:
                        const EdgeInsets.only(left: 28, top: 22, bottom: 6),
                    child: Poppins(
                      text: "More Product",
                      color: Color(0xFF0254231),
                      fontWeight: f.semiBold,
                      size: 20,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.31,
                    width: MediaQuery.of(context).size.height,
                    // color: c.redMain,
                    child: Consumer<PostProvider>(
                      builder: (context, model, _) => FutureBuilder(
                        future: model.fetchBrandOverview(),
                        builder: (context, snapshot) => ListView.separated(
                          padding: EdgeInsets.only(left: 28, right: 2),
                          itemCount: model.brandOverview?.length ?? 0,
                          separatorBuilder: (context, _) => SizedBox(width: 10),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              buildCard_brand_MoreProduct(
                                  model.brandOverview![index]['p_name'],
                                  model.brandOverview![index]['p_img'],
                                  model.brandOverview![index]['_id'],

                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard_brand_MoreProduct(String p_name, String p_img, String id) =>
      Container(
        width: MediaQuery.of(context).size.width * 0.31,
        height: MediaQuery.of(context).size.height * 0.27,
        child: Stack(
          children: [
            Center(
              child: InkWell(
                onTap: () async{

                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => comparepage(id: id, currentState: 0,)));
                  await storage.write(key: "p_id", value: id);

                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.31,
                  height: MediaQuery.of(context).size.height * 0.27,
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
                        width: MediaQuery.of(context).size.width * 0.34,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            image: DecorationImage(
                                image: NetworkImage(p_img),
                                fit: BoxFit.contain)),
                      ),
                      Container(
                        height: 45,
                        padding: const EdgeInsets.only(top: 5, left: 7),
                        width: MediaQuery.of(context).size.width * 0.34,
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
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 7, top: 3),
                            child: Inter(
                                text: "9",
                                size: 11,
                                color: c.blackMain,
                                fontWeight: f.semiBold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Icon(
                              Icons.star,
                              size: 13,
                              color: c.blackMain,
                            ),
                          ),
                        ],
                      ),
                      Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 7, top: 3),
                          child: Inter(
                              text: "10",
                              size: 11,
                              color: c.blackMain,
                              fontWeight: f.semiBold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Inter(
                              text: " mention",
                              size: 11,
                              color: c.blackMain,
                              fontWeight: f.medium),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildCard_brand_Mention(String p_name, String p_img, String id, int mention) =>
      Container(
        width: MediaQuery.of(context).size.width * 0.31,
        height: MediaQuery.of(context).size.height * 0.27,
        child: Stack(
          children: [
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => comparepage(id: id, currentState: 0)));

                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.31,
                  height: MediaQuery.of(context).size.height * 0.27,
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
                        width: MediaQuery.of(context).size.width * 0.34,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          image: DecorationImage(
                            image:NetworkImage(p_img),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Container(
                        height: 45,
                        padding: const EdgeInsets.only(top: 5, left: 7),
                        width: MediaQuery.of(context).size.width * 0.34,
                        child: Text(
                          p_name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: f.semiBold,
                              color: Color(0xFF0254231)),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 7, top: 3),
                            child: Inter(
                                text: "0",
                                size: 11,
                                color: c.blackMain,
                                fontWeight: f.semiBold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Icon(
                              Icons.star,
                              size: 13,
                              color: c.blackMain,
                            ),
                          ),
                        ],
                      ),
                      Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 7, top: 3),
                          child: Inter(
                              text: mention.toString(),
                              size: 11,
                              color: c.blackMain,
                              fontWeight: f.semiBold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Inter(
                              text: " mentions",
                              size: 11,
                              color: c.blackMain,
                              fontWeight: f.medium),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildCard_brand_Topreview(String p_name, String p_img, String id, int review)
  => Container(
        width: MediaQuery.of(context).size.width * 0.31,
        height: MediaQuery.of(context).size.height * 0.27,
        child: Stack(
          children: [
            Center(
              child: InkWell(
                onTap: () async {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => comparepage(id: id, currentState: 0,)));
                  await storage.write(key: "p_id", value: id);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.31,
                  height: MediaQuery.of(context).size.height * 0.27,
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
                        width: MediaQuery.of(context).size.width * 0.34,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          image: DecorationImage(
                            image:NetworkImage(p_img),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Container(
                        height: 45,
                        padding: const EdgeInsets.only(top: 5, left: 7),
                        width: MediaQuery.of(context).size.width * 0.34,
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
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 7, top: 3),
                            child: Inter(
                                text: "0",
                                size: 11,
                                color: c.blackMain,
                                fontWeight: f.semiBold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Icon(
                              Icons.star,
                              size: 13,
                              color: c.blackMain,
                            ),
                          ),
                        ],
                      ),
                      Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 7, top: 3),
                          child: Inter(
                              text: review.toString(),
                              size: 11,
                              color: c.blackMain,
                              fontWeight: f.semiBold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Inter(
                              text: " reviews",
                              size: 11,
                              color: c.blackMain,
                              fontWeight: f.medium),
                        ),
                      ]),
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
