import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class NetworkHandler {

  String baseurl = "https://1cd4-124-120-3-60.ngrok.io";


  var log = Logger();

  FlutterSecureStorage storage = FlutterSecureStorage();
  Future get(String url) async {
    String? token = await storage.read(key:"token");
    url = formater(url);

    var response = await http.get(
      Uri.parse(url),
      headers: {"Authorization":"Bearer $token"},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      log.i(response.body);

      return json.decode(response.body);
    }
    log.i(response.body);
    log.i(response.statusCode);
  }

  Future<http.Response> post(String url, Map<String, String> body) async {
    String? token = await storage.read(key:"token");
    url = formater(url);
    var response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-type": "application/json",
        "Authorization":"Bearer $token"
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
        "Authorization": "Bearer $token"
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
      "Authorization":"Bearer $token"
    });
    var response = request.send();
    return response;
  }

  String formater(String url) {
    print(baseurl+url);
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
        "Authorization":"Bearer $token"
      },
      body: json.encode(body),
    );
    return response;
  }

}
