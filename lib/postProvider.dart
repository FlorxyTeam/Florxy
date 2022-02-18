import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostProvider extends ChangeNotifier{
  final httpClient = http.Client();
  List<dynamic>? postData;

  Future fetchData() async{
    final Uri resAPIURL = Uri.parse("http://192.168.2.37:8080/home/getPost");
    http.Response response = await httpClient.get(resAPIURL);
    final Map parsedData = await json.decode(response.body.toString());
    postData = parsedData["data"];
    print(postData);
  }
}