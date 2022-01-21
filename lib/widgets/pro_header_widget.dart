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
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(color: Colors.white),
    child: Padding(
      padding:
          const EdgeInsets.only(left: 25.0, right: 25, bottom: 20, top: 17),
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
                  radius: 40,
                  backgroundColor: Colors.orange,
                  // backgroundImage: NetworkImage(
                  //     "https://upload.wikimedia.org/wikipedia/commons/a/a0/Andrzej_Person_Kancelaria_Senatu.jpg"),
                  backgroundImage: AssetImage('assets/img/user_1.jpg'),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25, bottom: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Putita Techapat",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  ModalBottomSheet.Modal_Settings(context);
                                },
                                icon: Icon(Boxicons.bx_dots_vertical_rounded),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                "11.3K",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "Followers",
                                style:
                                    TextStyle(fontSize: 15, letterSpacing: 0.4),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 35,
                          ),
                          Column(
                            children: [
                              Text(
                                "345",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "Following",
                                style:
                                    TextStyle(fontSize: 15, letterSpacing: 0.4),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 35,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
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
