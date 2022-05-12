import 'package:Florxy/pages/productoverview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../pages/comparepage.dart';
import 'fontWeight.dart';
import 'font.dart';

class ProductInMentionPost extends StatefulWidget {
  String? productImg, brand, product, desc, id;
  ProductInMentionPost({Key? key, this.productImg, this.product, this.brand, this.desc, this.id}) : super(key: key);

  @override
  _ProductInMentionPostState createState() => _ProductInMentionPostState();
}

class _ProductInMentionPostState extends State<ProductInMentionPost> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductOverview(id: widget.id)));
          },
          child: Column(
            children: [
              // Row(
              //   children: [
              //     Inter(text: 0.toString(), size: 13.5, color: c.textBlack, fontWeight: f.bold),
              //     SizedBox(width: 3),
              //     Inter(text: 'Mention to', size: 12.5, color: c.textBlack, fontWeight: f.regular),
              //   ],
              // ),
              SizedBox(height: 8),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 12),
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
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
              ),
            ],
          ),
        ),
        SizedBox(height: 10,)
      ],
    );
  }
}
