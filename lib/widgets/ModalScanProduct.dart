import 'package:Florxy/Model/productModel.dart';
import 'package:Florxy/pages/LoginPage.dart';
import 'package:Florxy/pages/searchpage.dart';
import 'package:Florxy/widgets/SearchMentionPostWidget.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:Florxy/widgets/productWidget.dart';
import 'package:flappy_search_bar_ns/flappy_search_bar_ns.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/scrapper/incidecoder.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../NetworkHandler.dart';
import '../pages/comparepage.dart';
import '../postProvider.dart';
import 'button.dart';

class ModalScanProduct {
  static Dialog_Settings(context, String idProduct) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(33.0),
            topRight: const Radius.circular(33.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: _buildScanProductMenu(context, idProduct),
        ),
      ),
    );
  }
}

Widget _buildScanProductMenu(context, String idProduct) {
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
      SizedBox(height: 25),
      Padding(
        padding: const EdgeInsets.only(left: 23),
        child: Poppins(text: "Florxy Scan Result", size: 20, color: c.textBlack, fontWeight: f.semiBold),
      ),
      SizedBox(height: 8),
      ProductView2( id: idProduct)
    ],
  );

}


class ProductView2 extends StatefulWidget {
  String? id;
  ProductView2({Key? key, this.id}) : super(key: key);

  @override
  _ProductView2State createState() => _ProductView2State();
}

class _ProductView2State extends State<ProductView2> {
  final networkHandler = NetworkHandler();
  ProductModel productModel = ProductModel(p_name: '', p_brand: '', p_desc: '', p_img: '', ing_name: [], ing_met: [], ing_irr: [], ing_rate: [], mention: 0, review: 0);
  fetchdata() async {
    var scan = await networkHandler.get("/product/" + widget.id!);
    setState(() {
      productModel = ProductModel.fromJson(scan['data']);
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    fetchdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => comparepage(id: widget.id, currentState: 0)));
          },
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 15),
                  Center(
                    child: Container(
                      height: 100,
                      width: 90,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          image: DecorationImage(
                              image: NetworkImage(productModel.p_img),
                              fit: BoxFit.contain
                          )
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 8),
                              child: PoppinsLeft(text: productModel.p_brand, size: 10.5, color: Colors.white, fontWeight: f.semiBold),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: c.greySub
                            ),
                          ),
                          SizedBox(height: 2),
                          PoppinsLeft(text: productModel.p_name, size: 13.5, color: c.textBlack, fontWeight: f.semiBold),
                          SizedBox(height: 10),
                          Roboto_Crop(text: productModel.p_desc, size: 12, color: c.greyMain, fontWeight: f.regular)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}