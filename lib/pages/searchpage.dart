import 'package:Florxy/Post/addPost.dart';
import 'package:Florxy/provider/storage_service.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/scrapper/incidecoder.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

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
              final fileName = 'bacon.jpg';

              print(path);
              print(fileName);

              storage.uploadProfile(path, fileName).then((value) => print(value));

          },child: Icon(Icons.create_outlined),),
          SizedBox(height: 20,),
          FutureBuilder(
              future: storage.listFiles(),
              builder: (BuildContext context, AsyncSnapshot<firebase_storage.ListResult> snapshot){
                if (snapshot.connectionState == ConnectionState.done){
                  return Container(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.items.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ElevatedButton(onPressed: (){}, child: Text(snapshot.data!.items[index].name),);
                        }),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData){
                  return CircularProgressIndicator();
                }
                return Container();
              } ),
          FutureBuilder(
              future: storage.downloadURL('bacon.jpg'),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot){
                if (snapshot.connectionState == ConnectionState.done && snapshot.hasData){
                  return Container(
                    width: 300,
                    height: 250,
                    child: Image.network(snapshot.data!, fit:BoxFit.cover),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData){
                  return CircularProgressIndicator();
                }
                return Container();
              } )

          // Poppins(text: results[25].name, size: 20, color: c.greenMain, fontWeight: f.medium),
        ],
      ),
    );
  }
}
