import 'package:flutter/material.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:boxicons/boxicons.dart';

class MostMention {
  final String urlImage;
  final String title;
  final String rating;
  final String numMention;

  const MostMention({
    required this.urlImage,
    required this.title,
    required this.rating,
    required this.numMention,
  });
}

class TopReview {
  final String urlImage;
  final String title;
  final String rating;
  final String numMention;
  final String type;

  const TopReview({
    required this.urlImage,
    required this.title,
    required this.rating,
    required this.numMention,
    required this.type,
  });
}

class MoreProduct{
  final String urlImage;
  final String title;
  final String rating;
  final String numMention;
  final String type;

  const MoreProduct({
    required this.urlImage,
    required this.title,
    required this.rating,
    required this.numMention,
    required this.type,
  });
}


class Brandoverview extends StatefulWidget {
  const Brandoverview({Key? key}) : super(key: key);

  @override
  _BrandoverviewState createState() => _BrandoverviewState();
}

class _BrandoverviewState extends State<Brandoverview> {
  List<MostMention> MostMenitems = [
    MostMention(
      urlImage: "assets/img/pixi.jpg",
      title: "Pixi Glow Tonic ",
      rating: "4.8",
      numMention: "5,230"
    ),
    MostMention(
        urlImage: "assets/img/Pixi+Caroline.jpg",
        title: "Pixi + Caroline Hirons Double ",
        rating: "5.8",
        numMention: "5,230"
    ),
    MostMention(
        urlImage: "assets/img/Phenomenalgel.jpg",
        title: "Phenomenal Gel ",
        rating: "1.8",
        numMention: "5,230"
    ),
    MostMention(
        urlImage: "assets/img/pixi.jpg",
        title: "Pixi Glow Tonic  ",
        rating: "8.8",
        numMention: "5,230"
    ),
    MostMention(
        urlImage: "assets/img/Pixi+Caroline.jpg",
        title: "Pixi + Caroline Hirons Double ",
        rating: "9.8",
        numMention: "5,230"
    ),
    MostMention(
        urlImage: "assets/img/Phenomenalgel.jpg",
        title: "Phenomenal Gel ",
        rating: "10.0",
        numMention: "5,230"
    ),

  ];

  List<TopReview> Topitems = [
    TopReview(
        urlImage: "assets/img/Phenomenalgel.jpg",
        title: "Phenomenal Gel ",
        rating: "10.0",
        numMention: "5,230",
        type: "review"
    ),
    TopReview(
        urlImage: "assets/img/Pixi+Caroline.jpg",
        title: "Pixi + Caroline Hirons Double ",
        rating: "10.0",
        numMention: "5,230",
        type: "review"
    ),
    TopReview(
        urlImage: "assets/img/pixi.jpg",
        title: "Pixi Glow Tonic",
        rating: "10.0",
        numMention: "5,230",
        type: "mention"
    ),
    TopReview(
        urlImage: "assets/img/Phenomenalgel.jpg",
        title: "Phenomenal Gel",
        rating: "10.0",
        numMention: "",
        type: ""
    ),
    TopReview(
        urlImage: "assets/img/Pixi+Caroline.jpg",
        title: "Pixi + Caroline Hirons Double kkkk",
        rating: "10.0",
        numMention: "5,230",
        type: "mention"
    ),
    TopReview(
        urlImage: "assets/img/pixi.jpg",
        title: "Pixi Glow Tonic",
        rating: "10.0",
        numMention: "5,230",
        type: "review"
    ),
  ];

  List<MoreProduct> Product = [
    MoreProduct(
        urlImage: "assets/img/pixi.jpg",
        title: "Pixi Glow Tonic ",
        rating: "10.0",
        numMention: "",
        type: ""
    ),
    MoreProduct(
        urlImage: "assets/img/Pixi+Caroline.jpg",
        title: "Pixi + Caroline Hirons Double kkkk ",
        rating: "10.0",
        numMention: "5,230",
        type: "mention"
    ),
    MoreProduct(
        urlImage: "assets/img/Phenomenalgel.jpg",
        title: "Phenomenal Gel",
        rating: "10.0",
        numMention: "5,230",
        type: "review"
    ),
    MoreProduct(
        urlImage: "assets/img/pixi.jpg",
        title: "Pixi Glow Tonic ",
        rating: "10.0",
        numMention: "5,230",
        type: "mention"
    ),
    MoreProduct(
        urlImage: "assets/img/Pixi+Caroline.jpg",
        title: "Pixi + Caroline Hirons Double kkkk ",
        rating: "10.0",
        numMention: "5,230",
        type: "mention"
    ),
    MoreProduct(
        urlImage: "assets/img/Phenomenalgel.jpg",
        title: "Phenomenal Gel",
        rating: "10.0",
        numMention: "5,230",
        type: "mention"
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
                padding: const EdgeInsets.only(
                  left: 28,
                  top: 30,
                ),
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
                      child: InkWell(
                        onTap: () {
                        },
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
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "Pixi Official",
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
                                            child: Icon(Boxicons
                                                .bx_dots_vertical_rounded,
                                              color:Color(
                                                  0xFF9D9D9D),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8, bottom: 5),
                                      child: Inter(
                                          text: "@pixibrand",
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
                                                size:11,
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
                      color:  Color(0xFF254231),
                      fontWeight: f.semiBold,
                      size: 20,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.31,
                    width: MediaQuery.of(context).size.height,
                    // color: c.redMain,
                    child: ListView.separated(
                      padding: EdgeInsets.only(left: 28, right: 2),
                      itemCount: 6,
                      separatorBuilder: (context, _) => SizedBox(width: 10),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          buildCard_brand_Mention(mention: MostMenitems[index]),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height:5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 28, top: 22, bottom: 6),
                    child: Poppins(
                      text: "Top Review Ranking",
                      color:  Color(0xFF254231),
                      fontWeight: f.semiBold,
                      size: 20,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.31,
                    width: MediaQuery.of(context).size.height,
                    // color: c.redMain,
                    child: ListView.separated(
                      padding: EdgeInsets.only(left: 28, right: 2),
                      itemCount: 6,
                      separatorBuilder: (context, _) => SizedBox(width: 10),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          buildCard_brand_Topreview(review: Topitems[index]),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height:5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 28, top: 22, bottom: 6),
                    child: Poppins(
                      text: "More Product",
                      color:  Color(0xFF0254231),
                      fontWeight: f.semiBold,
                      size: 20,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.31,
                    width: MediaQuery.of(context).size.height,
                    // color: c.redMain,
                    child: ListView.separated(
                      padding: EdgeInsets.only(left: 28, right: 2),
                      itemCount: 6,
                      separatorBuilder: (context, _) => SizedBox(width: 10),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          buildCard_brand_MoreProduct(product: Product[index]),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height:MediaQuery.of(context).size.height/30,
              )
            ],
          ),
        ),
      ),
    );
  }


  Widget buildCard_brand_Mention({
    required MostMention mention,
  }) =>
      Container(
        width: MediaQuery.of(context).size.width * 0.31,
        height: MediaQuery.of(context).size.height * 0.27,
        child: Stack(
          children: [
            Center(
              child: InkWell(
                onTap: () {},
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
                            image: AssetImage(mention.urlImage),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        height: 45,
                        padding: const EdgeInsets.only(top: 5, left: 7),
                        width: MediaQuery.of(context).size.width * 0.34,
                        child: Text(
                          mention.title,
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
                            child: Inter(text: mention.rating, size: 11, color: c.blackMain, fontWeight: f.semiBold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Icon(Icons.star,size: 13,color: c.blackMain,),
                          ),
                        ],
                      ),
                      Row(
                        children :[
                        Padding(
                          padding: const EdgeInsets.only(left: 7, top: 3),
                          child: Inter(text: mention.numMention, size: 11, color: c.blackMain, fontWeight: f.semiBold),
                        ),
                          Padding(
                            padding: const EdgeInsets.only( top: 3),
                            child: Inter(text: "mentions", size: 11, color: c.blackMain, fontWeight: f.medium),
                          ),
                        ]
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildCard_brand_Topreview({
    required TopReview review,
  }) =>
      Container(
        width: MediaQuery.of(context).size.width * 0.31,
        height: MediaQuery.of(context).size.height * 0.27,
        child: Stack(
          children: [
            Center(
              child: InkWell(
                onTap: () {},
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
                            image: AssetImage(review.urlImage),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        height: 45,
                        padding: const EdgeInsets.only(top: 5, left: 7),
                        width: MediaQuery.of(context).size.width * 0.34,
                        child: Text(
                          review.title,
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
                            child: Inter(text: review.rating, size: 11, color: c.blackMain, fontWeight: f.semiBold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Icon(Icons.star,size: 13,color: c.blackMain,),
                          ),
                        ],
                      ),
                      Row(
                          children :[
                            Padding(
                              padding: const EdgeInsets.only(left: 7, top: 3),
                              child: Inter(text: review.numMention, size: 11, color: c.blackMain, fontWeight: f.semiBold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only( top: 3),
                              child: Inter(text: review.type, size: 11, color: c.blackMain, fontWeight: f.medium),
                            ),
                          ]
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildCard_brand_MoreProduct({
    required MoreProduct product,
  }) =>
      Container(
        width: MediaQuery.of(context).size.width * 0.31,
        height: MediaQuery.of(context).size.height * 0.27,
        child: Stack(
          children: [
            Center(
              child: InkWell(
                onTap: () {},
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
                            image: AssetImage(product.urlImage),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        height: 45,
                        padding: const EdgeInsets.only(top: 5, left: 7),
                        width: MediaQuery.of(context).size.width * 0.34,
                        child: Text(
                          product.title,
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
                            child: Inter(text: product.rating, size: 11, color: c.blackMain, fontWeight: f.semiBold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Icon(Icons.star,size: 13,color: c.blackMain,),
                          ),
                        ],
                      ),
                      Row(
                          children :[
                            Padding(
                              padding: const EdgeInsets.only(left: 7, top: 3),
                              child: Inter(text: product.numMention, size: 11, color: c.blackMain, fontWeight: f.semiBold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only( top: 3),
                              child: Inter(text: product.type, size: 11, color: c.blackMain, fontWeight: f.medium),
                            ),
                          ]
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

