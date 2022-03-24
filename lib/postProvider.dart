import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostProvider extends ChangeNotifier {
  final httpClient = http.Client();

  String baseurl = "http://192.168.1.120:8080";

  List<dynamic>? postData;
  List<dynamic>? productData;
  List<dynamic>? myPost;
  List<dynamic>? anotherPost;
  List<dynamic>? favPost;
  List<dynamic>? comment;
  List<dynamic>? profile;



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
    // print(productData);
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
    // print(myPost);
  }

  Future fetchAnotherPostAndReply(String username) async{
    // var username = await storage.read(key: 'anotherUsername');
    String? token = await storage.read(key:"token");
    final Uri resAPIURL = Uri.parse(baseurl + "/profile/otherPostAndReply/"+username);
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization":"Bearer $token"},
    );
    final Map parsedProduct = await json.decode(response.body.toString());

    anotherPost = parsedProduct["anotherPost"];
    profile = parsedProduct["anotherProfile"];
  }

  Future fetchFavPost() async{
    var id = await storage.read(key: 'idFavPost');
    String? token = await storage.read(key:"token");
    final Uri resAPIURL = Uri.parse(baseurl + "/profile/getFavPost/"+id!);
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization":"Bearer $token"},
    );
    final Map parsedProduct = await json.decode(response.body.toString());

    favPost = parsedProduct["favPost"];
    print("favPost");
    print(favPost);
  }

  Future fetchComment(String idPost) async{
    // var id = await storage.read(key: 'idPost');
    // print(id);
    String? token = await storage.read(key:"token");
    final Uri resAPIURL = Uri.parse(baseurl + "/home/getComment/"+idPost);
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization":"Bearer $token"},
    );
    final Map parsedProduct = await json.decode(response.body.toString());

    comment = parsedProduct["comment"];
    // print('comment');
    // print(comment);
  }


  String formater(String url) {
    print(baseurl + url);
    return baseurl + url;
  }
}
