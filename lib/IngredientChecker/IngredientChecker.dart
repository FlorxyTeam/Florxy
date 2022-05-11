import 'dart:async';

import 'package:Florxy/IngredientChecker/SelectedProduct.dart';
import 'package:Florxy/SilimarProduct/resultofsimilarproduct.dart';
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

class IngredientChecker extends StatefulWidget {
  const IngredientChecker({Key? key}) : super(key: key);

  @override
  _IngredientCheckerState createState() => _IngredientCheckerState();
}

class _IngredientCheckerState extends State<IngredientChecker> {
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();
  String query = '';
  int num_products=0;
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
                text: "Ingredient Checker",
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
                              text: 'Select',
                              size: 11,
                            ),
                          ),
                        ),
                        onTap: () async{
                          print('Product id: '+product.id!);
                          await storage.write(key: "similarproduct", value: product.p_cate);
                          String? SimilarProduct = await storage.read(key: "similarproduct");
                          print('Similar Cate:'+SimilarProduct.toString());
                          await storage.write(key: "similarproductID", value: product.id);
                          String? SimilarProductID = await storage.read(key: "similarproductID");
                          print('Select Similar id: '+SimilarProductID.toString());
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SelectedProduct()));

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
