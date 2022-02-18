import 'package:Florxy/Post/addPost.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(onPressed:() {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddPost()));
          },child: Icon(Icons.create_outlined),),
          SizedBox(height: 20,),
          Poppins(text: "Search Page", size: 20, color: c.greenMain, fontWeight: f.medium),
        ],
      ),
    );
  }
}
