import 'package:Florxy/pages/LoginPage.dart';
import 'package:Florxy/pages/searchpage.dart';
import 'package:Florxy/widgets/SearchMentionPostWidget.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flappy_search_bar_ns/flappy_search_bar_ns.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/scrapper/incidecoder.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../postProvider.dart';
import 'button.dart';



class ModalMentionPost {
  static Dialog_Settings(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.92,
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(33.0),
            topRight: const Radius.circular(33.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: _buildSelectProductMenu(context),
        ),
      ),
    );
  }
}

Widget _buildSelectProductMenu(context) {
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
      SizedBox(height: 16),
      Padding(
        padding: const EdgeInsets.only(left: 23, right: 23),
        child: buildSearch(),
      ),
      SizedBox(height: 15),
      Padding(
        padding: const EdgeInsets.only(left: 23),
        child: Poppins(text: 'Top mention', size: 20, color: c.textBlack, fontWeight: f.semiBold),
      ),
      SizedBox(height: 15),
      Expanded(child: Product()),
    ],
  );

}

Widget buildSearch() => SearchMentionPost(
  text: '',
  hintText: "Search product to mention",
  onChanged: (String value) {  },
);

// ################### Top Mention #################################

class Product extends StatefulWidget {
  Product({Key? key}) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<PostProvider>(context,listen: false).fetchMentionProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Consumer<PostProvider>(builder: (context,model,_) => FutureBuilder(
          future: model.fetchMentionProduct(),
          builder: (context,snapshot) => ListView.builder(
            // scrollDirection: Axis.vertical,
            itemCount: model.productData?.length??0,
            itemBuilder: (context,int index){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Center(
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                      image: NetworkImage(model.productData![index]['p_img']),
                                      fit: BoxFit.contain
                                  )
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Container(
                            width: 190,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PoppinsLeft(text: model.productData![index]['p_brand'], size: 13, color: c.textBlack, fontWeight: f.semiBold),
                                PoppinsLeft(text: model.productData![index]['p_name'], size: 13, color: c.textBlack, fontWeight: f.semiBold),
                                SizedBox(height: 15),
                                Roboto(text: 'It is a long established fact that a reader will be distracted.', size: 12, color: c.greySub, fontWeight: f.regular)
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: WhiteGreenButton(
                            text: 'add',
                            size: 11,
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
      ),
    );
  }
}


