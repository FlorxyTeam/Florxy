import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

class Product{
  String name = "";
  String link = "";
  Product(this.name,this.link);

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


  static Future<List> getProd(String path) async {
    Search obj = new Search();

    obj.thisURL = path;

    final response = await http.get(Uri.parse(URL2 + path));

    var body = response.body;



    return obj.prodList;

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
  final stopwatch = Stopwatch()..start();
  List results = await Scraper.getData('1');
  print(results.length);
//  for(int i=0;i<results.length;i++){
 //   print('${results[i].name} , ${results[i].link}');
  //}
  print(stopwatch.elapsed);
}
