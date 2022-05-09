import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
// import 'package:Florxy/NetworkHandler.dart';


class Product{
  String name = "";
  String link = "";
  Product(this.name,this.link);

}

class Ingredient{
  String ing_name = '';
  String ing_met = '';
  String ing_irr = '';
  String ing_rate = '';
  // Ingredient(this.ing_name,this.ing_met,this.ing_irr,this.ing_rate);

}

class Real{
  String p_name = "";
  String p_brand = "";
  String p_desc = "";
  String p_img = "";
  List p_ing = [];
  // Real(this.p_name, this.p_brand, this.p_desc, this.p_img, this.p_ing);
}

class Search{
  String thisURL = "";
  final String beforePage = "&activetab=products&ppage=";
  bool isNext = false;
  bool isPrev = false;
  // List<String> prodPage = [];
  List prodList = [];
}

class Scraper {
  static const URL = 'https://incidecoder.com/search?query=';
  static const URL2 = 'https://incidecoder.com/';


  static Future<Real> getBrand(String path) async {
    // Search obj = new Search();

    // obj.thisURL = path;

    final response = await http.get(Uri.parse("https://incidecoder.com"+path));

    var body = response.body;
    var ing_name = '';
    var ing_met = [];
    var ing_irr = [];
    var ing_rate = '';
    var alling_name = [];
    var alling_met = [];
    var alling_irr = [];
    var alling_rate = [];
    final parse_body = parse(body);
    final name = parse_body.querySelectorAll('#product-title')[0].innerHtml.trim();
    final brand = parse_body.querySelectorAll('#product-brand-title > a')[0].innerHtml.trim();
    final img = parse_body.querySelectorAll('#product-main-image')[0].querySelectorAll('img')[0].attributes['src'];
    final detail = parse_body.querySelectorAll('#product-details')[0].innerHtml.trim();



    Real res = new Real();
    Ingredient res_ing = new Ingredient();
    res.p_name = name;
    res.p_brand = brand;
    res.p_desc = detail;
    res.p_img = img!;
    var ram = [];
    // print(name);
    // print(brand);
    // print(img);
    // print(detail);
    final all_Ing = parse_body.querySelectorAll('#showmore-section-ingredlist-table > table > tbody > tr');
    var i = 0;
    for (var ing in all_Ing){
      var x = ing.querySelectorAll('td > a');
      for (var y in x){
        // y = y.querySelectorAll('a');
        // print(y.classes);
        if(y.classes.contains('black')){
          ing_name = y.innerHtml.trim();
        }else if(y.classes.contains('lilac')){
          ing_met.add(y.innerHtml.trim());
        }

      }
      var j = ing.querySelectorAll('td > span > span');
      for (var k in j){
        ing_irr.add(k.attributes['title'].toString());
      }
      if(ing.querySelectorAll('.our-take').isNotEmpty){
        ing_rate = ing.querySelectorAll('.our-take')[0].innerHtml.trim();
      }
      // res_ing.ing_name = ing_name;
      // res_ing.ing_met = ing_met.toString();
      // res_ing.ing_irr = ing_irr.toString();
      // res_ing.ing_rate = ing_rate;

      alling_name.add(ing_name);
      alling_met.add(ing_met);
      alling_irr.add(ing_irr);
      alling_rate.add(ing_rate);

      // print(alling_name);
      // print(alling_met);
      // print(alling_irr);
      // print(alling_rate);



      // print(res_ing.ing_name);
      // print('-----');
      // print(ing_name);
      // print(ing_met);
      // print(ing_irr);
      // print(ing_rate);
      // print('-----');
      // i = i+1;
      // print(res_ing.ing_name);
      // ram.add(res_ing);
      // for (var s in ram){
      //   print(s.ing_name);
      //   print(s.ing_met);
      //
      // }
      ing_met = [];
      ing_irr = [];
      ing_rate = '';

    }
    ram.add(alling_name);
    ram.add(alling_met);
    ram.add(alling_irr);
    ram.add(alling_rate);

    // print(all_Ing);
    // print(ram[0].ing_name);
    // print(ram[1].ing_name);

    // for(var chk in ram){
    //   print(chk.ing_name);
    // }
    res.p_ing = ram;
    // print(res.p_img);
    return res;
    // return obj.prodList;

  }

  static Future<List> getData(String path) async {
    Search obj = new Search();

    obj.thisURL = path;

    final response = await http.get(Uri.parse(URL + path));

    var body = response.body;


    int count = 2;
    bool isFin = true;
    while (isFin){
      // if(count>1){
      //   break;
      // }
      print(count);

      var new_response = await http.get(Uri.parse(URL+path+obj.beforePage+count.toString()));
      var new_body = new_response.body;
      var new_html = parse(new_body);
      body = body + new_body;
      final links = new_html.querySelectorAll('.paddingb1, .center, .fs18');
      for (var link in links) {
        var str = link.innerHtml.trim();
        if(str.toLowerCase().contains('next page')){
          isFin = true;
          break;

        }
        else{
          isFin = false;
        }

      }
      count = count +1;
    }

    var html = parse(body);


    final products = html.querySelectorAll('a > .klavika, .simpletextlistitem');
    for (var product in products){
      // print('${product.text.trim()} ${product.attributes['href']}');
      var link = product.attributes['href'];
      if (link == null){

      }
      else{
        obj.prodList.add(Product(product.text.trim(), link));
      }
    }


    // print(links[1].innerHtml.split("<a"));
    // print(body.runtimeType);
    return obj.prodList;

  }
  static Future<List> getData2(String path) async {
    Search obj = new Search();

    obj.thisURL = path;

    final response = await http.get(Uri.parse('https://incidecoder.com/brands/'+ path));

    var body = response.body;


    bool isFin = true;
    int count = 1;

    while (isFin){
        var new_response = await http.get(Uri.parse('https://incidecoder.com/brands/'+path+'?offset='+count.toString()));
        var new_body = new_response.body;
        var new_html = parse(new_body);
        body = body + new_body;
        // print(body);
        final links = new_html.querySelectorAll('.center, .fs16');
        for (var link in links) {
          var str = link.innerHtml.trim();
          // print(str);
          if(str.toLowerCase().contains('next page')){
            isFin = true;
            break;

          }
          else {
            isFin = false;
          }
        }
      print(count);
      count = count + 1;
    }



    var html = parse(body);


    final products = html.querySelectorAll('a > .klavika, .simpletextlistitem');
    for (var product in products){
      // print('${product.text.trim()} ${product.attributes['href']}');
      var link = product.attributes['href'];
      if (link == null){

      }
      else{
        obj.prodList.add(Product(product.text.trim(), link));
      }
    }


    // print(links[1].innerHtml.split("<a"));
    // print(body.runtimeType);
    return obj.prodList;

  }
  // Future<String> hasnext(String path)async {
  //   final response = await http.get(Uri.parse(URL + path));
  //
  //   final body = response.body;
  //
  //   final html = parse(body);
  //
  //   int count = 2;
  //
  //   final links = html.querySelectorAll('.paddingb1, .center, .fs18');
  //   for (var link in links) {
  //     var str = link.innerHtml.trim();
  //     while (true){
  //       if(str.toLowerCase().contains('next page')){
  //         obj.isNext = true;
  //       }
  //     }
  //
  //
  //   }
  // }
}


// void initChaptersTitleScrap() async {
//   final rawUrl =
//       'https://unacademy.com/course/gravitation-for-iit-jee/D5A8YSAJ';
//   final webScraper = WebScraper('https://unacademy.com');
//   final endpoint = rawUrl.replaceAll(r'https://unacademy.com', '');
//   if (await webScraper.loadWebPage(endpoint)) {
//     final titleElements = webScraper.getElement(
//         'div.Week__Wrapper-sc-1qeje5a-2 > a.Link__StyledAnchor-sc-1n9f3wx-0 '
//             '> div.ItemCard__ItemInfo-xrh60s-1 '
//             '> h6.H6-sc-1gn2suh-0',
//         []);
//     print(titleElements);
//     final titleList = <String>[];
//     titleElements.forEach((element) {
//       final title = element['title'];
//       titleList.add('$title');
//     });
//     print(titleList);
//     if (mounted)
//       setState(() {
//         this.titleList = titleList;
//       });
//   } else {
//     print('Cannot load url');
//   }
// }

Future<void> main() async{
  // // NetworkHandler networkHandler = NetworkHandler()
  // String baseurl = "https://localhost:8080";
  // String formater(String url) {
  //   print(baseurl+url);
  //   return baseurl + url;
  // }
  //
  // Future<http.Response> post(String url, Map<String, String> body) async {
  //   // String? token = await storage.read(key:"token");
  //
  //   url = formater(url);
  //   var response = await http.post(
  //     Uri.parse(url),
  //     headers: {
  //       "Content-type": "application/json",
  //       // "Authorization":"Bearer $token"
  //     },
  //     body: json.encode(body),
  //   );
  //   return response;
  // }


 //  final stopwatch = Stopwatch()..start();
 //  List results = await Scraper.getData('1');
 //  // print(results);
 // for(int i=0;i<results.length;i++){
 //   print('${results[i].name} , ${results[i].link}');
 //  }
 //  print(stopwatch.elapsed);
 //  List results = [];
 //  results = await Scraper.getData2('innisfree');
 //  for (var result in results){
 //    // print(result.link);
 //
 //    Real x = await Scraper.getBrand(result.link);
    //
  Real x = await Scraper.getBrand('/products/innisfree-innisfree-bija-trouble-lotion');
  //
  int i =1;
  for(var y in x.p_ing){
    for(var z in y){
      print(z);
    }
      // print(i);
      // print(y.runtimeType);
      // i = i + 1 ;
    }
    // Map<String, String> data = {
    //   "p_name":x.p_name,
    //   "p_brand":x.p_brand,
    //   "p_desc": x.p_desc,
    //   "p_img": x.p_img,
    // };
    // // var networkHandler;
    // var response = await post("/product/add", data);
    // print (response);
    // print(x.p_ing[]);
  // }


}
