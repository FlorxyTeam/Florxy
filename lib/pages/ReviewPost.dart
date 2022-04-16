import 'package:Florxy/Model/productModel.dart';
import 'package:Florxy/NetworkHandler.dart';
import 'package:Florxy/pages/CreatePost.dart';
import 'package:Florxy/pages/LoginPage.dart';
import 'package:Florxy/pages/navbar.dart';
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
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:Florxy/pages/CreatePost.dart';
import '../postProvider.dart';

Widget buildSearch() => SearchMentionPost(
  text: '',
  hintText: "Search product to review",
  onChanged: (String value) {  },
);

class ReviewPost extends StatefulWidget {
  ReviewPost({Key? key}) : super(key: key);

  @override
  _ReviewPostState createState() => _ReviewPostState();
}

class _ReviewPostState extends State<ReviewPost> {

  final storage = new FlutterSecureStorage();
  bool isadd = false;
  final networkHandler = NetworkHandler();


  @override
  void initState() {
    // TODO: implement initState
    Provider.of<PostProvider>(context,listen: false).fetchMentionProduct();
    super.initState();
  }

  ProductModel productModel = ProductModel(
    id: '',
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                isadd
                    ?Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18, right: 18),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
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
                        ),
                        Poppins(text: 'Add Review', color: c.blackMain,fontWeight: f.semiBold,size: 17),
                      ],
                    ),
                  ),):Padding(
                    padding: const EdgeInsets.only(left: 23, right: 23),
                    child: buildSearch(),
                  ),
                SizedBox(height: 15),
                isadd
                    ?Container(child:
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // SizedBox(width: 14),
                            Center(
                              child: Container(
                                height: 100,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    image: DecorationImage(
                                        image: NetworkImage(productModel.p_img),
                                        fit: BoxFit.contain
                                    )
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 0,right: 20),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 8),
                                          child: PoppinsLeft(text: productModel.p_brand, size: 13, color: Colors.white, fontWeight: f.semiBold),
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: c.greySub
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      PoppinsLeft(text: productModel.p_name.toString(), size: 14, color: c.textBlack, fontWeight: f.semiBold),
                                      SizedBox(height: 15),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Roboto(text: productModel.p_desc.toString(), size: 13, color: c.graySub2, fontWeight: f.regular),
                      ),
                      SizedBox(height: 20),
                      Divider(
                        color: c.greyMain,
                        thickness: 0.5,
                        height: 0,
                      ),
                      SizedBox(height: 15),
                      Inter(text: 'your overall rating of this product', size: 13, color: Color(0xFF828282), fontWeight: f.semiBold),
                      SizedBox(height: 15),
                      RatingBar.builder(
                        unratedColor: c.greySub,
                        glow: false,
                        initialRating: 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color:Color(0xFFFFC107)
                        ),
                        onRatingUpdate: (rating) async{
                          print('Rating: '+rating.toString());
                          await storage.write(key: "rating", value: rating.toString());
                          String? myrating = await storage.read(key: "rating");
                          print('myRating: '+myrating.toString());
                        },
                      ),

                      SizedBox(height: 15),

                      Divider(
                        color: c.greyMain,
                        thickness: 0.5,
                        height: 0,
                      ),
                      SizedBox(height: 15),
                      // Expanded(child: Container()),
                      // SizedBox(height: MediaQuery.of(context).size.height-510,),
                      // Align(
                      //   alignment: Alignment.bottomCenter,
                      //   child: Container(
                      //     width: MediaQuery.of(context).size.width,
                      //     child: Padding(
                      //       padding: EdgeInsets.only(left: 45,right: 45),
                      //       child: GestureDetector(
                      //         onTap: () async{
                      //           String? myrating = await storage.read(key: "rating");
                      //           print('myRating: '+myrating.toString());
                      //           if(myrating == null){
                      //             print('hi');
                      //           }else{
                      //             await storage.write(key: "review-product", value: productModel.id);
                      //             String? mypro = await storage.read(key: "review-product");
                      //             print(mypro);
                      //             Navigator.of(context).pop();
                      //           }
                      //         },
                      //         child: GreenButton(
                      //           text: 'SUBMIT REVIEW',
                      //           size: 16,
                      //           color: c.textWhite,
                      //           height: 60,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),

                ):Padding(
                  padding: const EdgeInsets.only(left: 23),
                  child: Poppins(text: 'Top Review', size: 20, color: c.textBlack, fontWeight: f.semiBold),
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
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20),
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
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: GestureDetector(
                                      onTap: () async {
                                        var response = await networkHandler.get("/product/getProductData/${model.productData![index]['_id']}");
                                        print('heresss');
                                        print(response);

                                        // ModalMentionPost.Dialog_Settings(context);
                                        setState(() {
                                          productModel = ProductModel.fromJson(response["data"]);
                                          storage.delete(key: "rating");
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
            isadd?Positioned(
              bottom: 10,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.only(left: 45,right: 45),
                  child: GestureDetector(
                    onTap: () async{
                      String? myrating = await storage.read(key: "rating");
                      print('myRating: '+myrating.toString());
                      if(myrating == null){
                        print('hi');
                      }else{
                        await storage.write(key: "review-product", value: productModel.id);
                        String? mypro = await storage.read(key: "review-product");
                        print(mypro);
                        Navigator.of(context).pop();
                      }
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
            ):Container()
          ],
        ),
      ),
    );
  }
}