import 'dart:async';
import 'dart:io';

import 'package:Florxy/Model/productModel.dart';
import 'package:Florxy/Model/profileModel.dart';
import 'package:Florxy/NetworkHandler.dart';
import 'package:Florxy/pages/ReviewPost.dart';
import 'package:Florxy/pages/comparepage.dart';
import 'package:Florxy/provider/storage_service.dart';
import 'package:Florxy/widgets/ModalMentionPost.dart';
import 'package:Florxy/widgets/ModalReviewPost.dart';
import 'package:Florxy/widgets/button.dart';
import 'package:boxicons/boxicons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/fontWeight.dart';


class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();

}

class _CreatePostState extends State<CreatePost> {
  final Storage firebase_storage = Storage();
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
  double reciprocal(double d) => 1 / d;
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



  int count = 0;
  List<XFile>? displayimage = [];
  void countimage() {
    if(imageFileList!.length>4){
      count=4;
    }
    else{
      count = imageFileList!.length;
    }
  }

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];
  void selectImages() async {
    final List<XFile>? selectedImages = await
    imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    print("before Image List Length:" + imageFileList!.length.toString());
    int i = imageFileList!.length-1;
    for(imageFileList!.length;imageFileList!.length>4;i--){
      imageFileList!.removeWhere((element) => element.path==imageFileList![i].path);
      print('I: '+i.toString());
    }

    print("after Image List Length:" + imageFileList!.length.toString());
    setState((){});
  }


  // @override
  // void dispose(){
  //   super.dispose();
  //   storage.delete(key: "review-product");
  //   storage.delete(key: "rating");
  //   isadd=false;
  // }
  String? posttype = '';
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
        if (mounted) {
          setState(() {
            myrating = rating.toString();
            isadd = true;
            posttype= 'review';
            productModel = ProductModel.fromJson(response2["data"]);
          });
        }
    }
    }
    var response = await networkHandler.get("/profile/getData");
    if (mounted) {
      setState(() {
        profileModel = ProfileModel.fromJson(response["data"]);
        circular = false;
      });
    }
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
                      List allimage = [];

                      print('\nALL IMAGE lenght : \n');
                      print(allimage.length);
                      print('\nALL ImageFile lenght : \n');
                      print(imageFileList!.length);
                      setState(() {
                        circular = true;
                      });
                      print(profileModel.username);
                      if(_body.text!=""){
                      if (_globalkey.currentState!.validate()) {
                        if (imageFileList != null) {
                          int i =1;
                          for(var image in imageFileList!){
                            print(image.path);

                            final path = image.path;
                            final fileName = DateTime.now().toString()+'_'+profileModel.username+'_'+i.toString()+ '.jpg';
                            firebase_storage.uploadPostImage(path, fileName).then((value) async {
                              print('\nvalue : \n');
                              print(value);
                              allimage.add(value);
                              print('\nALL IMAGE : \n');
                              print(allimage);

                              // var rating = double.parse(myrating);
                              // print('\n myrating\n');
                              // print(rating.runtimeType);
                              Map<String, dynamic> data = {
                                "username":profileModel.username,
                                "body": _body.text,
                                "type": posttype.toString(),
                                "coverImage": allimage,
                                "rating": myrating,
                                "product":productModel.id!,
                              };
                              if(allimage.length == imageFileList!.length){
                                var response = await networkHandler.post2("/home/CreatePost", data);
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
                              }

                            }
                            );
                            i=i+1;
                          }

                        }



                      }
                      // else {
                      //   setState(() {
                      //     circular = false;
                      //   });
                      // }
                      }
                      // else{
                      //   setState(() {
                      //     circular = false;
                      //   });
                      // }

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
                    SizedBox(height: 25,),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 150.0,
                            width: 150.0,
                            child: ListView.builder(
                                itemCount: imageFileList!.length,
                                scrollDirection: Axis.horizontal,
                                // shrinkWrap: true,
                                itemBuilder: (context,int index) {
                                  return Row(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            height: 150,
                                            width: 150,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(12.0),
                                              child: Image.file(File(imageFileList![index].path),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),

                                          Positioned(
                                              top: 12,
                                              right: 12,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(18),
                                                  color: Colors.white,
                                                ),
                                                width: 15,
                                                height: 15,
                                              )
                                          ),
                                          Positioned(
                                            top: 8,
                                            right: 8,
                                            child: IconButton(
                                                onPressed: () {
                                                  setState(()  {
                                                    imageFileList!.removeWhere((element) => element.path==imageFileList![index].path);
                                                  });
                                                },
                                                padding: EdgeInsets.zero,
                                                constraints: BoxConstraints(),
                                                icon: Icon(Boxicons.bxs_x_circle, color: c.blackMain, size: 24)
                                            ),)
                                        ],
                                      ),
                                      SizedBox(width: 15,)
                                    ],
                                  );
                                }),
                          ),
                        ),
                      ],
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
                      isadd?
                      IconButton(
                          onPressed: () {

                          },
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                        icon: Icon(MdiIcons.bullhornVariantOutline, color: c.greySub, size: 22)
                      ):
                      IconButton(
                          onPressed: () {
                            ModalMentionPost.Dialog_Settings(context);
                          },
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          icon: Icon(MdiIcons.bullhornVariantOutline, color: c.greenMain, size: 22)
                      ),
                      SizedBox(width: 25),
                      isadd?
                      IconButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      icon: Icon(MdiIcons.starCircleOutline, color: c.greySub, size: 24)
                      ):IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ReviewPost())).then((value) => fetchData());
                          },
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          icon: Icon(MdiIcons.starCircleOutline, color: c.greenMain, size: 24)
                      ),
                      SizedBox(width: 25),

                      isadd?
                      IconButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          icon: Icon(Boxicons.bx_poll, color: c.greySub, size: 26)
                      ):IconButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          icon: Icon(Boxicons.bx_poll, color: c.greenMain, size: 26)
                      ),
                      SizedBox(width: 25),
                      IconButton(
                          onPressed: () {
                            selectImages();
                            print('hi image');
                          },
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
