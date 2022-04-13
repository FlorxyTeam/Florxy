import 'package:Florxy/Model/productModel.dart';
import 'package:Florxy/NetworkHandler.dart';
import 'package:Florxy/pages/LoginPage.dart';
import 'package:Florxy/pages/searchpage.dart';
import 'package:Florxy/widgets/SearchMentionPostWidget.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flappy_search_bar_ns/flappy_search_bar_ns.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/scrapper/incidecoder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';

import '../postProvider.dart';
import 'ModalMentionPost.dart';
import 'button.dart';



class ModalReviewPost {
  static Dialog_Settings(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.92,
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(33.0),
            topRight: const Radius.circular(33.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Product(),
        ),
      ),
    );
  }
}

Widget _buildSelectProductMenu(context) {

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: Container(
          width: 78,
          child: Divider(
            height: 0,
            color: c.greyMain,
            thickness: 3.5,
          ),
        ),
      ),
      Container(
        height: 16,
      ),
      // isadd
      // ?Container():Padding(
      //   padding: const EdgeInsets.only(left: 23, right: 23),
      //   child: buildSearch(),
      // ),
      // SizedBox(height: 15),
      // isadd
      // ?Container():Padding(
      //   padding: const EdgeInsets.only(left: 23),
      //   child: Poppins(text: 'Top Review', size: 20, color: c.textBlack, fontWeight: f.semiBold),
      // ),
      // SizedBox(height: 15),
      Product(),
    ],
  );

}

Widget buildSearch() => SearchMentionPost(
  text: '',
  hintText: "Search product to review",
  onChanged: (String value) {  },
);

// ################### Top Mention #################################

class Product extends StatefulWidget {
  Product({Key? key}) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {

  bool isadd = false;
  final networkHandler = NetworkHandler();
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<PostProvider>(context,listen: false).fetchMentionProduct();
    super.initState();
  }

  ProductModel productModel = ProductModel(
    p_brand: '',
    p_desc: '',
    p_img: '',
    p_name: '',
    ing_irr: [],
    ing_met: [],
    ing_name: [],
    ing_rate: [],
    mention: 0,
    review: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 78,
                child: Divider(
                  height: 0,
                  color: c.greyMain,
                  thickness: 3.5,
                ),
              ),
            ),
            SizedBox(height: 16,child: Text('Sizebox16'),),
            isadd
            ?Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      icon: Icon(FeatherIcons.chevronLeft),
                      iconSize: 34,
                      color: Colors.black,
                      onPressed: () {
                        setState(() {
                          isadd = false;
                        });
                      },
                    ),
                    Expanded(child: Container()),
                    Poppins(text: 'Add review', color: c.blackMain,fontWeight: f.semiBold,size: 16),
                    Expanded(child: Container()),
                    Icon(FeatherIcons.chevronLeft,size: 34,color: Colors.white,),
                  ],
            ),
                ],
              ),):Container(
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.only(left: 23, right: 23),
                child: buildSearch(),
              ),
            ),
            SizedBox(height: 15,child: Text('Sizebox15'),),
            isadd
            ?Container(child:
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Column(
                  children: [
                  SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(width: 14),
                      Expanded(
                        child: Center(
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                image: DecorationImage(
                                    image: NetworkImage(productModel.p_img),
                                    fit: BoxFit.contain
                                )
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0,right: 20),
                        child: Container(
                          width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PoppinsLeft(text: productModel.p_brand.toString(), size: 13, color: c.textBlack, fontWeight: f.semiBold),
                              PoppinsLeft(text: productModel.p_name.toString(), size: 13, color: c.textBlack, fontWeight: f.semiBold),
                              SizedBox(height: 15),

                            ],
                          ),
                        ),
                      ),
                  ],
                  ),
                    SizedBox(height: 15),
                    Wrap(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Roboto_Crop(text: productModel.p_desc.toString(), size: 12, color: c.greySub, fontWeight: f.regular)),
                      )
                    ],),
                    SizedBox(height: 15),
                    Divider(
                      color: c.greyMain,
                      thickness: 0.5,
                      height: 0,
                    ),
                    SizedBox(height: 15),
                    Inter(text: 'your overall rating of this product', size: 13, color: Color(0xFF828282), fontWeight: f.semiBold),
                    SizedBox(height: 15),
                    //ดาว
                    SizedBox(height: 15),

                    Divider(
                      color: c.greyMain,
                      thickness: 0.5,
                      height: 0,
                    ),
                    SizedBox(height: 15),
                    // Expanded(child: Container()),
                    SizedBox(height: MediaQuery.of(context).size.height-470,),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: EdgeInsets.only(left: 45,right: 45),
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Navbar(currentState: 0)), (route) => false);
                            },
                            child: GreenButton(
                              text: 'SUBMIT REVIEW',
                              size: 16,
                              color: c.textWhite,
                              height: 60,
                            ),
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ),

            ):Container(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.only(left: 23),
                child: Poppins(text: 'Top Review', size: 20, color: c.textBlack, fontWeight: f.semiBold),
              ),
            ),
            SizedBox(height: 15),
            Consumer<PostProvider>(builder: (context,model,_) => FutureBuilder(
              future: model.fetchMentionProduct(),
              builder: (context,snapshot) => ListView.builder(
                // scrollDirection: Axis.vertical,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: model.productData?.length??0,
                itemBuilder: (context,int index){
                  return
                  isadd
                  ?Container():Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 23),
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: 14),
                            Expanded(
                              child: Center(
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      image: DecorationImage(
                                          image: NetworkImage(model.productData![index]['p_img']),
                                          fit: BoxFit.contain
                                      )
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Container(
                                width: 200,
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
                              child: GestureDetector(
                                onTap: () async {
                                  var response = await networkHandler.get("/product/getProductData/${model.productData![index]['_id']}");
                                  // ModalMentionPost.Dialog_Settings(context);
                                  setState(() {
                                    productModel = ProductModel.fromJson(response["data"]);
                                    isadd = true;
                                    print('Product: '+model.productData![index]['_id']);



                                  });

                                },
                                child: WhiteGreenButton(
                                  text: 'add',
                                  size: 11,
                                ),
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
          ],
        ),
      ),
    );
  }
}


