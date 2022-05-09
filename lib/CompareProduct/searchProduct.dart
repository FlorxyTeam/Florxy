import 'dart:async';

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

class SearchToCompare extends StatefulWidget {
  const SearchToCompare({Key? key}) : super(key: key);

  @override
  _SearchToCompareState createState() => _SearchToCompareState();
}

class _SearchToCompareState extends State<SearchToCompare> {
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
                    Inter(text: "Maximum 3 products", size: 13, color: c.blackMain, fontWeight: f.semiBold),
                    SizedBox(height: 2),
                    Inter(text: "to compare", size: 13, color: c.blackMain, fontWeight: f.semiBold),
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
            title: Poppins(
              text: "Compare Products",
              size: 20,
              color: c.blackMain,
              fontWeight: f.semiBold,
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
                  buildSearch(),
                  SizedBox(height: 25),
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
                        Roboto(text: "  products to compare", size: 12.5, color: c.graySub2, fontWeight: f.medium),
                      ],
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 45, right: 45),
                      child: GestureDetector(
                        child: GreenButton(
                          text: 'COMPARE',
                          size: 14,
                          color: c.textWhite,
                          height: 50,
                        ),
                        onTap: () async {
                          // await storage.write(key: "mention-product", value: 'check');
                          // await storage.write(key: "review-product", value: 'check');
                          // Navigator.pop(context, mention);
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
    hintText: "Search product to compare",
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
                      check(product.id!)==false?GestureDetector(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: 48,
                            child: WhiteGreenButton(
                              text: 'add',
                              size: 11,
                            ),
                          ),
                        ),
                        onTap: () {
                          if(mention.length==3) {
                            showAlertDialog(context);
                          } else setMentionProduct(product.id!, product.p_brand, product.p_name);
                          // print(product.id!);
                        },
                      ):GestureDetector(
                        child: Align(
                          alignment: Alignment.centerRight,
                            child: Icon(Boxicons.bxs_check_circle, size: 26, color: c.greenMain)
                        ),
                        onTap: () {
                          clearMentionProduct(product.id!);
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
