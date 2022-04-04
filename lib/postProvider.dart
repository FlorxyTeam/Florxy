import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'NetworkHandler.dart';

class PostProvider extends ChangeNotifier {
  final networkHandler = NetworkHandler();

  final httpClient = http.Client();

  List<dynamic>? postData;
  List<dynamic>? productData;
  List<dynamic>? myPost;
  List<dynamic>? searchPost;
  List<dynamic>? anotherPost;
  List<dynamic>? favPost;
  List<dynamic>? SearchData;
  List<dynamic>? listOfbrand;
  List<dynamic>? brandOverview;
  List<dynamic>? productOverview;
  List<dynamic>? comment;
  List<dynamic>? profile;
  List<dynamic>? chat;



  FlutterSecureStorage storage = FlutterSecureStorage();

  Future fetchData() async{
    String? token = await storage.read(key:"token");
    final Uri resAPIURL = Uri.parse( networkHandler.baseurl + "/home/getAllPost");
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
    final Uri resAPIURL = Uri.parse(networkHandler.baseurl + "/product/brand");
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization": "Bearer $token"},
    );
    final Map parseBrand = await json.decode(response.body.toString());

    listOfbrand = parseBrand["data"];
  }

  Future fetchSearchPost(query) async {
    print('SearchPost');
    String? token = await storage.read(key: "token");
    final Uri resAPIURL = Uri.parse(networkHandler.baseurl + "/home/getSearchPost/" + query!);
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization": "Bearer $token"},
    );

    final Map parseSearch = await json.decode(response.body.toString());

    searchPost = parseSearch["data"];
  }

  Future fetchBrandOverview() async {
    print('BrandOverview');
    String? token = await storage.read(key: "token");
    var p_brand = await storage.read(key: 'p_brand');
    final Uri resAPIURL = Uri.parse(networkHandler.baseurl + "/product/brand/" + p_brand!);
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
    final Uri resAPIURL = Uri.parse(networkHandler.baseurl + "/product/" + id!);
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization": "Bearer $token"},
    );

    final Map parseBrand = await json.decode(response.body.toString());

    productOverview = parseBrand["data"];
  }

  Future fetchMentionProduct() async {
    print('hereeeeeeee');
    String? token = await storage.read(key:"token");
    final Uri resAPIURL = Uri.parse( networkHandler.baseurl + "/home/createPost/mention/topMention");
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization": "Bearer $token"},
    );
    final Map parsedProduct = await json.decode(response.body.toString());

    productData = parsedProduct["product"];
    // print(productData);
  }

  Future fetchMyPostAndReply() async {
    print("mfmfmafjnjadndgj");
    var username = await storage.read(key: 'username');
    String? token = await storage.read(key:"token");
    final Uri resAPIURL = Uri.parse( networkHandler.baseurl + "/profile/PostAndReply/"+username!);
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization": "Bearer $token"},
    );
    final Map parsedProduct = await json.decode(response.body.toString());

    myPost = parsedProduct["myPost"];
    // print(myPost);
  }

  Future fetchAnotherPostAndReply(String username) async{
    // var username = await storage.read(key: 'anotherUsername');
    String? token = await storage.read(key:"token");
    final Uri resAPIURL = Uri.parse( networkHandler.baseurl + "/profile/otherPostAndReply/"+username);
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization": "Bearer $token"},
    );
    final Map parsedProduct = await json.decode(response.body.toString());

    anotherPost = parsedProduct["anotherPost"];
    profile = parsedProduct["anotherProfile"];
  }

  Future fetchFavPost() async {
    var id = await storage.read(key: 'idFavPost');
    String? token = await storage.read(key:"token");
    final Uri resAPIURL = Uri.parse( networkHandler.baseurl + "/profile/getFavPost/"+id!);
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization": "Bearer $token"},
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
    final Uri resAPIURL = Uri.parse( networkHandler.baseurl + "/home/getComment/"+idPost);
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization":"Bearer $token"},
    );
    final Map parsedProduct = await json.decode(response.body.toString());

    comment = parsedProduct["comment"];
    // print('comment');
    // print(comment);
  }

  Future fetchChat(String myUsername, String targetUsername) async{
    String? token = await storage.read(key:"token");
    final Uri resAPIURL = Uri.parse( networkHandler.baseurl + "/profile/getChat/"+myUsername+"/"+targetUsername);
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization":"Bearer $token"},
    );
    final Map parsedProduct = await json.decode(response.body.toString());

    chat = parsedProduct["showChat"];
    // print('comment');
    // print(comment);
  }

  String formater(String url) {
    print(networkHandler.baseurl + url);
    return networkHandler.baseurl + url;
  }
}
