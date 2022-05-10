import 'dart:async';
import 'dart:convert';

import 'package:boxicons/boxicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../Model/mentionProductModel.dart';
import '../Model/productModel.dart';
import '../NetworkHandler.dart';
import '../widgets/SearchMentionPostWidget.dart';
import '../widgets/button.dart';
import '../widgets/fontWeight.dart';
import '../widgets/font.dart';

class ResultofSimilarProduct extends StatefulWidget {
  const ResultofSimilarProduct({Key? key}) : super(key: key);


  @override
  _ResultofSimilarProductState createState() => _ResultofSimilarProductState();
}

class _ResultofSimilarProductState extends State<ResultofSimilarProduct> {
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();
  String query = '';
  int num_products=0;
  List products = [];
  List all_ing = [] ;
  List similar_list = [];
  List sort_list = [];
  List mynum  = [];
  List<ProductModel> product2 = [];
  List<MentionProductModel> mention = [];
  Timer? debouncer;

  ProductModel productModel = ProductModel(
    id: '',
    review: 0,
    mention: 0,
    ing_rate: [],
    ing_name: [],
    ing_met: [],
    ing_irr: [],
    ing_id: [],
    p_name: '',
    p_img: '',
    p_desc: '',
    p_brand: '',
    p_cate: '',
  );

  bool checkfinish = false;

  @override
  void initState() {
    // TODO: implement initState

    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await init();
      await fetchData();
      setState(() { });
    });

    super.initState();
  }

  Future init() async {
    final products = await networkHandler.getSimilarProduct(query);

    setState(() => this.products = products);
  }

  fetchData() async {
    String? SimilarProductID = await storage.read(key: "similarproductID");
    print('Similar product id:'+SimilarProductID.toString());
    String? SimilarProduct = await storage.read(key: "similarproduct");
    print('Similar Cate:'+SimilarProduct.toString());


    print('Product Length: '+products.length.toString());
    print('my ID: '+SimilarProductID.toString());
    //find selected product
    int i =0;
    int numSelected = 0;
    List allscore = [];

    print('go to for loop');
    for(i;i<products.length;i++){
      if(products[i].id==SimilarProductID){
        numSelected = i;
      }
      else{
        allscore.add(0);
        similar_list.add(products[i]);
      }
    }
    print(allscore);
    print('my new list: '+similar_list.length.toString());
    products[numSelected].ing_id.remove(null);  //กูขี้เกียจเขียน for หา null ขอโทษนะ
    products[numSelected].ing_id.remove(null);
    products[numSelected].ing_id.remove(null);
    products[numSelected].ing_id.remove(null);
    products[numSelected].ing_id.remove(null);
    products[numSelected].ing_id.remove(null);
    products[numSelected].ing_id.remove(null);
    products[numSelected].ing_id.remove(null);
    print(products[numSelected].ing_id.length);
    int j =0;
    int num = 0;

    var response = await networkHandler.get("/home/getProductInfo/$SimilarProductID");
    setState(() {
      productModel = ProductModel.fromJson(response["product"]);
      checkfinish = true;

      for(j;j<products[numSelected].ing_id.length;j++){
        // print('Now Ing_id $j: '+products[numSelected].ing_id[j].toString());
        int k = 0;
        for(k;k<similar_list.length;k++){
          int checkproduct=0;
          for(checkproduct;checkproduct < similar_list[k].ing_id.length;checkproduct++){
            if(products[numSelected].ing_id[j]==similar_list[k].ing_id[checkproduct]){
              // print('มี ซ้ำนะเว้ยเห้ย $k: '+similar_list[k].ing_id[checkproduct]);
              allscore[k]= allscore[k]+1;
              break;
            }
          }
        }
        num=num+1;
      }
      print(j);

      int l=0;
      for(l;l<allscore.length;l++){
        allscore[l]=(allscore[l]/(j-1))*100;
        allscore[l]= allscore[l].toStringAsFixed(2);
        similar_list[l].p_cate = allscore[l].toString();
        allscore[l] = double.parse(allscore[l]);
      }
      // allscore.sort();
      print(allscore);
      // similar_list.sort((a, b) => a["p_cate"].compareTo(b["p_cate"]));
     //  List topten = [];
     //  int leo = 0;
     //  int z = allscore.length-1;
     // for(z;z>0;z--){
     //   if(leo<10){
     //     break;
     //   }else if(){
     //     topten[leo].add()
     //   }
     // }

      // if(double.parse(similar_list[0].p_cate) >double.parse(similar_list[1].p_cate)){
      //   print('มากกว่าไ่อสัส');
      // }
      int f=0;

      for(f=0;f<similar_list.length;f++){
        mynum.add(f);
      }
      print(mynum);
      List store = [0];
      int o = 0;

      for(o;o<similar_list.length;o++){
        // print(similar_list[o].p_cate);
        int e = o;
        int r=o;
        print('insert r from o: '+r.toString());
        for(e;e<similar_list.length;e++){
          // print('e: '+e.toString());
          // print('r: '+r.toString());
          // print('before r: '+r.toString());
          if(o==4){
            print('r=$r A: '+allscore[r].toString());
            print('e=$e B: '+allscore[e].toString());
          }
          if(allscore[r]<allscore[e]){
            print('r=$r A: '+allscore[r].toString());
            print('e=$e B: '+allscore[e].toString());
            store[0] = allscore[r];
            allscore[r]= allscore[e];
            allscore[e]= store[0];

            // support_list.add(mynum[o]);
            // print(support_list);
            print('mynum[r]: '+mynum[r].toString());
            print('mynum[e]: '+mynum[e].toString());
            store[0] = mynum[r];
            mynum[r]= mynum[e];
            mynum[e]= store[0];
            print(allscore);
            print(mynum);
          }
        }
        print('reset R');
      }
      int sorting=0;
      int getvalue = 0;
      for(sorting;sorting<similar_list.length;sorting++){
        getvalue = mynum[sorting];
        // print(getvalue);
        sort_list.add(similar_list[getvalue]);
        sort_list[sorting].p_cate = sort_list[sorting].p_cate+' %';
      }
    });
  }
  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
      VoidCallback callback, {
        Duration duration = const Duration(milliseconds: 1000),
      }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            Theme.of(context).platform == TargetPlatform.android ? 75 : 66.0),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: c.shadow.withOpacity(0.32),
                spreadRadius: -17,
                blurRadius: 30,
                offset: Offset(0, 6), // changes position of shadow
              ),
            ],
          ),
          child: AppBar(
            centerTitle: false,
            titleSpacing: 0,
            backgroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(26),
                )),
            title: Padding(
              padding: EdgeInsets.only(
                  top: Theme.of(context).platform == TargetPlatform.android
                      ? 18.5
                      : 0),
              child: Poppins(
                text: "Category: ${productModel.p_cate}",
                size: 20,
                color: c.blackMain,
                fontWeight: f.semiBold,
              ),
            ),
            leading: Padding(
              padding: EdgeInsets.only(top: Theme.of(context).platform==TargetPlatform.android?17.5:0, left: 13),
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                icon: Icon(FeatherIcons.chevronLeft),
                iconSize: 34,
                color: Colors.black,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child:  Column(
                children: <Widget>[

                  checkfinish?Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 14, right: 18, top: 18,bottom: 18),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 14),
                          Center(
                            child: Container(
                              height: 110,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                      image: NetworkImage(productModel.p_img),
                                      fit: BoxFit.contain
                                  )
                              ),
                            ),
                          ),
                          SizedBox(width: 25),
                          Expanded(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 8),
                                      child: PoppinsLeft(text: productModel.p_brand, size: 10.5, color: Colors.white, fontWeight: f.semiBold),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: c.brand
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  PoppinsLeft_Crop(text: productModel.p_name, size: 13, color: c.textBlack, fontWeight: f.semiBold),
                                  SizedBox(height: 10),
                                  Roboto_Crop(text: productModel.p_desc, size: 12, color: c.greySub, fontWeight: f.regular),
                                  SizedBox(height: 10),
                                  GestureDetector(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                        width: 60,
                                        child: WhiteGreenButton(
                                          text: productModel.p_cate,
                                          size: 11,
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      // if(mention.length==3) {
                                      //   showAlertDialog(context);
                                      // } else setMentionProduct(product.id!, product.p_brand, product.p_name);
                                      // setState(() {
                                      //   num_products++;
                                      // });
                                      print(productModel.id!);
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: c.shadow.withOpacity(0.1),
                          spreadRadius: -15,
                          blurRadius: 41,
                          offset: Offset(3, 7), // changes position of shadow
                        ),
                      ],
                    ),
                  ):Container(),
                  SizedBox(height: 23),
                  products.isEmpty?Center(
                    child: Column(
                      children: [
                        SizedBox(height: 60),
                        Icon(FeatherIcons.frown, size: 70, color: c.greySub),
                        SizedBox(height: 8),
                        Inter(text: "Sorry, we couldn't find any product.", size: 13, color: c.greySub, fontWeight: f.semiBold),
                        SizedBox(height: 2),
                        Inter(text: "Please find another product.", size: 13, color: c.greySub, fontWeight: f.semiBold)
                      ],
                    ),
                  ):Expanded(
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      removeBottom: true,
                      child: ListView.builder(
                        itemCount: sort_list.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final product = sort_list[index];
                          return buildProoduct(product);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future searchProduct(String query) async => debounce(() async {
    final products = await networkHandler.getProducts(query);

    if (!mounted) return;

    setState(() {
      this.query = query;
      this.products = products;
    });
  });


  Widget buildProoduct(ProductModel product) => Column(
    children: [
      Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 14, right: 18, top: 18,bottom: 18),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 14),
              Center(
                child: Container(
                  height: 110,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                          image: NetworkImage(product.p_img),
                          fit: BoxFit.contain
                      )
                  ),
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 8),
                          child: PoppinsLeft(text: product.p_brand, size: 10.5, color: Colors.white, fontWeight: f.semiBold),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: c.brand
                        ),
                      ),
                      SizedBox(height: 3),
                      PoppinsLeft_Crop(text: product.p_name, size: 13, color: c.textBlack, fontWeight: f.semiBold),
                      SizedBox(height: 10),
                      Roboto_Crop(text: product.p_desc, size: 12, color: c.greySub, fontWeight: f.regular),
                      SizedBox(height: 10),
                      GestureDetector(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: 60,
                            child: WhiteGreenButton(
                              text: product.p_cate,
                              size: 11,
                            ),
                          ),
                        ),
                        onTap: () {
                          // if(mention.length==3) {
                          //   showAlertDialog(context);
                          // } else setMentionProduct(product.id!, product.p_brand, product.p_name);
                          // setState(() {
                          //   num_products++;
                          // });
                          print(product.p_cate);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: c.shadow.withOpacity(0.1),
              spreadRadius: -15,
              blurRadius: 41,
              offset: Offset(3, 7), // changes position of shadow
            ),
          ],
        ),
      ),
      SizedBox(height: 23),
    ],
  );
}
