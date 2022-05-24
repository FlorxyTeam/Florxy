import 'package:Florxy/Model/productModel.dart';
import 'package:Florxy/pages/LoginPage.dart';
import 'package:Florxy/pages/productoverview.dart';
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
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import '../NetworkHandler.dart';
import '../pages/comparepage.dart';
import '../postProvider.dart';
import 'button.dart';



class ModalViewProduct {
  static Dialog_Settings(context, List product) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.82,
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(33.0),
            topRight: const Radius.circular(33.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: _buildSelectProductMenu(context, product),
        ),
      ),
    );
  }
}

Widget _buildSelectProductMenu(context, List product) {
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
        child: Poppins(text: 'Mention ' + product.length.toString() + ' Product in this Post', size: 20, color: c.textBlack, fontWeight: f.semiBold),
      ),
      SizedBox(height: 8),
      MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: ListView.builder(
          itemCount: product.length,
          itemBuilder: (context,int index){
            Map data = product[index];
            return ProductView(
                brand: "${data['p_brand']}",
                product: "${data['p_name']}",
                productImg: "${data['p_img']}",
                desc: "${data['p_desc']}",
                id: "${data['_id']}"
            );
          },
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
    ],
  );

}


class ProductView extends StatefulWidget {
  String? productImg, brand, product, desc, id;
  ProductView({Key? key, this.productImg, this.product, this.brand, this.desc, this.id}) : super(key: key);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final storage = new FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductOverview(id: widget.id)));
            await storage.write(key: "p_id", value: widget.id);
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
                      width: 75,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          image: DecorationImage(
                              image: NetworkImage(widget.productImg!),
                              fit: BoxFit.contain
                          )
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 8),
                                child: PoppinsLeft(text: widget.brand!, size: 10.5, color: Colors.white, fontWeight: f.semiBold),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: c.greySub
                              ),
                            ),
                            SizedBox(height: 2),
                            PoppinsLeft(text: widget.product!, size: 13.5, color: c.textBlack, fontWeight: f.semiBold),
                            SizedBox(height: 10),
                            Roboto_Crop(text: widget.desc!, size: 12, color: c.greyMain, fontWeight: f.regular)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Divider(
            color: c.greyMain,
            thickness: 0.5,
            height: 0,
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}





