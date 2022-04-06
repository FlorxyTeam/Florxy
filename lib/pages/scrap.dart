import 'package:Florxy/pages/searchpage.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/material.dart';

import '../NetworkHandler.dart';
import '../scrapper/incidecoder.dart';

class Scrap extends StatefulWidget {
  const Scrap({Key? key}) : super(key: key);

  @override
  _ScrapState createState() => _ScrapState();
}

class _ScrapState extends State<Scrap> {
  List results = [];
  NetworkHandler networkHandler = NetworkHandler();

  void initState() {
    super.initState();

    // product();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      print("WidgetsBinding");
      product().then((value) async {
        // print(value);
        for (var result in value) {
          // print(result.link);
          Real x = await Scraper.getBrand(result.link);

          Map<String, dynamic> data = {
            "p_name": x.p_name,
            "p_brand": x.p_brand,
            "p_desc": x.p_desc,
            "p_img": x.p_img,
            "ing_name" : x.p_ing[0],
            "ing_met" : x.p_ing[1],
            "ing_irr" : x.p_ing[2],
            "ing_rate" : x.p_ing[3]
          };
          print ("data $data");
          var response = await networkHandler.postO("/product/add",data);
          print(response);

        }
        print("finish");
        // Navigator.pop(context);
      });

      // print(results);
    });
    //

    // print(data);
    // var networkHandler;
    // print(x.p_ing[]);
  }

  Future<List> product() async{
    results = await Scraper.getData2('anua');
    return results;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Inter(size: 26,text: 'scraping.....',fontWeight: f.semiBold,color: c.greenMain,)),
    );
  }
}
