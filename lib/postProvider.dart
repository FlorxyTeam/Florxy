import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostProvider extends ChangeNotifier {
  final httpClient = http.Client();

  String baseurl = "http://192.168.101.79:8080";

  List<dynamic>? postData;
  List<dynamic>? productData;
  List<dynamic>? myPost;
  List<dynamic>? favPost;
  List<dynamic>? listOfbrand;
  List<dynamic>? brandOverview;
  List<dynamic>? productOverview;

  FlutterSecureStorage storage = FlutterSecureStorage();

  Future fetchData() async {
    String? token = await storage.read(key: "token");
    final Uri resAPIURL = Uri.parse(baseurl + "/home/getAllPost");
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization": "Bearer $token"},
    );
    final Map parsedData = await json.decode(response.body.toString());

    postData = parsedData["data"];
    // print(postData);
  }

  Future fetchBrand() async {
    print('brand');
    String? token = await storage.read(key: "token");
    final Uri resAPIURL = Uri.parse(baseurl + "/product/brand");
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization": "Bearer $token"},
    );

    final Map parseBrand = await json.decode(response.body.toString());

    listOfbrand = parseBrand["data"];
  }

  Future fetchBrandOverview() async {
    print('BrandOverview');
    String? token = await storage.read(key: "token");
    var p_brand = await storage.read(key: 'p_brand');
    final Uri resAPIURL = Uri.parse(baseurl + "/product/brand/" + p_brand!);
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization": "Bearer $token"},
    );

    final Map parseBrand = await json.decode(response.body.toString());

    brandOverview = parseBrand["data"];
  }

  Future fetchProductOverview() async {
    print('BrandOverview');
    String? token = await storage.read(key: "token");
    var id = await storage.read(key: 'id');
    final Uri resAPIURL = Uri.parse(baseurl + "/product/" + id!);
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization": "Bearer $token"},
    );

    final Map parseBrand = await json.decode(response.body.toString());

    productOverview = parseBrand["data"];
  }

  Future fetchMentionProduct() async {
    print('hereeeeeeee');
    String? token = await storage.read(key: "token");
    final Uri resAPIURL =
        Uri.parse(baseurl + "/home/createPost/mention/topMention");
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization": "Bearer $token"},
    );
    final Map parsedProduct = await json.decode(response.body.toString());

    productData = parsedProduct["product"];
    print(productData);
  }

  Future fetchMyPostAndReply() async {
    print("mfmfmafjnjadndgj");
    var username = await storage.read(key: 'username');
    String? token = await storage.read(key: "token");
    final Uri resAPIURL =
        Uri.parse(baseurl + "/profile/PostAndReply/" + username!);
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization": "Bearer $token"},
    );
    final Map parsedProduct = await json.decode(response.body.toString());

    myPost = parsedProduct["myPost"];
    print(myPost);
  }

  Future fetchAnotherPostAndReply() async {
    var username = await storage.read(key: 'anotherprofile');
    String? token = await storage.read(key: "token");
    final Uri resAPIURL =
        Uri.parse(baseurl + "/profile/PostAndReply/" + username!);
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization": "Bearer $token"},
    );
    final Map parsedProduct = await json.decode(response.body.toString());

    myPost = parsedProduct["myPost"];
    print(myPost);
  }

  Future fetchFavPost() async {
    var id = await storage.read(key: 'idFavPost');
    String? token = await storage.read(key: "token");
    final Uri resAPIURL = Uri.parse(baseurl + "/profile/getFavPost/" + id!);
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization": "Bearer $token"},
    );
    final Map parsedProduct = await json.decode(response.body.toString());

    favPost = parsedProduct["favPost"];
    // print(favPost);
    return favPost;
  }

  String formater(String url) {
    print(baseurl + url);
    return baseurl + url;
  }
}
