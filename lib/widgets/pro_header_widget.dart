import 'package:Florxy/widgets/font.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/pages/FavPost.dart';
import 'package:Florxy/pages/savedPro.dart';
import 'package:Florxy/pages/PostReply.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/pages/searchpage.dart';
import 'package:Florxy/widgets/ModalBottomSheet.dart';

Widget profileHeaderWidget(BuildContext context) {
  final Size size = MediaQuery.of(context).size;

  return Container(
    decoration: BoxDecoration(
        color: c.textWhite,
        border: Border(
          bottom: BorderSide(width: 0.8, color: c.greyMain.withOpacity(0.5)),
        )),
    child: Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 43,
                  backgroundColor: Colors.orange,
                  backgroundImage: AssetImage('assets/img/user_1.jpg'),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Poppins(
                                  text: "Putita Techapat",
                                  size: 18,
                                  color: c.blackMain,
                                  fontWeight: f.semiBold),
                              IconButton(
                                onPressed: () {
                                  ModalBottomSheet.Dialog_Settings(context);
                                },
                                icon: Icon(Boxicons.bx_dots_vertical_rounded),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 21),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Poppins(
                                  text: "11.3K",
                                  size: 16,
                                  color: c.blackMain,
                                  fontWeight: f.semiBold),
                              Poppins(
                                  text: "Followers",
                                  size: 12,
                                  color: c.greyMain,
                                  fontWeight: f.semiBold),
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            children: [
                              Poppins(
                                  text: "345",
                                  size: 16,
                                  color: c.blackMain,
                                  fontWeight: f.semiBold),
                              Poppins(
                                  text: "Following",
                                  size: 12,
                                  color: c.greyMain,
                                  fontWeight: f.semiBold),
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        child: Inter(
                            text: "@bababaconnnn",
                            size: 13,
                            color: c.blackMain,
                            fontWeight: f.semiBold),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 7, left: 7, top: 4, bottom: 4),
                          child: Center(
                            child: Inter(
                                text: "Beauty Advisor",
                                size: 10,
                                color: Colors.white,
                                fontWeight: f.semiBold),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: c.greenMain,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 5, left: 5, top: 2, bottom: 2),
                          child: Inter(
                              text: "Brand Presenter",
                              size: 10,
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
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7, bottom: 7),
            child: Inter(
                text:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                size: 12,
                color: c.greyMain,
                fontWeight: f.semiBold),
          ),
          Row(children: [
            Icon(
              Icons.cake_outlined,
              color: c.greyMain,
              size: 18.0,
            ),
            SizedBox(
              width: 2,
            ),
            Inter(
                text: "16 February 2001",
                size: 11,
                color: c.greyMain,
                fontWeight: f.medium),
          ])
        ],
      ),
    ),
  );
}

// void _ModaBottomSheet(context) {
//   showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return Column(
//           children: [
//             ListTile(
//               leading: Icon(Icons.ac_unit),
//               title: Text('Kuay'),
//               onTap: () {},
//             )
//           ],
//         );
//       });
// }
