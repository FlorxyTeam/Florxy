import 'package:Florxy/CompareProduct/searchProduct.dart';
import 'package:Florxy/IngredientChecker/IngredientChecker.dart';
import 'package:Florxy/Model/brands.dart';
import 'package:Florxy/Model/ingModel.dart';
import 'package:Florxy/Model/pro2.dart';
import 'package:Florxy/SilimarProduct/similarproduct.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:boxicons/boxicons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import '../Model/profileModel.dart';
import '../NetworkHandler.dart';
import 'package:Florxy/Model/productModel.dart';
import 'package:Florxy/pages/comparepage.dart';

import '../postProvider.dart';
import '../widgets/PostWidget.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';



class ProductOverview extends StatefulWidget {
  String? id;
  ProductOverview({Key? key, this.id}) : super(key: key);


  @override
  _ProductOverviewState createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  String? id_product;
  bool isSave = false;
  List saveproduct = [];
  List save = [];
  Map? data;
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();
  ProModel productModel = ProModel(
    id:'',
    p_name:'',
    p_brand: '',
    p_desc: '',
    p_img: '',
    ing_id: [],
    p_cate: '',
    rating: 0,
    numReview: 0,
  );

  ProfileModel myprofileModel = ProfileModel(
    id: '',
    username: '',
    fullname: '',
    DOB: '',
    professor: '',
    influencer: '',
    bio: '',
    img: '',
    pinned: '',
    notification: [],
    saveproduct: [],
    favorite: [],
    listfollower: [],
    listfollowing: [],
  );

  BrandModel brand = BrandModel(
      id:'' ,
      name: '',
      owners: [],
      about: '',
      banner: '',
      recommend: []
  );

  IngModel ingModel = IngModel(
    name: '',
    func: [],
    calling: '',
    come: '',
    cosing: '',
    detail: '',
    irr: '',
    rate: '', proof: [],
  );



  void fetchData() async {
    var id = await storage.read(key: "p_id");
    var username = await storage.read(key: "username");
    var response = await networkHandler.get("/product/" + widget.id!);
    var response2 = await networkHandler.get("/product/view/productoverview/" + username!);

    setState(() {
      productModel = ProModel.fromJson(response["data"]);
      myprofileModel = ProfileModel.fromJson(response2["data"]);

    });
    save = myprofileModel.saveproduct;
    var i = 0;
    for(i; i < save.length; i++){
      print(save[i]);
      if(productModel.id == save[i]){
        setState(() {
          isSave = true;
        });
      }
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<PostProvider>(context, listen: false).fetchInteresting();
    fetchData();

  }





  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: SpeedDial(
        backgroundColor: c.greenMain,
        icon: Icons.close_rounded,
        overlayColor: Colors.black,
        overlayOpacity: 0.4,
        children: [
          SpeedDialChild(
            child: Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/img/check-list.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            label: "Ingredient Checker",
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => IngredientChecker()));
            }
          ),
          SpeedDialChild(
            child: Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/img/ab-testing.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
              label: "Product Compare",
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchToCompare()));
              }
          ),
          SpeedDialChild(
              label: "Similar Product",
            child: Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                  AssetImage("assets/img/opacity.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SimilarProduct()));
              }

          )
        ],
      ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Container(
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          child: Icon(Icons.arrow_back_ios_new_rounded,
                            color:c.blackMain,
                            size: 27,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.29,
                        width: MediaQuery.of(context).size.width/2,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:  NetworkImage(productModel.p_img),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20,right: 5),
                      child: Container(
                        child: InkWell(
                          onTap: (){
                            Provider.of<PostProvider>(context, listen: false).fetchCompare3();
                          },
                          child: Icon(Boxicons
                              .bx_dots_vertical_rounded,
                            color:c.textWhite,
                            size: 27,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    // height: MediaQuery.of(context).size.height/2.97,
                    width:  MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: c.shadow.withOpacity(0.32),
                          spreadRadius: -17,
                          blurRadius: 30,
                          offset: Offset(0, 6), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25, top: 25,right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              productModel.p_cate != ''?
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 10, top: 5, bottom: 5),
                                  child: Inter(
                                      text: productModel.p_cate! ,
                                      size: 13,
                                      color: Colors.white,
                                      fontWeight: f.semiBold),
                                ),
                                decoration: BoxDecoration(
                                    color: Color(0xFFB3E697),
                                    borderRadius: BorderRadius.circular(50)),
                              ):Container(),
                              // Row(
                              //   children: [
                              //     Icon(
                              //
                              //       Icons.remove_red_eye_outlined,
                              //       color:Color(0xFF97AFA2),
                              //       size: 16.0,
                              //     ),
                              //     SizedBox(width: 2,),
                              //     // Roboto(
                              //     //     text: "2500 Views this product",
                              //     //     size: 11,
                              //     //     color: Color(0xFF97AFA2),
                              //     //     fontWeight: f.medium),
                              //   ],
                              // ),
                              if(isSave == false)InkWell(
                                onTap: () async {
                                  Map<String, String> data = {
                                    "saveproduct": productModel.id!
                                  };
                                  var idStorage = await storage.read(key: 'id');
                                  await networkHandler.post("/product/save/" + idStorage!, data);
                                  setState(() {
                                    isSave = true;
                                  });
                                },
                                child: Icon(Icons.bookmark_outline_rounded,
                                  color:c.greyMain,
                                  size: 27,

                                ),
                              ),if(isSave == true)InkWell(
                                onTap: () async {
                                  Map<String, String> data = {
                                    "saveproduct": productModel.id!
                                  };
                                  var idStorage = await storage.read(key: 'id');
                                  await networkHandler.post("/product/unsave/" + idStorage!, data);
                                  setState(() {
                                    isSave = false;
                                  });
                                },
                                child: Icon(Icons.bookmark_rounded,
                                  color:Color(0xFF32A060),
                                  size: 27,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 11, left: 25, right:8),
                          child: Text(productModel.p_name,textAlign: TextAlign.left, style: GoogleFonts.poppins(
                              color: Color(0xFF053118), fontWeight: f.semiBold,fontSize: 19
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25, right: 8,top: 5),
                          child: Inter(
                              text: productModel.p_desc,

                              size: 14,
                              color: Color(0xFF053118).withOpacity(0.68),
                              fontWeight: f.regular),
                        ),
                        productModel.rating != 0 ?
                        Padding(
                          padding: const EdgeInsets.only(left: 25, top: 5),
                          child: Row(
                            children: [
                              RatingBarIndicator(
                                rating: productModel.rating.toDouble(),
                                itemBuilder: (context, index) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 30.0,
                                direction: Axis.horizontal,
                                unratedColor:
                                Colors.amber.withOpacity(0.31),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 2, left: 6),
                                child: Roboto(
                                    text: (productModel.rating).toDouble().toString(),
                                    size: 16,
                                    color: Color(0xFFFFC107),
                                    fontWeight: f.semiBold),
                              ),
                            ],
                          ),
                        ):Padding(
                          padding: const EdgeInsets.only(left: 20, top: 5),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 2, left: 4),
                            child: Roboto(
                                text: "No review",
                                size: 16,
                                color: Color(0xFFFFC107),
                                fontWeight: f.semiBold),
                          ),
                        ),
                        SizedBox(height: 20),


                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20,left: 29, right: 20),
                  // height: MediaQuery.of(context).size.height/2.97,
                  width:  MediaQuery.of(context).size.width/1.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: c.shadow.withOpacity(0.32),
                        spreadRadius: -17,
                        blurRadius: 30,
                        offset: Offset(0, 6), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 17),
                        child: Row(

                          children: [
                            Icon(Boxicons.bxs_detail,
                              color: Color(0xFF32A060),
                              size: 25,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Inter(
                                text: "Key Ingredient",
                                size: 20,
                                color: Color(0xFF053118),
                                fontWeight: f.semiBold),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 17, bottom: 7),
                        child: RichText(
                          text: TextSpan(

                            children: <TextSpan>[
                              TextSpan(
                                text: "Antioxidant : ",
                                style: GoogleFonts.roboto(
                                    color: Color(0xFF053118).withOpacity(0.68), fontWeight: f.medium,fontSize: 15
                                ),
                              ),
                              TextSpan(
                                text: "Panax Ginseng Root Extract\n",
                                style: GoogleFonts.roboto(
                                    color: Color(0xFF9D9D9D), fontWeight: f.regular,fontSize: 15
                                ),
                              ),
                              TextSpan(
                                text: "Exfoliant : ",
                                style: GoogleFonts.roboto(
                                    color: Color(0xFF053118).withOpacity(0.68), fontWeight: f.medium,fontSize: 15
                                ),
                              ),
                              TextSpan(
                                text: "Glycolic Acid\n",
                                style: GoogleFonts.roboto(
                                    color: Color(0xFF9D9D9D), fontWeight: f.regular,fontSize: 15
                                ),
                              ),
                              TextSpan(
                                text: "Skin-identical ingredient : ",
                                style: GoogleFonts.roboto(
                                    color: Color(0xFF053118).withOpacity(0.68), fontWeight: f.medium,fontSize: 15
                                ),
                              ),
                              TextSpan(
                                text: "Glycerin, Urea, Alanine, Aspartic Acid\n",
                                style: GoogleFonts.roboto(
                                    color: Color(0xFF9D9D9D), fontWeight: f.regular,fontSize: 15
                                ),
                              ),
                              TextSpan(
                                text: "Soothing : ",
                                style: GoogleFonts.roboto(
                                    color: Color(0xFF053118).withOpacity(0.68), fontWeight: f.medium,fontSize: 15
                                ),
                              ),
                              TextSpan(
                                text: "Aloe Barbadensis Leaf Juice, Hamamelis Virginiana (Witch Hazel) Leaf Extract, Aesculus Hippocastanum (Horse Chestnut) Seed Extract, Sucrose\n",
                                style: GoogleFonts.roboto(
                                    color: Color(0xFF9D9D9D), fontWeight: f.regular,fontSize: 15
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
                  child: Poppins(text: "Interesting Review", size: 22,  color: Color(0xFF053118), fontWeight: f.semiBold),
                ),
                Consumer<PostProvider>(
                    builder: (context, model, _) => FutureBuilder(
                      future: model.fetchInteresting(),
                      builder: (context, snapshot) => MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        removeBottom: true,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: model.interestingreview?.length ?? 0,
                          itemBuilder: (context, int index) {
                            return model.interestingreview![index]['type'] == 'review'?ReviewPost(
                              username: model.interestingreview![index]['username'],
                              postTime: model.interestingreview![index]['updatedAt']
                                  .toString()
                                  .substring(0, 10),
                              urlImage: model.interestingreview![index]['coverImage'],
                              post: model.interestingreview![index]['body'],
                              rating: model.interestingreview![index]['rating'],
                              comment: 0,
                              id: model.interestingreview![index]['_id'],
                            ):Container();
                          },
                        ),
                      ),
                    )),



                SizedBox(
                  height:MediaQuery.of(context).size.height/6.5,
                )
              ],
            ),
          ),

        )

    );
  }
}
