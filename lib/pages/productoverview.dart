import 'package:Florxy/widgets/fontWeight.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:boxicons/boxicons.dart';


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
  Future<void> _refreshPage() async {
    // refreshKey.currentState?.show(atTop: false);

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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      onPressed: () => Navigator.of(context).pop()
                  ),
                  Container(

                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width/2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/img/pixi-glow.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    child: InkWell(
                      onTap: (){},
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
              SizedBox(
                height:MediaQuery.of(context).size.height/9,
              )
            ],
          ),
        ),

      )

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

}
