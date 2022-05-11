import 'package:Florxy/Model/ingModel.dart';
import 'package:Florxy/NetworkHandler.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../widgets/fontWeight.dart';
import '../widgets/font.dart';
class IngredientInfo extends StatefulWidget {
  const IngredientInfo({Key? key}) : super(key: key);

  @override
  _IngredientInfoState createState() => _IngredientInfoState();
}

class _IngredientInfoState extends State<IngredientInfo> {
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();
  IngModel ingModel = IngModel(
    name: '',
    func: [],
    calling: '',
    come: '',
    cosing: '',
    detail: '',
    irr: '',
    rate: '',
    proof: [],
  );
  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }

  fetchData() async{

    String? SeeInfoIngredient = await storage.read(key: "SeeInfoIngredient");
    print(SeeInfoIngredient);

    var responseData = await networkHandler.get("/product/getIngredientInfoFromName/${SeeInfoIngredient}");
    setState(() {
      ingModel = IngModel.fromJson(responseData["ingredient"]);
      print(ingModel.name);
      print(ingModel.rate);
      print(ingModel.func);
      print(ingModel.cosing);
      print(ingModel.detail);
      print(ingModel.proof);
    });
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
                text: "Ingredient Information",
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

      body: Center(child: Column(
        children: [
          Text('Name: '+ingModel.name),
          Text('Rate: '+ingModel.rate.toString()),
          Text('Func: '+ingModel.func.toString()),
          Text('Cosing: '+ingModel.cosing),
          Text('Detail: '+ingModel.detail),
          Text('Proof: '+ingModel.proof.toString()),
        ],
      )),);
  }
}
