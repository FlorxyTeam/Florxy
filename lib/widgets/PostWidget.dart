import 'package:boxicons/boxicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class MentionPost extends StatelessWidget {
  String? name,postTime,username,brand,product,post,comment,favorite;
  MentionPost({Key? key, this.name, this.postTime, this.username, this.brand, this.product, this.post, this.comment, this.favorite}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 28, right: 8),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.orange,
                  // backgroundImage:
                  // NetworkHandler().getImage(profileModel.email),
                ),
                SizedBox( width: 8 ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Poppins(
                          text: name!,
                          fontWeight: f.semiBold,
                          size: 14,
                          color: Colors.black,
                        ),
                        SizedBox( width: 5 ),
                        Inter(text: postTime!, size: 12, color: c.graySub2, fontWeight: f.medium)
                      ],
                    ),
                    Inter(text: username!, size: 12, color: c.textUsername, fontWeight: f.medium),
                    SizedBox( height: 7 ),
                    Row(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 7, left: 7, top: 4, bottom: 4),
                            child: Inter(
                                text: "Beauty Advisor",
                                size: 9,
                                color: Colors.white,
                                fontWeight: f.semiBold),
                          ),
                          decoration: BoxDecoration(
                              color: c.greenMain,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        SizedBox( width: 5 ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 5, left: 5, top: 2, bottom: 2),
                            child: Inter(
                                text: "Brand Presenter",
                                size: 9,
                                color: c.blueMain,
                                fontWeight: f.bold),
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: c.blueMain,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ],
                    )
                  ],
                ),
                Expanded(child: Container()),
                Container(
                  height: 66,
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {},
                    alignment: Alignment.topRight,
                    icon: Icon(Boxicons.bx_dots_vertical_rounded, size: 30, color: c.greyMain,),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 28, right: 28),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: Container()),
                    Container(
                      height: 140,
                      width: 134,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12)
                        ),
                        color: c.graySub2,
                        image: DecorationImage(
                          image: AssetImage('')
                        )
                      ),
                    ),
                    SizedBox( width: 5 ),
                    Container(
                      height: 140,
                      width: 134,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12)
                          ),
                          color: c.graySub2,
                          image: DecorationImage(
                              image: AssetImage('')
                          )
                      ),
                    )
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    SizedBox(width: 60),
                    Inter(text: 'mention to', size: 11, color: c.blackMain, fontWeight: f.medium),
                    SizedBox(width: 5),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 9, right: 9),
                        child: Row(
                          children: [
                            Inter(
                                text: brand!,
                                size: 10,
                                color: Colors.white,
                                fontWeight: f.semiBold
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 2,top: 10, bottom: 10, right: 2),
                              child: VerticalDivider(
                                color: Colors.white,
                                thickness: 2,
                              ),
                            ),
                            Inter(
                                text: product!,
                                size: 10,
                                color: Colors.white,
                                fontWeight: f.semiBold
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: c.blackMain,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child: Inter(text: post!, size: 11.5, color: c.postText, fontWeight: f.regular),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child: Row(
                    children: [
                      Icon(FeatherIcons.messageSquare, size:19, color: c.greyMain),
                      SizedBox(width: 3),
                      Inter(text: comment!, size: 11, color: c.greyMain, fontWeight: f.medium),
                      Expanded(child: Container()),
                      Icon(FeatherIcons.heart, size:19, color: c.greyMain),
                      SizedBox(width: 3),
                      Inter(text: favorite!, size: 11, color: c.greyMain, fontWeight: f.medium),
                      Expanded(child: Container()),
                      Icon(FeatherIcons.share2, size:19, color: c.greyMain),
                      Expanded(child: Container()),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Divider(
            color: c.greyMain,
            thickness: 0.5,
          ),
        ],
      ),
    );
  }
}
