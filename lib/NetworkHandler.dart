import 'dart:convert';
import 'package:Florxy/Model/productModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:Florxy/Model/allbrand.dart';

class NetworkHandler {

  // String baseurl = "https://asia-southeast1-florxy.cloudfunctions.net/app";


  // String baseurl = "http://192.168.101.79:8080"; //nicha
 

  // String baseurl = "http://192.168.2.33:8080"; //deuan

//   String baseurl = "http://192.168.235.207:8080"; //Leo
  // String baseurl = "http://192.168.1.11:8080"; //Frank
  // String baseurl = "http://192.168.1.101:8080"; //Ake

  var log = Logger();

  FlutterSecureStorage storage = FlutterSecureStorage();
  Future get(String url) async {
    String? token = await storage.read(key:"token");
    url = formater(url);

    var response = await http.get(
      Uri.parse(url),
      headers: {"Authorization":"Bearer $token",
        "Access-Control-Allow-Origin": "*"
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      // log.i(response.body);

      return json.decode(response.body);
    }
    // log.i(response.body);
    // log.i(response.statusCode);
  }

  Future<http.Response> post(String url, Map<String, String> body) async {
    String? token = await storage.read(key:"token");
    url = formater(url);
    var response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-type": "application/json",
        "Authorization":"Bearer $token",
        "Access-Control-Allow-Origin": "*"
      },
      body: json.encode(body),
    );
    return response;
  }

  Future<http.Response> post2(String url, Map<String, dynamic> body) async {
    String? token = await storage.read(key:"token");
    url = formater(url);
    var response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-type": "application/json",
        "Authorization":"Bearer $token",
        "Access-Control-Allow-Origin": "*"
      },
      body: json.encode(body),
    );
    return response;
  }

  Future<http.Response> patch(String url, Map<String, String> body) async {
    String? token = await storage.read(key: "token");
    url = formater(url);
    log.d(body);
    var response = await http.patch(
      Uri.parse(url),
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $token",
        "Access-Control-Allow-Origin": "*"
      },
      body: json.encode(body),
    );
    return response;
  }

  Future<http.StreamedResponse> patchImage(String url,String filepath) async{
    url = formater(url);
    String? token = await storage.read(key:"token");
    var request = http.MultipartRequest('PATCH', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath("img", filepath));
    request.headers.addAll({
      "Content-type":"multipart/form-data",
      "Authorization":"Bearer $token",
      "Access-Control-Allow-Origin": "*"
    });
    var response = request.send();
    return response;
  }

  String formater(String url) {
    // print(baseurl+url);
    return baseurl + url;
  }
  NetworkImage getImage(String email){
    String url = formater("/uploads//$email.jpg");
    return NetworkImage(url);
  }

  Future<http.Response> postO(String url, Map<String, dynamic> body) async {
    String? token = await storage.read(key:"token");
    url = formater(url);
    var response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-type": "application/json",
        "Authorization":"Bearer $token",
        "Access-Control-Allow-Origin": "*"
      },
      body: json.encode(body),
    );
    return response;
  }

  Future<List<ProductModel>> getProducts(String query) async {
    final url = Uri.parse(formater("/home/getProduct"));
    final response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List products = data["product"];
      // print(products);
      return products.map((json) => ProductModel.fromJson(json)).where((product) {
        final brandLower = product.p_brand.toLowerCase();
        final productLower = product.p_name.toLowerCase();
        final mixlower = product.p_brand.toLowerCase() + " " + product.p_name.toLowerCase();
        final searchLower = query.toLowerCase();

        return brandLower.contains(searchLower) ||
            productLower.contains(searchLower) ||
            mixlower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }

  List<AllBrands> parseAllBrands(String respondeBody){
    var list = json.decode(respondeBody) as List<dynamic>;
    var data = list.map((model) => AllBrands.fromJson(model)).toList();
    return data;
  }

  Future<List<AllBrands>> fetchAllbrand() async{
    final response = await http.get(Uri.parse(baseurl + "/product/Allbrand/search"));
    if(response.statusCode == 200){
      return compute(parseAllBrands, response.body);
    } else{
      throw Exception("Request API Error");
    }
  }




}
