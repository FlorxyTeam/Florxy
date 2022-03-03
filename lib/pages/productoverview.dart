import 'package:Florxy/widgets/fontWeight.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:boxicons/boxicons.dart';
import 'package:google_fonts/google_fonts.dart';


class CardItem {
  final String urlImage;
  final String title;

  const CardItem({
    required this.urlImage,
    required this.title,
  });
}


class ProductOverview extends StatefulWidget {
  const ProductOverview({Key? key}) : super(key: key);

  @override
  _ProductOverviewState createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {

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



  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 5),
                    child: Container(
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.arrow_back_ios_new_rounded,
                          color:c.blackMain,
                          size: 27,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.29,
                      width: MediaQuery.of(context).size.width/2,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/img/pixi-glow.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20,right: 5),
                    child: Container(
                      child: InkWell(
                        onTap: (){

                        },
                        child: Icon(Boxicons
                            .bx_dots_vertical_rounded,
                          color:c.blackMain,
                          size: 27,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  // height: MediaQuery.of(context).size.height/2.97,
                  width:  MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 25,right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  color: Color(0xFFB3E697),
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                            Row(
                              children: [
                                Icon(

                                  Icons.remove_red_eye_outlined,
                                  color:Color(0xFF97AFA2),
                                  size: 16.0,
                                ),
                                SizedBox(width: 2,),
                                Roboto(
                                    text: "2500 Views this product",

                                    size: 11,
                                    color: Color(0xFF97AFA2),
                                    fontWeight: f.medium),
                              ],
                            ),
                            InkWell(
                              onTap: (){

                              },
                              child: Icon(Icons.bookmark_rounded,
                                color:Color(0xFF32A060),
                                size: 27,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 11, left: 25, right:8),
                        child: Text("Glow Tonic Facial Toner ",textAlign: TextAlign.left, style: GoogleFonts.poppins(
                            color: Color(0xFF053118), fontWeight: f.semiBold,fontSize: 19
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 8,top: 5),
                        child: Inter(
                            text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been   the industry's standard dummy text ever since the 1500s.",

                            size: 14,
                            color: Color(0xFF053118).withOpacity(0.68),
                            fontWeight: f.regular),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 5),
                        child: Row(
                          children: [
                            Icon(

                              Icons.star_rounded,
                              color:Color(0xFFFFC107),
                              size: 30.0,
                            ),
                            Icon(

                              Icons.star_rounded,
                              color:Color(0xFFFFC107),
                              size: 30.0,
                            ),
                            Icon(

                              Icons.star_rounded,
                              color:Color(0xFFFFC107),
                              size: 30.0,
                            ),
                            Icon(

                              Icons.star_rounded,
                              color:Color(0xFFFFC107),
                              size: 30.0,
                            ),
                            Icon(

                              Icons.star_half_rounded,
                              color:Color(0xFFFFC107),
                              size: 30.0,
                            ),
                            SizedBox(width: 5,),
                            Inter(
                                text: "4.8",

                                size: 15,
                                color:Color(0xFFFFC107),
                                fontWeight: f.bold),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 10, bottom: 15,right: 25),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.of(context).pop();
                              },
                              child: Roboto(
                                  text: "Find relevent product",

                                  size: 15,
                                  color: Color(0xFF32A060),
                                  fontWeight: f.medium),
                            ),
                            SizedBox( width: 3,),
                            Icon(Icons.arrow_forward_rounded,
                              color: Color(0xFF32A060),
                              size: 14,
                            ),

                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20,left: 29, right: 20),
                // height: MediaQuery.of(context).size.height/2.97,
                width:  MediaQuery.of(context).size.width/1.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
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

                    Padding(
                      padding: const EdgeInsets.only(left: 25, top: 17),
                      child: Row(

                        children: [
                          Icon(Boxicons.bxs_detail,
                            color: Color(0xFF32A060),
                            size: 25,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Inter(
                              text: "Key Ingredient",
                              size: 20,
                              color: Color(0xFF053118),
                              fontWeight: f.semiBold),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 25, top: 17, bottom: 7),
                      child: RichText(
                        text: TextSpan(

                          children: <TextSpan>[
                            TextSpan(
                              text: "Antioxidant : ",
                              style: GoogleFonts.roboto(
                                  color: Color(0xFF053118).withOpacity(0.68), fontWeight: f.medium,fontSize: 15
                              ),
                            ),
                            TextSpan(
                              text: "Panax Ginseng Root Extract\n",
                              style: GoogleFonts.roboto(
                                  color: Color(0xFF9D9D9D), fontWeight: f.regular,fontSize: 15
                              ),
                            ),
                            TextSpan(
                              text: "Exfoliant : ",
                              style: GoogleFonts.roboto(
                                  color: Color(0xFF053118).withOpacity(0.68), fontWeight: f.medium,fontSize: 15
                              ),
                            ),
                            TextSpan(
                              text: "Glycolic Acid\n",
                              style: GoogleFonts.roboto(
                                  color: Color(0xFF9D9D9D), fontWeight: f.regular,fontSize: 15
                              ),
                            ),
                            TextSpan(
                              text: "Skin-identical ingredient : ",
                              style: GoogleFonts.roboto(
                                  color: Color(0xFF053118).withOpacity(0.68), fontWeight: f.medium,fontSize: 15
                              ),
                            ),
                            TextSpan(
                              text: "Glycerin, Urea, Alanine, Aspartic Acid\n",
                              style: GoogleFonts.roboto(
                                  color: Color(0xFF9D9D9D), fontWeight: f.regular,fontSize: 15
                              ),
                            ),
                            TextSpan(
                              text: "Soothing : ",
                              style: GoogleFonts.roboto(
                                  color: Color(0xFF053118).withOpacity(0.68), fontWeight: f.medium,fontSize: 15
                              ),
                            ),
                            TextSpan(
                              text: "Aloe Barbadensis Leaf Juice, Hamamelis Virginiana (Witch Hazel) Leaf Extract, Aesculus Hippocastanum (Horse Chestnut) Seed Extract, Sucrose\n",
                              style: GoogleFonts.roboto(
                                  color: Color(0xFF9D9D9D), fontWeight: f.regular,fontSize: 15
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25,  bottom: 15),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: Roboto(
                                text: "See all ingredients",

                                size: 15,
                                color: Color(0xFF32A060),
                                fontWeight: f.medium),
                          ),
                          SizedBox( width: 3,),
                          Icon(Icons.arrow_forward_rounded,
                            color: Color(0xFF32A060),
                            size: 14,
                          ),

                        ],
                      ),
                    ),




                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
                child: Poppins(text: "Interesting Review", size: 22,  color: Color(0xFF053118), fontWeight: f.semiBold),
              ),




              // Padding(
              //   padding:
              //   const EdgeInsets.only(left: 28, top: 22, bottom: 6),
              //   child: Poppins(
              //     text: "Search By Category",
              //     color: c.blackMain,
              //     fontWeight: f.semiBold,
              //     size: 18,
              //   ),
              // ),
              // Container(
              //   height: MediaQuery.of(context).size.height * 0.2,
              //   child: ListView.separated(
              //     padding: EdgeInsets.only(left: 28, right: 2),
              //     itemCount: 5,
              //     separatorBuilder: (context, _) => SizedBox(width: 10),
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (context, index) =>
              //         buildCard(item: items[index]),
              //   ),
              // ),
              SizedBox(
                height:MediaQuery.of(context).size.height/5,
              )
            ],
          ),
        ),

      )

    );
  }









  //Search by category
  // Widget buildCard({
  //   required CardItem item,
  // }) =>
  //     Container(
  //       width: MediaQuery.of(context).size.width * 0.28,
  //       height: MediaQuery.of(context).size.height * 0.17,
  //       child: Stack(
  //         children: [
  //           Center(
  //             child: InkWell(
  //               onTap: () {},
  //               child: Container(
  //                 width: MediaQuery.of(context).size.width * 0.28,
  //                 height: MediaQuery.of(context).size.height * 0.17,
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(15),
  //                   color: Colors.white,
  //                   boxShadow: [
  //                     BoxShadow(
  //                       color: c.shadow.withOpacity(0.32),
  //                       spreadRadius: -17,
  //                       blurRadius: 30,
  //                       offset: Offset(0, 6), // changes position of shadow
  //                     ),
  //                   ],
  //                 ),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Container(
  //                       height: MediaQuery.of(context).size.height * 0.115,
  //                       width: MediaQuery.of(context).size.width * 0.34,
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.only(
  //                           topLeft: Radius.circular(15),
  //                           topRight: Radius.circular(15),
  //                         ),
  //                         image: DecorationImage(
  //                           image: AssetImage(item.urlImage),
  //                           fit: BoxFit.cover,
  //                         ),
  //                       ),
  //                     ),
  //                     Padding(
  //                       padding: const EdgeInsets.only(top: 5, left: 7),
  //                       child: Poppins(
  //                           text: item.title,
  //                           size: 14,
  //                           color: Color(0xFF254231),
  //                           fontWeight: f.semiBold),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     );

  //Search by Brand

}