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
  List<dynamic>? anotherPost;
  List<dynamic>? favPost;
  List<dynamic>? SearchData;
  List<dynamic>? listOfbrand;
  List<dynamic>? brandOverview;
  List<dynamic>? notification;
  List<dynamic>? topmention;
  List<dynamic>? topreview;
  List<dynamic>? comment;
  List<dynamic>? profile;
  List<dynamic>? chat;
  List<dynamic>? com2;
  List<dynamic>? com3;
  List<dynamic>? interestingreview;
  List<dynamic>? searchPost;
  List<dynamic>? searchUser;
  List<dynamic>? searchProduct;
  List<dynamic>? report;



  FlutterSecureStorage storage = FlutterSecureStorage();

  Future fetchData() async{
    String? token = await storage.read(key:"token");
    final Uri resAPIURL = Uri.parse( networkHandler.baseurl + "/home/getPost");
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization": "Bearer $token","Access-Control-Allow-Origin": "*",
        'Access-Control-Allow-Methods':'GET,PUT,POST,DELETE',
        'Access-Control-Allow-Headers':'Origin,X-Requested-With,Content-Type,Accept,content-type,application/json'
      },

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
      headers: {"Authorization": "Bearer $token","Access-Control-Allow-Origin": "*",
        'Access-Control-Allow-Methods':'GET,PUT,POST,DELETE',
        'Access-Control-Allow-Headers':'Origin,X-Requested-With,Content-Type,Accept,content-type,application/json'
      },
    );
    final Map parseBrand = await json.decode(response.body.toString());

    listOfbrand = parseBrand["data"];
  }

  Future fetchBrandOverview() async {
    print('BrandOverview');
    String? token = await storage.read(key: "token");
    var p_brand = await storage.read(key: 'p_brand');
    final Uri resAPIURL = Uri.parse(networkHandler.baseurl + "/product/brand/" + p_brand!);
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization": "Bearer $token",
        "Access-Control-Allow-Origin": "*",
        'Access-Control-Allow-Methods':'GET,PUT,POST,DELETE',
        'Access-Control-Allow-Headers':'Origin,X-Requested-With,Content-Type,Accept,content-type,application/json'
      },
    );

    final Map parseBrand = await json.decode(response.body.toString());

    brandOverview = parseBrand["data"];

  }

  Future fetchNotification() async {
    print('Notification');
    String? token = await storage.read(key: "token");
    final Uri resAPIURL = Uri.parse(networkHandler.baseurl + "/profile/getNotificationData");
    print(resAPIURL);
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization": "Bearer $token",
    "Access-Control-Allow-Origin": "*",
        'Access-Control-Allow-Methods':'GET,PUT,POST,DELETE',
        'Access-Control-Allow-Headers':'Origin,X-Requested-With,Content-Type,Accept,content-type,application/json'
    },
    );

    final Map parsedData = await json.decode(response.body.toString());

    notification = parsedData["data"];
    print(notification);

  }

  Future fetchMentionProduct() async {
    print('hereeeeeeee');
    String? token = await storage.read(key:"token");
    final Uri resAPIURL = Uri.parse( networkHandler.baseurl + "/home/createPost/mention/topMention");
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization": "Bearer $token",
        "Access-Control-Allow-Origin": "*",
        'Access-Control-Allow-Methods':'GET,PUT,POST,DELETE',
        'Access-Control-Allow-Headers':'Origin,X-Requested-With,Content-Type,Accept,content-type,application/json'},

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
      headers: {"Authorization": "Bearer $token",
        "Access-Control-Allow-Origin": "*",
        'Access-Control-Allow-Methods':'GET,PUT,POST,DELETE',
        'Access-Control-Allow-Headers':'Origin,X-Requested-With,Content-Type,Accept,content-type,application/json'},
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
      headers: {"Authorization": "Bearer $token",
        "Access-Control-Allow-Origin": "*",
        'Access-Control-Allow-Methods':'GET,PUT,POST,DELETE',
        'Access-Control-Allow-Headers':'Origin,X-Requested-With,Content-Type,Accept,content-type,application/json'},
    );
    final Map parsedProduct = await json.decode(response.body.toString());

    anotherPost = parsedProduct["anotherPost"];
    profile = parsedProduct["anotherProfile"];
  }

  // Future fetchFavPost() async {
  //   var id = await storage.read(key: 'idFavPost');
  //   String? token = await storage.read(key:"token");
  //   final Uri resAPIURL = Uri.parse( networkHandler.baseurl + "/profile/getFavPost/"+id!);
  //   http.Response response = await httpClient.get(
  //     resAPIURL,
  //     headers: {"Authorization": "Bearer $token"},
  //   );
  //   final Map parsedProduct = await json.decode(response.body.toString());
  //
  //   favPost = parsedProduct["favPost"];
  //   print("favPost");
  //   print(favPost);
  // }

  Future fetchComment(String idPost) async{
    // var id = await storage.read(key: 'idPost');
    // print(id);
    String? token = await storage.read(key:"token");
    final Uri resAPIURL = Uri.parse( networkHandler.baseurl + "/home/getComment/"+idPost);
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization":"Bearer $token",
        "Access-Control-Allow-Origin": "*",
        'Access-Control-Allow-Methods':'GET,PUT,POST,DELETE',
        'Access-Control-Allow-Headers':'Origin,X-Requested-With,Content-Type,Accept,content-type,application/json'},
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
      headers: {"Authorization":"Bearer $token",
        "Access-Control-Allow-Origin": "*",
        'Access-Control-Allow-Methods':'GET,PUT,POST,DELETE',
        'Access-Control-Allow-Headers':'Origin,X-Requested-With,Content-Type,Accept,content-type,application/json'},
    );
    final Map parsedProduct = await json.decode(response.body.toString());

    chat = parsedProduct["showChat"];
    // print('comment');
    // print(comment);
  }

  Future fetchCompare2() async {
    print('Compare2');
    String? token = await storage.read(key: "token");
    var p_id1 = await storage.read(key: 'p_id1');
    var p_id2 = await storage.read(key: 'p_id2');
    print('Compare2 '+ p_id1.toString());
    print('Compare2 '+ p_id2.toString());
    final Uri resAPIURL = Uri.parse(networkHandler.baseurl + "/product/compare2/" + p_id1!+"/"+p_id2!);
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization": "Bearer $token",
        "Access-Control-Allow-Origin": "*",
        'Access-Control-Allow-Methods':'GET,PUT,POST,DELETE',
        'Access-Control-Allow-Headers':'Origin,X-Requested-With,Content-Type,Accept,content-type,application/json'},
    );

    final Map parseBrand = await json.decode(response.body.toString());

    com2 = parseBrand["product"];

  }

  Future fetchCompare3() async {
    print('Compare3');
    String? token = await storage.read(key: "token");
    var p_id1 = await storage.read(key: 'p_id1');
    var p_id2 = await storage.read(key: 'p_id2');
    var p_id3 = await storage.read(key: 'p_id3');
    print('Compare3 '+ p_id1.toString());
    print('Compare3 '+ p_id2.toString());
    print('Compare3 '+ p_id3.toString());

    final Uri resAPIURL = Uri.parse(networkHandler.baseurl + "/product/compare3/" + p_id1!+"/"+p_id2!+"/"+p_id3!);
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization": "Bearer $token",
        "Access-Control-Allow-Origin": "*",
        'Access-Control-Allow-Methods':'GET,PUT,POST,DELETE',
        'Access-Control-Allow-Headers':'Origin,X-Requested-With,Content-Type,Accept,content-type,application/json'},
    );

    final Map parseBrand = await json.decode(response.body.toString());

    com3 = parseBrand["product"];
    print(com3);


  }

  Future fetchTopmentionProduct() async {
    print('Topmontion');
    String? token = await storage.read(key: "token");
    var p_brand = await storage.read(key: 'p_brand');
    final Uri resAPIURL = Uri.parse(networkHandler.baseurl + "/product/topmention/brand/" + p_brand!);
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization": "Bearer $token",
        "Access-Control-Allow-Origin": "*",
        'Access-Control-Allow-Methods':'GET,PUT,POST,DELETE',
        'Access-Control-Allow-Headers':'Origin,X-Requested-With,Content-Type,Accept,content-type,application/json'},
    );

    final Map parseBrand = await json.decode(response.body.toString());

    topmention = parseBrand["data"];

  }

  Future fetchTopreviewProduct() async {
    print('Topreview');
    String? token = await storage.read(key: "token");
    var p_brand = await storage.read(key: 'p_brand');
    final Uri resAPIURL = Uri.parse(networkHandler.baseurl + "/product/topreview/brand/" + p_brand!);
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization": "Bearer $token",
        "Access-Control-Allow-Origin": "*",
        'Access-Control-Allow-Methods':'GET,PUT,POST,DELETE',
        'Access-Control-Allow-Headers':'Origin,X-Requested-With,Content-Type,Accept,content-type,application/json'},
    );

    final Map parseBrand = await json.decode(response.body.toString());

    topreview = parseBrand["data"];

  }

  Future fetchInteresting() async {
    print('Interesting review');
    String? token = await storage.read(key: "token");
    var id = await storage.read(key: 'p_id');
    print(id);
    final Uri resAPIURL = Uri.parse(networkHandler.baseurl + "/product/post/interestingreview/" + id!);
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization": "Bearer $token",
        "Access-Control-Allow-Origin": "*",
        'Access-Control-Allow-Methods':'GET,PUT,POST,DELETE',
        'Access-Control-Allow-Headers':'Origin,X-Requested-With,Content-Type,Accept,content-type,application/json'},
    );

    final Map parseBrand = await json.decode(response.body.toString());

    interestingreview = parseBrand["interesting"];
    print(interestingreview);


  }

  Future fetchSearchProductPost(String query) async{
    print('SearchProductPost');
    print(query);
    String? token = await storage.read(key:"token");
    final Uri resAPIURL = Uri.parse( networkHandler.baseurl + "/home/getSearchProductPost/"+query);
    print(networkHandler.baseurl + "/home/getSearchProductPost/"+query);
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization": "Bearer $token",
        "Access-Control-Allow-Origin": "*",
        'Access-Control-Allow-Methods':'GET,PUT,POST,DELETE',
        'Access-Control-Allow-Headers':'Origin,X-Requested-With,Content-Type,Accept,content-type,application/json'},
    );
    final Map parsedProduct = await json.decode(response.body.toString());

    searchPost = parsedProduct["getPost"];
    print("getPost");
    print(searchPost);
  }

  Future fetchSearchUser(String query) async{
    print('SearchUser');
    print(query);
    String? token = await storage.read(key:"token");
    final Uri resAPIURL = Uri.parse( networkHandler.baseurl + "/profile/getSearchUser/"+query);
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization": "Bearer $token",
        "Access-Control-Allow-Origin": "*",
        'Access-Control-Allow-Methods':'GET,PUT,POST,DELETE',
        'Access-Control-Allow-Headers':'Origin,X-Requested-With,Content-Type,Accept,content-type,application/json'},
    );
    final Map parsedProduct = await json.decode(response.body.toString());

    searchUser = parsedProduct["getUser"];
    print("getUser");
    print(searchUser);
  }

  Future fetchSearchProduct(String query) async{
    print('SearchProduct');
    print(query);
    String? token = await storage.read(key:"token");
    final Uri resAPIURL = Uri.parse( networkHandler.baseurl + "/product/getSearchProduct/"+query);
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization": "Bearer $token",
        "Access-Control-Allow-Origin": "*",
        'Access-Control-Allow-Methods':'GET,PUT,POST,DELETE',
        'Access-Control-Allow-Headers':'Origin,X-Requested-With,Content-Type,Accept,content-type,application/json'},
    );
    final Map parsedProduct = await json.decode(response.body.toString());

    searchProduct = parsedProduct["getProduct"];
    print("getProduct");
    print(searchProduct);
  }

  Future fetchReport(String idPost) async{
    // var id = await storage.read(key: 'idPost');
    // print(id);
    String? token = await storage.read(key:"token");
    final Uri resAPIURL = Uri.parse( networkHandler.baseurl + "/home/getReport/"+idPost);
    http.Response response = await httpClient.get(
      resAPIURL,
      headers: {"Authorization":"Bearer $token"},
    );
    final Map parsedReport = await json.decode(response.body.toString());

    report = parsedReport["report"];
    // print('comment');
    // print(comment);
  }



  String formater(String url) {
    print(networkHandler.baseurl + url);
    return networkHandler.baseurl + url;
  }
}
