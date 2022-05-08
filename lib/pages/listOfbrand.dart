import 'dart:async';

import 'package:Florxy/Model/mentionProductModel.dart';
import 'package:Florxy/Model/productModel.dart';
import 'package:Florxy/pages/LoginPage.dart';
import 'package:Florxy/pages/searchpage.dart';
import 'package:Florxy/widgets/SearchMentionPostWidget.dart';
import 'package:Florxy/widgets/button.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flappy_search_bar_ns/flappy_search_bar_ns.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/scrapper/incidecoder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import '../NetworkHandler.dart';
import '../postProvider.dart';




class Allbrands extends StatefulWidget {
  const Allbrands({Key? key}) : super(key: key);

  @override
  State<Allbrands> createState() => _AllbrandsState();
}

class _AllbrandsState extends State<Allbrands> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height ,
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(33.0),
              topRight: const Radius.circular(33.0),
            ),
          ),
          child: _buildSelectProductMenu(context),
        ),
      ),
    );
  }
}


Widget _buildSelectProductMenu(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: MediaQuery.of(context).size.height/16.8),
      Container(
        color: Colors.red,
        width: MediaQuery.of(context).size.width,
        child: Poppins(
          text: "All Brands",
          color: c.blackMain,
          fontWeight: f.semiBold,
          size:20,
        ),
      ),

      Expanded(child: SearchProduct()),
    ],
  );

}


// ################### Top Mention #################################

class Product extends StatefulWidget {
  Product({Key? key}) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<PostProvider>(context,listen: false).fetchMentionProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Consumer<PostProvider>(builder: (context,model,_) => FutureBuilder(
          future: model.fetchMentionProduct(),
          builder: (context,snapshot) => ListView.builder(
            // scrollDirection: Axis.vertical,
            itemCount: model.productData?.length??0,
            itemBuilder: (context,int index){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 14),
                        Center(
                          child: Container(
                            height: 100,
                            width: 65,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                image: DecorationImage(
                                    image: NetworkImage(model.productData![index]['p_img']),
                                    fit: BoxFit.contain
                                )
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PoppinsLeft(text: model.productData![index]['p_brand'], size: 13, color: c.textBlack, fontWeight: f.semiBold),
                                PoppinsLeft(text: model.productData![index]['p_name'], size: 13, color: c.textBlack, fontWeight: f.semiBold),
                                SizedBox(height: 15),
                                Roboto_Crop(text: model.productData![index]['p_desc'], size: 12, color: c.greySub, fontWeight: f.regular)
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: WhiteGreenButton(
                            text: 'add',
                            size: 11,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 15),
                    Divider(
                      color: c.greyMain,
                      thickness: 0.5,
                      height: 0,
                    ),
                  ],
                ),
              );
            },
          ),
        )),
      ),
    );
  }
}

// ################### Search #################################

class SearchProduct extends StatefulWidget {
  const SearchProduct({Key? key}) : super(key: key);

  @override
  _SearchProductState createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();
  String query = '';
  List products = [];
  List<ProductModel> product2 = [];
  List<MentionProductModel> mention = [];
  Timer? debouncer;

  @override
  void initState() {
    // TODO: implement initState
    init();
    // fetchdata();
    super.initState();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  // void fetchdata() async {
  //   var response = await networkHandler.get("/home/getProduct");
  //   print(ProductModel.fromJson(response["product"]).runtimeType);
  //   // print(response.runtimeType);
  //   setState(() {
  //     // product2 = ProductModel.fromJson(response["product"]);
  //     // print(ProductModel.fromJson(response["product"]).runtimeType);
  //   });
  // }

  void debounce(
      VoidCallback callback, {
        Duration duration = const Duration(milliseconds: 1000),
      }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final products = await networkHandler.getProducts(query);

    setState(() => this.products = products);
  }

  void setMentionProduct(String id, String brand, String product) {
    MentionProductModel mentionProductModel = MentionProductModel(id: id, brand: brand, product: product);
    setState(() {
      mention.add(mentionProductModel);
    });
  }

  Future clearMentionProduct(String id) async {
    setState(() {
      mention.removeWhere((element) => element.id == id);
    });
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              height: MediaQuery.of(context).size.height/6,
              width: MediaQuery.of(context).size.width/2,
              child: Expanded(
                child: Column(
                  children: [
                    // SizedBox(height: 8),
                    Stack(
                      alignment: Alignment.topRight,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: Icon(FeatherIcons.alertTriangle, size: 74, color: c.yellowMain)),
                        Align(
                            alignment: Alignment.topRight,
                            child: Icon(FeatherIcons.x, size: 26, color: c.blackMain)
                        ),
                      ],
                    ),
                    SizedBox(height: 18),
                    Inter(text: "Maximum 4 mention products", size: 13, color: c.blackMain, fontWeight: f.semiBold),
                    SizedBox(height: 2),
                    Inter(text: "in one post", size: 13, color: c.blackMain, fontWeight: f.semiBold),
                  ],
                ),
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child:  Column(
                children: <Widget>[
                  buildSearch(),
                  SizedBox(height: 15),
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
                        itemCount: products.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return buildProoduct(product);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            mention.isNotEmpty?Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      removeBottom: true,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: mention.length,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context,index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 25, right: 25),
                              child: Column(
                                children: [
                                  SizedBox(height: 15),
                                  Row(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width-90,
                                        child: Inter_Crop(
                                            text: mention[index].brand! + " : " + mention[index].product!,
                                            size: 13,
                                            color: c.blackMain,
                                            fontWeight: f.medium),
                                      ),
                                      Expanded(child: Container()),
                                      GestureDetector(
                                        child: Icon(FeatherIcons.x, size: 22, color: Colors.red),
                                        onTap: () {
                                          clearMentionProduct(mention[index].id!);
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 13),
                                  Divider(
                                    color: c.greyMain,
                                    thickness: 0.6,
                                    height: 0,
                                  ),
                                ],
                              ),
                            );}
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Roboto(text: "add  ", size: 12.5, color: c.graySub2, fontWeight: f.medium),
                        Roboto(text: mention.length.toString(), size: 12.5, color: c.greenMain, fontWeight: f.black),
                        Roboto(text: "  products to mention in post", size: 12.5, color: c.graySub2, fontWeight: f.medium),
                      ],
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 45, right: 45),
                      child: GestureDetector(
                        child: GreenButton(
                          text: 'ADD PRODUCT',
                          size: 14,
                          color: c.textWhite,
                          height: 50,
                        ),
                        onTap: () async {
                          // print(mention);
                          await storage.write(key: "mention-product", value: 'check');
                          await storage.write(key: "review-product", value: 'check');
                          Navigator.pop(context, mention);
                        },
                      ),
                    ),
                    SizedBox(height: 30)
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(20.0),
                    topRight: const Radius.circular(20.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: c.shadow.withOpacity(0.50),
                      spreadRadius: 2,
                      blurRadius: 45,
                      offset: Offset(0, 18), // changes position of shadow
                    ),
                  ],
                ),
              ),
            ):Container()
          ],
        ),
      ),
    );
  }

  Widget buildSearch() => SearchMentionPost(
    text: query,
    hintText: "Search product to mention",
    onChanged: searchProduct,
  );

  Future searchProduct(String query) async => debounce(() async {
    final products = await networkHandler.getProducts(query);

    if (!mounted) return;

    setState(() {
      this.query = query;
      this.products = products;
    });
  });

  bool check(String id) {
    var contain = mention.where((element) => element.id == id);
    if (contain.isEmpty){
      return false;
    }
    else return true;
  }

  Widget buildProoduct(ProductModel product) => Column(
    children: [
      SizedBox(height: 20),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 14),
          Center(
            child: Container(
              height: 100,
              width: 68,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                      image: NetworkImage(product.p_img),
                      fit: BoxFit.contain
                  )
              ),
            ),
          ),
          SizedBox(width: 20,),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PoppinsLeft(text: product.p_brand, size: 13, color: c.textBlack, fontWeight: f.semiBold),
                  PoppinsLeft(text: product.p_name, size: 13, color: c.textBlack, fontWeight: f.semiBold),
                  SizedBox(height: 15),
                  Roboto_Crop(text: product.p_desc, size: 12, color: c.greySub, fontWeight: f.regular)
                ],
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 20),
              child: check(product.id!)==false?GestureDetector(
                child: WhiteGreenButton(
                  text: 'add',
                  size: 11,
                ),
                onTap: () {
                  if(mention.length==4) {
                    showAlertDialog(context);
                  } else setMentionProduct(product.id!, product.p_brand, product.p_name);
                  // print(product.id!);
                },
              ):GestureDetector(
                child: Icon(Boxicons.bxs_check_circle, size: 27, color: c.greenMain),
                onTap: () {
                  clearMentionProduct(product.id!);
                },
              )
          )
        ],
      ),
      SizedBox(height: 15),
      Divider(
        color: c.greyMain,
        thickness: 0.5,
        height: 0,
      ),
    ],
  );

}



