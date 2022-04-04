import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'fontWeight.dart';
import 'font.dart';

class ProductInViewPost extends StatefulWidget {
  String? productImg, brand, product;
  ProductInViewPost({Key? key, this.productImg}) : super(key: key);

  @override
  _ProductInViewPostState createState() => _ProductInViewPostState();
}

class _ProductInViewPostState extends State<ProductInViewPost> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                          image: NetworkImage(widget.productImg!),
                          fit: BoxFit.contain
                      )
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 11),
              child: Container(
                width: 230,
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
                    Roboto(text: 'It is a long established fact that a reader will be distracted.', size: 12, color: c.greyMain, fontWeight: f.regular)
                  ],
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
    );
  }
}
