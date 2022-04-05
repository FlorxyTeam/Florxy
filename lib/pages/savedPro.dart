import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';

import '../scrapper/incidecoder.dart';

class SavedPro extends StatefulWidget {
  const SavedPro({Key? key}) : super(key: key);

  @override
  _SavedProState createState() => _SavedProState();
}

class _SavedProState extends State<SavedPro> {
  List results = [];

  void initState() {
    super.initState();

    // product();
    // WidgetsBinding.instance?.addPostFrameCallback((_) {
    //   // print("WidgetsBinding");
    //   product().then((value) async {
    //     // print(value);
    //     for (var result in value) {
    //       // print(result.link);
    //       Real x = await Scraper.getBrand(result.link);
    //
    //       Map<String, dynamic> data = {
    //         "p_name": x.p_name,
    //         "p_brand": x.p_brand,
    //         "p_desc": x.p_desc,
    //         "p_img": x.p_img,
    //         "ing_name" : x.p_ing[0],
    //         "ing_met" : x.p_ing[1],
    //         "ing_irr" : x.p_ing[2],
    //         "ing_rate" : x.p_ing[3]
    //       };
    //       print (data);
    //       var response = await networkHandler.postO("/product/add",data);
    //       print(response);
    //
    //     }
    //   });
    //
    //   // print(results);
    // });

    //
    //   print(data);
    //   // var networkHandler;
    //   // print(x.p_ing[]);
    // }
    //
    //
    //
    //
    //
    // var response = await networkHandler.get("/");
    //
    // print(response);

  }
    Future<List> product() async{
    results = await Scraper.getData2('innisfree');
    return results;
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Poppins(
          text: "Saved Product",
          size: 20,
          color: c.greenMain,
          fontWeight: f.medium),
    );
  }
}
