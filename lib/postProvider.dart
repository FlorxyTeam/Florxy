import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostProvider extends ChangeNotifier {
  final httpClient = http.Client();

  String baseurl = "https://1cd4-124-120-3-60.ngrok.io";

  List<dynamic>? postData;
  List<dynamic>? productData;
  List<dynamic>? myPost;

  FlutterSecureStorage storage = FlutterSecureStorage();

  Future fetchData() async{
    String? token = await storage.read(key:"token");
    final Uri resAPIURL = Uri.parse(baseurl + "/home/getAllPost");
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization": "Bearer $token"},
    );
    final Map parsedData = await json.decode(response.body.toString());

    postData = parsedData["data"];
    // print(postData);
  }


  Future fetchMentionProduct() async{
    print('hereeeeeeee');
    String? token = await storage.read(key:"token");
    final Uri resAPIURL = Uri.parse(baseurl + "/home/createPost/mention/topMention");
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization":"Bearer $token"},
    );
    final Map parsedProduct = await json.decode(response.body.toString());

    productData = parsedProduct["product"];
    print(productData);
  }

  Future fetchMyPostAndReply() async{
    print("mfmfmafjnjadndgj");
    var username = await storage.read(key: 'username');
    String? token = await storage.read(key:"token");
    final Uri resAPIURL = Uri.parse(baseurl + "/profile/PostAndReply/"+username!);
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization":"Bearer $token"},
    );
    final Map parsedProduct = await json.decode(response.body.toString());

    myPost = parsedProduct["myPost"];
    print(myPost);
  }

  Future fetchAnotherPostAndReply() async{
    var username = await storage.read(key: 'anotherprofile');
    String? token = await storage.read(key:"token");
    final Uri resAPIURL = Uri.parse(baseurl + "/profile/PostAndReply/"+username!);
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization":"Bearer $token"},
    );
    final Map parsedProduct = await json.decode(response.body.toString());

    myPost = parsedProduct["myPost"];
    print(myPost);
  }


  String formater(String url) {
    print(baseurl + url);
    return baseurl + url;
  }
}
