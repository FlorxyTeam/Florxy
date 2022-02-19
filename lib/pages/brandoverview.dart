import 'package:flutter/material.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:boxicons/boxicons.dart';


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

class Brandoverview extends StatefulWidget {
  const Brandoverview({Key? key}) : super(key: key);

  @override
  _BrandoverviewState createState() => _BrandoverviewState();
}

class _BrandoverviewState extends State<Brandoverview> {

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
      title: "Makeupuuussssssssss",
    ),
    BrandsItem(
      urlImage: "assets/img/laroache_logo.jpg",
      title: "Skincare ",
    ),
    BrandsItem(
      urlImage: "assets/img/bioderma_logo.png",
      title: "Make up",
    ),
    BrandsItem(
      urlImage: "assets/img/laroache_logo.jpg",
      title: "Skincare",
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 28, top: 30,),
                child: Poppins(
                  text: "Brand Overview",
                  color: c.blackMain,
                  fontWeight: f.semiBold,
                  size: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28, bottom: 16),
                child: Poppins(
                  text: "Pixi",
                  color: c.blackMain,
                  fontWeight: f.regular,
                  size: 25,
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 28,left: 28),
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
                height: MediaQuery.of(context).size.height* 0.25,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "assets/img/pixi.gif"),
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
                          left: 28, right: 28, bottom: 27),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.14,
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
                                const EdgeInsets.only(left: 22, right: 22),
                                child: Container(
                                  height: 68,
                                  width: 68,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(34),
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0xFF986A4E),//                   <--- border width here
                                    ),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height/45,
                                    ),
                                    Container(
                                      height: MediaQuery.of(context).size.height/35,
                                      child: Poppins(
                                          text: "Pixi Official",
                                          size: 15,
                                          color: Color(0xFF053118),
                                          fontWeight: f.semiBold),
                                    ),
                                    Inter(
                                        text:
                                        "@pixibrand",
                                        size: 13,
                                        color: Color(0xFF053118)
                                            .withOpacity(0.51),
                                        fontWeight: f.medium),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 7, left: 7, top: 4, bottom: 4),
                                            child: Inter(
                                                text: "Beauty Advisor",
                                                size: 9,
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
                                                right: 5, left: 5, top: 2, bottom: 2),
                                            child: Inter(
                                                text: "Beauty Owner",
                                                size: 9,
                                                color: c.blueMain,
                                                fontWeight: f.bold),
                                          ),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: c.blueMain,
                                                width: 2,
                                              ),
                                              borderRadius: BorderRadius.circular(10)),
                                        ),

                                      ],

                                    ),


                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 7),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Boxicons.bx_dots_vertical_rounded),
                                      color:Color(0xFF9D9D9D),
                                    ),
                                  ),

                                ],
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
                    padding: const EdgeInsets.only(left: 28, top: 30, bottom: 8),
                    child: Poppins(
                      text: "Most Mention",
                      color: Color(0xFF254231),
                      fontWeight: f.semiBold,
                      size: 20,
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
