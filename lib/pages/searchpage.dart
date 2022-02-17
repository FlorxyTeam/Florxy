import 'package:Florxy/Post/addPost.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/scrapper/incidecoder.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}
  List results = [];


class _SearchPageState extends State<SearchPage> {

  Future<void> product() async{
      results = await Scraper.getData('vitamin-c');
      print(results);
  }
  @override
  Widget build(BuildContext context) {
    product();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(onPressed:() {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddPost()));
          },child: Icon(Icons.create_outlined),),
          SizedBox(height: 20,),
          Poppins(text: results[25].name, size: 20, color: c.greenMain, fontWeight: f.medium),
        ],
      ),
    );
  }
}
