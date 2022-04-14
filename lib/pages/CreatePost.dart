import 'dart:async';

import 'package:Florxy/Model/productModel.dart';
import 'package:Florxy/Model/profileModel.dart';
import 'package:Florxy/NetworkHandler.dart';
import 'package:Florxy/pages/comparepage.dart';
import 'package:Florxy/widgets/ModalMentionPost.dart';
import 'package:Florxy/widgets/ModalReviewPost.dart';
import 'package:Florxy/widgets/button.dart';
import 'package:boxicons/boxicons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/fontWeight.dart';


class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();

}

class _CreatePostState extends State<CreatePost> {
  bool checking =true;
  bool isadd = false;
  bool check() {

    if(_body.text == ""){
      setState(() {
        print("its true");
        checking=false;

      });
      return checking;
    }

    else {
      setState(() {
        print("its false");
        checking=false;

      });
      return checking;
    }
  }
  bool circular = false;
  final networkHandler = NetworkHandler();
  final _globalkey = GlobalKey<FormState>();
  TextEditingController _body = TextEditingController();
  TextEditingController _forwho = TextEditingController();
  TextEditingController _type = TextEditingController();
  final storage = new FlutterSecureStorage();

  ProfileModel profileModel = ProfileModel(
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

  String myrating = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchData();
  }
  // @override
  // void dispose(){
  //   super.dispose();
  //   storage.delete(key: "review-product");
  //   storage.delete(key: "rating");
  //   isadd=false;
  // }
  void fetchData() async{
    String? myproduct = await storage.read(key: "review-product");
    print(myproduct);
    if(myproduct == null){
      print('its null');
    }else{
      var response2 = await networkHandler.get("/product/getProductData/${myproduct}");
      String? rating = await storage.read(key: "rating");
      print(rating);
      if(rating != null){
        setState(() {
          myrating = rating.toString();
          isadd=true;
        });
        setState(() {
          productModel = ProductModel.fromJson(response2["data"]);
        });
    }
    }
    var response = await networkHandler.get("/profile/getData");
    setState(() {
      profileModel = ProfileModel.fromJson(response["data"]);
      circular = false;
    });
  }
  void refreshData() async{
    String? myproduct = await storage.read(key: "review-product");
    print(myproduct);
    var response2 = await networkHandler.get("/product/getProductData/${myproduct}");
    String? rating = await storage.read(key: "review-product");
    print(rating);
    setState(() {
      productModel = ProductModel.fromJson(response2["data"]);
    });
  }

  FutureOr onGoBack() {
    print('OnGoBack fine');
    refreshData();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Theme.of(context).platform==TargetPlatform.android?75:66.0),
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
            backgroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(26),
                )),
            leading: Padding(
              padding: EdgeInsets.only(top: Theme.of(context).platform==TargetPlatform.android?17.5:0, left: 13),
              child: IconButton(
                icon: Icon(FeatherIcons.chevronLeft),
                iconSize: 34,
                color: Colors.black,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            actions: [
              (check()) ?
              Padding(
                padding: EdgeInsets.only(top: Theme.of(context).platform==TargetPlatform.android?27:12, right: 30, bottom: Theme.of(context).platform==TargetPlatform.android?0:12),
                child: InkWell(
                  onTap: () {
                      setState(() {
                        circular=false;
                      });
                  },
                  child:
                  circular?
                  Center(child: CircularProgressIndicator(),):GreyButton(
                    text: 'POST',
                    size: 12,
                    color: Colors.white,
                    width: 60,
                  ),
                )
              ):Padding(
                  padding: EdgeInsets.only(top: Theme.of(context).platform==TargetPlatform.android?27:12, right: 30, bottom: Theme.of(context).platform==TargetPlatform.android?0:12),
                  child: InkWell(
                    onTap: () async {
                      setState(() {
                        circular = true;
                      });
                      print(profileModel.username);
                      print(profileModel.fullname);

                      if(_body.text!=""){
                      if (_globalkey.currentState!.validate()) {
                        Map<String, String> data = {
                          "username":profileModel.username,
                          "fullname":profileModel.fullname,
                          "type": "post",
                          "body": _body.text,
                          "forwho":"Everyone"
                        };
                        var response =
                        await networkHandler.post("/home/Add", data);
                        if (response.statusCode == 200 ||
                            response.statusCode == 201) {
                          setState(() {
                            circular = false;
                          });
                          Navigator.of(context).pop();
                        }else{
                          setState(() {
                            circular = false;
                          });
                        }
                        // if (response.statusCode == 200 ||
                        //     response.statusCode == 201) {
                        //   if (image != null) {
                        //     var imageResponse = await networkHandler.patchImage(
                        //         "/blogPost/add/postImage/:id", image!.path);
                        //     if (imageResponse.statusCode == 200 ||
                        //         imageResponse.statusCode == 201) {
                        //       setState(() {
                        //         circular = false;
                        //       });
                        //       Navigator.of(context).pop();
                        //     }else {
                        //       setState(() {
                        //         circular = false;
                        //       });
                        //     }
                        //
                        //   } else {
                        //     setState(() {
                        //       circular = false;
                        //     });
                        //     Navigator.of(context).pop();
                        //   }
                        // }else {
                        //   setState(() {
                        //     circular = false;
                        //   });
                        // }
                      }
                      else {
                        setState(() {
                          circular = false;
                        });
                      }
                      }
                      else{
                        setState(() {
                          circular = false;
                        });
                      }

                    },
                    child: circular?
                    Center(child: CircularProgressIndicator(),):GreenButton(
                      text: 'POST',
                      size: 12,
                      color: Colors.white,
                      width: 60,
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
      body: Form(
        key: _globalkey,
        child: Stack(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 16, left: 28, right: 28),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFE5E5E5)
                            ),
                            width: 56,
                            height: 56,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: CachedNetworkImage(imageUrl: profileModel.img,fit: BoxFit.cover,errorWidget: (context, url, error) => Container(),),
                            )
                        ),
                        SizedBox( width: 8 ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Poppins(
                              text: profileModel.fullname,
                              fontWeight: f.semiBold,
                              size: 14,
                              color: Colors.black,
                            ),
                            Inter(text: '@'+profileModel.username, size: 12, color: c.textUsername, fontWeight: f.medium)
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: _body,
                      maxLines: null ,
                      autofocus:true,
                      decoration: InputDecoration.collapsed(
                        hintText: "What’s on your mind?",
                        hintStyle: GoogleFonts.inter(
                          textStyle: TextStyle(fontSize: 14, color: c.blackSub2, fontWeight: f.semiBold)
                        )
                      ),
                    ),
                  ],
                ),
              ),
            ),

            isadd?
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Container(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.only(left: 28, right: 28),
                  child: Row(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 1,bottom: 2,left: 4,right: 6),
                          child: Row(
                            children: [
                              Inter(
                                text: 'review to',
                                fontWeight: f.semiBold,
                                size: 14,
                                color: c.blackMain,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 25),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 9, right: 4,top: 2.5,bottom: 2.5),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => comparepage(id: '${productModel.id}', currentState: 0)));
                            },
                            child: Row(
                              children: [
                                Container(
                                  constraints: BoxConstraints(maxWidth: 125),
                                  child: Inter_Crop(
                                      text: '${productModel.p_brand}' + " " + '${productModel.p_name}',
                                      size: 10,
                                      color: c.tag,
                                      fontWeight: f.semiBold
                                  ),
                                ),
                                SizedBox(width: 7),

                                Inter(
                                    text: myrating,
                                    size: 10,
                                    color: c.tag,
                                    fontWeight: f.semiBold
                                ),
                                SizedBox(width: 2),
                                Icon(Boxicons.bxs_star, size: 13, color: c.tag),
                                SizedBox(width: 4),
                                Icon(FeatherIcons.chevronRight, size: 14, color: c.tag),
                              ],
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: c.greenLight2,
                            borderRadius: BorderRadius.circular(10)),
                      ),


                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            setState(()  {
                               storage.delete(key: "review-product");
                               storage.delete(key: "rating");
                              isadd=false;
                            });
                          },
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          icon: Icon(FeatherIcons.x, color: c.blackMain, size: 24)
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: c.shadow.withOpacity(0.09),
                      spreadRadius: -27,
                      blurRadius: 43,
                      offset: Offset(1, 1), // changes position of shadow
                    ),
                  ],
                ),
              ),
            ):Container(),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.only(left: 28, right: 28),
                  child: Row(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 1,bottom: 2,left: 4,right: 6),
                          child: Row(
                            children: [
                              Icon(Boxicons.bx_world, size: 23, color: c.greenSub1),
                              SizedBox(width: 2),
                              Inter(
                                text: 'Everyone',
                                fontWeight: f.bold,
                                size: 11,
                                color: c.greenSub1,
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            width: 2,
                            color: c.greenSub1
                          )
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            ModalMentionPost.Dialog_Settings(context);
                          },
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                        icon: Icon(MdiIcons.bullhornVariantOutline, color: c.greenMain, size: 22)
                      ),
                      SizedBox(width: 25),
                      IconButton(
                          onPressed: () {
                            bool shouldRefresh = ModalReviewPost.Dialog_Settings(context);
                            print(shouldRefresh);
                            if(shouldRefresh != null && shouldRefresh){
                              print('it should refresh' + shouldRefresh.toString());
                            }
                          },
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          icon: Icon(MdiIcons.starCircleOutline, color: c.greenMain, size: 24)
                      ),
                      SizedBox(width: 25),
                      IconButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          icon: Icon(Boxicons.bx_poll, color: c.greenMain, size: 26)
                      ),
                      SizedBox(width: 25),
                      IconButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          icon: Icon(FeatherIcons.image, color: c.greenMain, size: 22)
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: c.shadow.withOpacity(0.09),
                      spreadRadius: -27,
                      blurRadius: 43,
                      offset: Offset(1, 1), // changes position of shadow
                    ),
                  ],
                ),
              ),
            ),
            isadd?
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Divider(
                color: c.greyMain,
                thickness: 0.5,
                height: 0,
              ),
            ):Container(),
          ],

        ),
      ),
    );
  }
}
