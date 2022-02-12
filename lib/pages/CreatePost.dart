import 'package:Florxy/widgets/button.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Theme.of(context).platform==TargetPlatform.android?75:66.0),
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
            backgroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(26),
                )),
            leading: Padding(
              padding: EdgeInsets.only(top: Theme.of(context).platform==TargetPlatform.android?17.5:0, left: 13),
              child: IconButton(
                icon: Icon(FeatherIcons.chevronLeft),
                iconSize: 34,
                color: Colors.black,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(top: Theme.of(context).platform==TargetPlatform.android?27:12, right: 30, bottom: Theme.of(context).platform==TargetPlatform.android?0:12),
                child: GreenButton(
                  text: 'POST',
                  size: 12,
                  color: Colors.white,
                  width: 60,
                )
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, left: 28, right: 28),
              child: Column(
                children: [
                  Row(
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
                          Poppins(
                            text: 'Putita Techapat',
                            fontWeight: f.semiBold,
                            size: 14,
                            color: Colors.black,
                          ),
                          Inter(text: '@bababaconnnnn', size: 12, color: c.textUsername, fontWeight: f.medium)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    maxLines: null ,
                    autofocus:true,
                    decoration: InputDecoration.collapsed(
                      hintText: "What’s on your mind?",
                      hintStyle: GoogleFonts.inter(
                        textStyle: TextStyle(fontSize: 14, color: c.blackSub2, fontWeight: f.semiBold)
                      )
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(left: 28, right: 28),
                child: Row(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 1,bottom: 2,left: 4,right: 6),
                        child: Row(
                          children: [
                            Icon(Boxicons.bx_world, size: 23, color: c.greenSub1),
                            SizedBox(width: 2),
                            Inter(
                              text: 'Everyone',
                              fontWeight: f.bold,
                              size: 11,
                              color: c.greenSub1,
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          width: 2,
                          color: c.greenSub1
                        )
                      ),
                    ),
                    Expanded(child: Container()),
                    IconButton(
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                      icon: Icon(MdiIcons.bullhornVariantOutline, color: c.greenMain, size: 22)
                    ),
                    SizedBox(width: 25),
                    IconButton(
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        icon: Icon(MdiIcons.starCircleOutline, color: c.greenMain, size: 24)
                    ),
                    SizedBox(width: 25),
                    IconButton(
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        icon: Icon(Boxicons.bx_poll, color: c.greenMain, size: 26)
                    ),
                    SizedBox(width: 25),
                    IconButton(
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        icon: Icon(FeatherIcons.image, color: c.greenMain, size: 22)
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: c.shadow.withOpacity(0.09),
                    spreadRadius: -27,
                    blurRadius: 43,
                    offset: Offset(1, 1), // changes position of shadow
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}