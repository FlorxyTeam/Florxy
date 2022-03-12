import 'dart:ffi';

import 'package:Florxy/Post/addPost.dart';
import 'package:Florxy/provider/storage_service.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/scrapper/incidecoder.dart';

import '../NetworkHandler.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}
  List results = [];
  NetworkHandler networkHandler = NetworkHandler();



class _SearchPageState extends State<SearchPage> {
  List results = [];
  final Storage storage = Storage();

  @override
  initState() {
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
    // product();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed:() async {
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddPost()));
              final results = await FilePicker.platform.pickFiles(
                allowMultiple: false,
                type: FileType.custom,
                allowedExtensions: ['png','jpg']
              );
              if (results == null){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No File')));
                return null;
              }
              final path = results.files.single.path!;
              final fileName = results.files.single.name;

              print(path);
              print(fileName);

              storage.uploadFile(path, fileName).then((value) => print('Done'));

          },child: Icon(Icons.create_outlined),),
          SizedBox(height: 20,),
          // Poppins(text: results[25].name, size: 20, color: c.greenMain, fontWeight: f.medium),
        ],
      ),
    );
  }
}
