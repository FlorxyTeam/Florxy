import 'dart:async';

import 'package:Florxy/IngredientChecker/IngClass.dart';
import 'package:Florxy/Model/ingModel.dart';
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

class SelectedProduct extends StatefulWidget {
  const SelectedProduct({Key? key}) : super(key: key);

  @override
  _SelectedProductState createState() => _SelectedProductState();
}

class _SelectedProductState extends State<SelectedProduct> {
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();
  String query = '';
  int num_products=0;
  List products = [];
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

  IngModel ingModel = IngModel(
    name: '',
    func: [],
  );

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await init();
      setState(() { });
    });
    super.initState();
  }


  List all_ing= [];
  List<IngInfo> ingInfo = [];

  Future init() async {
    String? SimilarProductID = await storage.read(key: "similarproductID");
    print('Similar Cate:'+SimilarProductID.toString());
    var response = await networkHandler.get("/home/getProductInfo/$SimilarProductID");
    setState((){
      productModel = ProductModel.fromJson(response["product"]);
      int i=0;
      for(i;i<productModel.ing_id!.length;i++){
        if(productModel.ing_id![i]==null){
        }
        else{
          all_ing.add(productModel.ing_id![i]);
        }
      }


    });

    int j =0;
    for(j;j<all_ing.length;j++){
      var response2 = await networkHandler.get("/product/getIngredientInfo/${all_ing[j]}");
      print('No$j: '+all_ing[j]);
      setState(() {
        ingModel = IngModel.fromJson(response2["ingredient"]);
        print(ingModel.name);
        int k =0;
        for(k;k<ingModel.func.length;k++){
          ingInfo.add(IngInfo(name: ingModel.name,func: ingModel.func[k]));
          print(ingModel.func[k]);
        }
      });
    }
    int z= 0;

    List functi = [];
    for(var e in ingInfo){
      print(e.name +' : '+e.func);
    }


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
      body: Text('hi'),
    );
  }
}
