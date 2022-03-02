import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostProvider extends ChangeNotifier{
  final httpClient = http.Client();
  String baseurl = "https://4875-171-100-24-98.ngrok.io";

  List<dynamic>? postData;
  FlutterSecureStorage storage = FlutterSecureStorage();
  Future fetchData() async{
    String? token = await storage.read(key:"token");
    final Uri resAPIURL = Uri.parse("$baseurl"+"/home/getAllPost");
    http.Response response = await httpClient.get(
        resAPIURL,
        headers: {"Authorization":"Bearer $token"},
    );
    final Map parsedData = await json.decode(response.body.toString());

    postData = parsedData["data"];
    print(postData);
  }
  String formater(String url) {
    print(baseurl+url);
    return baseurl + url;
  }
}