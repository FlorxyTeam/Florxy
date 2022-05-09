import 'dart:io';
import 'package:Florxy/Model/profileModel.dart';
import 'package:Florxy/NetworkHandler.dart';
import 'package:Florxy/pages/Loadingscreen.dart';
import 'package:Florxy/pages/loading_request.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'aliaspage.dart';

import 'package:Florxy/provider/storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;


class requestproduct extends StatefulWidget {
  const requestproduct({Key? key}) : super(key: key);

  @override
  _requestproductState createState() => _requestproductState();
}

class _requestproductState extends State<requestproduct> {
  final Storage firebase_storage = Storage();
  bool circular = false;
  bool check = false;
  String? errorfnText;
  String? errorunText;
  List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
  ];
  bool validate = false;
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();
  final _globalkey = GlobalKey<FormState>();
  TextEditingController _productname = TextEditingController();
  TextEditingController _productbrand = TextEditingController();
  TextEditingController _productingredient = TextEditingController();

  File? image;
  @override
  void initState() {
    _focusNodes.forEach((node){
      node.addListener(() {
        setState(() {});
      });
    });
    // TODO: implement initState
    super.initState();


    fetchData();
  }
  void fetchData() async{
    setState(() {
      circular = false;
    });
  }

  Future takePhoto(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
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
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(26),
                )),
            title: Padding(
              padding: const EdgeInsets.only(top: 18.5, left: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back_ios_new_rounded),
                      color: c.blackMain,
                      iconSize: 27,
                      onPressed: () => Navigator.of(context).pop()
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Inter(
                        text: "Create New Product",
                        size: 20,
                        color: c.blackMain,
                        fontWeight: f.semiBold),
                  ),
                  Expanded(child: Container()),

                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        // resizeToAvoidBottomInset: true,

        child: Center(
          child: Form(
            key: _globalkey,
            child: ListView(
              padding: const EdgeInsets.all(30.0),
              children: <Widget>[

                Inter(
                  text: "Product Info",
                  color: c.blackMain,
                  size: 16,
                  fontWeight: f.semiBold,
                ),

               SizedBox(
                  height: 30,
                ),
                ProductnameTextField(),
                SizedBox(
                  height: 20,
                ),
                ProductbrandTextField(),
                SizedBox(
                  height: 30,
                ),
                imageProfile(),
                SizedBox(
                  height: 20,
                ),
                // ProductIngredientTextField(),
                SizedBox(
                  height: 50,
                ),

               _productbrand.text.isNotEmpty && _productname.text.isNotEmpty && image != null ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        color: c.greenMain,
                        height: 50,
                        onPressed: () async {
                         setState(() {
                           circular = true;
                         });

                         if(_globalkey.currentState!.validate()){
                           final path = image?.path;
                           final fileName = DateTime.now().toString()+'_'+_productname.text+'.jpg';
                           firebase_storage.uploadRequestImage(path!, fileName).then((value) async{
                             Map<String, String> data = {
                               "p_name": _productname.text,
                               "p_brand": _productbrand.text,
                               "ing_name": _productingredient.text,
                               "p_img": value,

                             };
                             if(image != null){
                               var response = await networkHandler.post2("/product/request", data);
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
                               Navigator.pushAndRemoveUntil(context, MaterialPageRoute
                                 (builder: (context)=>Loading_Request()), (route) => false);
                             }
                           });

                         }

                        },

                        child: Inter(
                          text: "Add new product!",
                          size: 15,
                          color: c.textWhite,
                          fontWeight: f.bold,
                        )),
                  ],
                ) : Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   FlatButton(
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(25.0),
                       ),
                       color: c.greyMain,
                       height: 50,
                       onPressed: () {
                       },

                       child: Inter(
                         text: "Add new product!",
                         size: 15,
                         color: c.textWhite,
                         fontWeight: f.bold,
                       )),
                 ],
               )
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget imageProfile() {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom!= 0;
    return Center(
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 0, right: 25, top: 10),
            child:
            Poppins(
                text: 'Product Image', size: 14, color: c.blackSub, fontWeight: f.medium),
          ),
          Padding(
            padding: EdgeInsets.only(right: 0),
            child: Align(
              alignment: Alignment.topRight,
              child:
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: c.greyLight,
                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.0))),
                        actions: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 7),
                            child: Column(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                              width: 0.8,
                                              color: c.greyMain.withOpacity(0.5)),

                                        )),
                                    child: ListTile(
                                        onTap: () async {
                                          Future.delayed(Duration(seconds: 5));
                                          Navigator.of(context).pop();
                                          await takePhoto(ImageSource.camera);
                                        },
                                        title: Inter(
                                          text: "Take photo",
                                          color: c.blackMain,
                                          size: 14,
                                          fontWeight: f.medium,
                                        ))),
                                Container(
                                    child: ListTile(
                                      onTap: () async {
                                        Future.delayed(Duration(seconds: 5));
                                        Navigator.of(context).pop();
                                        await takePhoto(ImageSource.gallery);
                                      },
                                      title: Inter(
                                        text: "Choose existing photo",
                                        color: c.blackMain,
                                        size: 14,
                                        fontWeight: f.medium,
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: Icon(Boxicons.bx_camera),
                  iconSize: 30,),
              ),
            ),
          ),
           Padding(
            padding: EdgeInsets.only(left: 25, right: 25, top: 70),
            child:
            Container(
                child: image == null ? Padding(
                  padding: const EdgeInsets.only(bottom: 160),
                  child: Container(

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(13.0)),
                    ),
                  ),
                ) :  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(13.0)),
                    child: Image.file(
                      image!,
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
            ),


        ],
      ),
    );
  }

  //Product Name
  Widget ProductnameTextField() {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Poppins(
              text: 'Product Name', size: 14, color: c.blackSub, fontWeight: f.medium),
        ),
        SizedBox(height: 5),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(13.0)),
          ),
          child: TextFormField(
            focusNode: _focusNodes[0],
            controller: _productname,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              errorText: validate ? null : errorunText,
              border: OutlineInputBorder(),

              hintStyle: TextStyle(fontSize: 15, color: c.greyMain),
              labelStyle: TextStyle(fontSize: 15, color: _focusNodes[0].hasFocus ? c.greenMain : c.greyMain),
              enabledBorder: myinputborder(),
              focusedBorder: myfocusborder(),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: c.redMain, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(13.0)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                gapPadding: 6,
                borderSide: BorderSide(color: c.redMain, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(13.0)),
              ),
            ),
            autofocus: false,
          ),
        ),
      ],
    );
  }
  Widget ProductbrandTextField() {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Poppins(
              text: 'Product Brand', size: 14, color: c.blackSub, fontWeight: f.medium),
        ),
        SizedBox(height: 5),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(13.0)),
          ),
          child: TextFormField(
            focusNode: _focusNodes[1],
            controller: _productbrand,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              errorText: validate ? null : errorunText,
              border: OutlineInputBorder(),

              hintStyle: TextStyle(fontSize: 15, color: c.greyMain),
              labelStyle: TextStyle(fontSize: 15, color: _focusNodes[1].hasFocus ? c.greenMain : c.greyMain),
              enabledBorder: myinputborder(),
              focusedBorder: myfocusborder(),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: c.redMain, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(13.0)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                gapPadding: 6,
                borderSide: BorderSide(color: c.redMain, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(13.0)),
              ),
            ),
            autofocus: false,
          ),
        ),
      ],
    );
  }
  Widget ProductIngredientTextField() {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Poppins(
              text: 'Product Ingredient', size: 14, color: c.blackSub, fontWeight: f.medium),
        ),
        SizedBox(height: 5),
        Container(
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(13.0)),
          ),
          child: TextFormField(
              controller: _productingredient,
              maxLines: 4,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                    fontSize: 14, color: c.graySub2, fontWeight: f.medium),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                  borderSide:
                  BorderSide(color: c.graySub2.withOpacity(0), width: 2),
                ),
                prefixText: '---',
                prefixStyle: TextStyle(color: Colors.transparent),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                  borderSide: BorderSide(color: c.greenMain, width: 2),
                ),
              )),
        ),
      ],
    );
  }

  OutlineInputBorder myinputborder(){ //return type is OutlineInputBorder
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(13),
        borderSide: BorderSide(
          color:c.greySub,
          width: 2,
        )
    );
  }

  OutlineInputBorder myfocusborder(){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(13),
        borderSide: BorderSide(
          color:c.greenMain,
          width: 2,
        )
    );}


  checkUsername_Fullname() async{
    if (_productname.text.isEmpty && _productbrand.text.isEmpty) {
      setState(() {
        // circular=false;
        validate = false;
        errorunText = "Product Name can't be empty!";
        errorfnText = "Product Brand can't be empty!";
        print("hi");
      });
    }
    else {
      if (_productname.text.isEmpty){
        errorfnText = "Product Name can't be empty!";
        validate = false;

      }else{
        if (_productbrand.text.isEmpty){
          errorfnText=null;
          errorunText = "Product Brand can't be empty!";
          validate = false;
        }

      }
    }
  }


}


