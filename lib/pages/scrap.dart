import 'package:Florxy/pages/searchpage.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

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

        print('product have'+value.length.toString());
        for (var result in value) {
          // print(result.link);
          Real x = await Scraper.getBrand(result.link);
          print(x.p_name);
          List ingList = [];
          for (var ing in x.p_ing[1]){
            // print(ing);
            List y = await Scraper.getIng(ing);


            Map<String, dynamic> data = {
              "name": y[0][0],
              "rate": y[0][1],
              "calling": y[0][2],
              "func": y[0][3],
              "irr": y[0][4],
              "come": y[0][5],
              "cosing": y[0][6],
              "quick": y[0][7],
              "detail": y[0][8],
              "proof": y[0][9],
              "link": ing
            };

            var response = await networkHandler.postO("/product/add/ing",data);
            Map<String, dynamic> output = json.decode(response.body);
            ingList.add(output['result']);

        }
          Map<String, dynamic> data = {
            "p_name": x.p_name,
            "p_brand": x.p_brand,
            "p_desc": x.p_desc,
            "p_img": x.p_img,
            "ing_id" : ingList,
          };
          // print ("data $data");
          var response = await networkHandler.postO("/product/add",data);
          // print(response);
        // Navigator.pop(context);
        }
        print("finish");

      });

      // print(results);
    });
    //

    // print(data);
    // var networkHandler;
    // print(x.p_ing[]);
  }

  Future<List> product() async{
    results = await Scraper.getData2('biore');
    Map<String, dynamic> data = {
      "name": 'Biore',
    };

    var response = await networkHandler.postO("/product/add/brand",data);
    print(response);
    return results;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Inter(size: 26,text: 'scraping.....',fontWeight: f.semiBold,color: c.greenMain,)),
    );
  }
}
