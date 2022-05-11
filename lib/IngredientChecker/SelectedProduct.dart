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
    calling: '',
    come: '',
    cosing: '',
    detail: '',
    irr: '',
    rate: '',
  );
  // Exfoliant -> Exfoliant
  // Perfuming -> Perfuming
  List Fight_Acne = [];
  List Brightening = [];
  List Moisturizer = [];
  List Soothing = [];
  List UV_Protection = [];
  List Antioxidant = [];
  List Preservation = [];
  List Exfoliant = [];
  List Perfuming = [];
  List Antibacterial = [];
  bool checkFight_Acne = false;
  bool checkBrightening = false;
  bool checkMoisturizer = false;
  bool checkSoothing = false;
  bool checkUV_Protection = false;
  bool checkAntioxidant = false;
  bool checkPreservation = false;
  bool checkExfoliant = false;
  bool checkPerfuming = false;
  bool checkAntibacterial = false;
  bool Loading = false;
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
// anti-acne -> Fight Acne
// skin brightening -> Brightening
// moisturizer/humectant -> Moisturizer
// soothing -> Soothing
// sunscreen -> UV Protection
// antioxidant -> Antioxidant
// preservative -> Preservation
// exfoliant -> Exfoliant
// perfuming -> Perfuming
// antimicrobial/antibacterial -> Antibacterial
    setState(() {
      for(var e in ingInfo){
        print(e.name +' : '+e.func);
        if(e.func=="anti-acne"){
          Fight_Acne.add(e.name);
          checkFight_Acne=true;
        }
        else if(e.func=="skin brightening"){
          Brightening.add(e.name);
          checkBrightening=true;
        }
        else if(e.func=="moisturizer/humectant"){
          Moisturizer.add(e.name);
          checkMoisturizer=true;
        }
        else if(e.func=="soothing"){
          Soothing.add(e.name);
          checkSoothing=true;
        }
        else if(e.func=="sunscreen"){
          UV_Protection.add(e.name);
          checkUV_Protection=true;
        }
        else if(e.func=="antioxidant"){
          Antioxidant.add(e.name);
          checkAntioxidant=true;
        }
        else if(e.func=="preservative"){
          Preservation.add(e.name);
          checkPreservation=true;
        }
        else if(e.func=="exfoliant"){
          Exfoliant.add(e.name);
          checkExfoliant=true;
        }
        else if(e.func=="perfuming"){
          Perfuming.add(e.name);
          checkPerfuming=true;
        }
        else if(e.func=="antimicrobial/antibacterial"){
          Antibacterial.add(e.name);
          checkAntibacterial=true;
        }

      }
      print(Fight_Acne);
      print(Brightening);
      print(Moisturizer);
      print(Soothing);
      print(UV_Protection);
      print(Antioxidant);
      print(Preservation);
      print(Exfoliant);
      print(Perfuming);
      print(Antibacterial);
      Loading = true;
    });


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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Loading?
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Poppins(
              text: "Benefit",
              size: 22,
              color: c.blackMain,
              fontWeight: f.semiBold,
            ),
            SizedBox(height: 15),
            checkFight_Acne?Fight_Acne_Blog():Text('False'),
            checkBrightening?Text('BT'):Text('False'),
            checkMoisturizer?Text('MT'):Text('False'),
            checkSoothing?Text('ST'):Text('False'),
            checkUV_Protection?Text('UV'):Text('False'),
            checkAntioxidant?Text('AX'):Text('False'),
            checkPreservation?Text('PV'):Text('False'),
            checkExfoliant?Text('EF'):Text('False'),
            checkPerfuming?Text('PF'):Text('False'),
            checkAntibacterial?Text('AB'):Text('False'),
          ],
        ):Text('LOADING>>>>'),
      ),
    );
  }

  Widget list_product(String ing) {
    return Container(
        child: Column(
          children: [
            Row(
              children: [
                Inter(text: ing, size: 15, color: Colors.black, fontWeight: f.semiBold),
                Expanded(child: Container()),
                Icon(FeatherIcons.chevronRight , size: 22),
              ],
            ),
            SizedBox(height: 15),
          ],
        )
    );
  }

  Widget Fight_Acne_Blog(){
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 24,bottom: 9),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    height: 35,
                    width: 55,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                            image: AssetImage('assets/IngredientInspect/Fight Acne.png'),
                            fit: BoxFit.contain
                        )
                    ),
                  ),
                ),
                SizedBox(width: 10 ),
                PoppinsLeft_Crop(text: 'Anti Acne', size: 18, color: c.textBlack, fontWeight: f.semiBold),
              ],
            ),
            SizedBox(height: 15),
            Roboto(text: 'Nice ingredients that help you to fight against acne. They are also often antibacterial and/or anti-inflammatory agents.', size: 13, color: c.graySub2, fontWeight: f.regular),
            SizedBox(height: 15),
            // Row(
            //   children: [
            //     Text(Fight_Acne[0]),Text(Fight_Acne[index]),
            //   ],
            // ),
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              removeBottom: true,
              child: ListView.builder(
                itemCount: Fight_Acne.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return list_product(Fight_Acne[index]);
                },
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
    );
  }
}
