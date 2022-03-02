import 'package:Florxy/widgets/ViewPhotoWidget.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:boxicons/boxicons.dart';
import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'CreatePost.dart';
import 'cameranavbar.dart';

class ViewPost extends StatefulWidget {
  const ViewPost({Key? key}) : super(key: key);

  @override
  _ViewPostState createState() => _ViewPostState();
}

class _ViewPostState extends State<ViewPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: c.textWhite,
      body: Column(
        children: [
          SizedBox(height: Theme.of(context).platform==TargetPlatform.android?11:0),
          Container(
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 22),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(FeatherIcons.chevronLeft),
                      iconSize: 34,
                      color: Colors.black,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 11),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
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
                              Inter(text: "@bababaconnnn", size: 12, color: c.textUsername, fontWeight: f.medium),
                              SizedBox( height: 7 ),
                              Row(
                                children: [
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 7, left: 7, top: 4, bottom: 4),
                                      child: Inter(
                                          text: "Beauty Advisor",
                                          size: 8.5,
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
                                          size: 8.5,
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
                        ],
                      ),
                    ),
                    Expanded(child: Container()),
                    IconButton(
                      icon: Icon(Boxicons.bx_dots_vertical_rounded),
                      iconSize: 28,
                      color: Colors.black,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(26),
              ),
              boxShadow: [
                BoxShadow(
                  color: c.shadow.withOpacity(0.32),
                  spreadRadius: 0,
                  blurRadius: 29,
                  offset: Offset(-1, -16), // changes position of shadow
                ),
              ],
              color: Colors.white
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.only(left: 23, right: 23, top: 15),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Inter(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been   the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", size: 14, color: c.postText, fontWeight: f.regular)
                    ),
                    SizedBox(height: 15),
                    // if(widget.urlImage?.length==1)Row(
                    //   children: [
                    //     Expanded(
                    //       child: GestureDetector(
                    //         child: Container(
                    //           // key: _key,
                    //           height: 315,
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(12),
                    //               color: c.graySub2,
                    //               image: DecorationImage(
                    //                   image: NetworkImage(''),
                    //                   fit: BoxFit.cover
                    //               )
                    //           ),
                    //         ),
                    //         onTap: () {
                    //           Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                    //             urlImage: [],
                    //           )));
                    //         },
                    //       ),
                    //     ),
                    //   ],
                    // ),


                    // if(widget.urlImage?.length==2)Row(
                    //   children: [
                    //     // SizedBox(width: 60),
                    //     Expanded(
                    //       child: GestureDetector(
                    //         child: Container(
                    //           height: 155,
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.only(
                    //                   topLeft: Radius.circular(12),
                    //                   bottomLeft: Radius.circular(12)
                    //               ),
                    //               color: c.graySub2,
                    //               image: DecorationImage(
                    //                   image: NetworkImage('widget.urlImage![0]'),
                    //                   fit: BoxFit.cover
                    //               )
                    //           ),
                    //         ),
                    //         onTap: () {
                    //           Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                    //             urlImage: [],
                    //           )));
                    //         },
                    //       ),
                    //     ),
                    //     SizedBox( width: 5 ),
                    //     Expanded(
                    //       child: GestureDetector(
                    //         child: Container(
                    //           height: 155,
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.only(
                    //                   topRight: Radius.circular(12),
                    //                   bottomRight: Radius.circular(12)
                    //               ),
                    //               color: c.graySub2,
                    //               image: DecorationImage(
                    //                   image: NetworkImage(''),
                    //                   fit: BoxFit.cover
                    //               )
                    //           ),
                    //         ),
                    //         onTap: () {
                    //           Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                    //               urlImage: [],
                    //               index: 2
                    //           )));
                    //         },
                    //       ),
                    //     )
                    //   ],
                    // ),


                    // if(widget.urlImage?.length==3)
                      Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                child: Container(
                                  // key: _key,
                                  height: 155,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: c.graySub2,
                                      image: DecorationImage(
                                          image: NetworkImage(''),
                                          fit: BoxFit.cover
                                      )
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                    urlImage: [],
                                  )));
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox( height: 5 ),
                        Row(
                          children: [
                            // SizedBox(width: 60),
                            Expanded(
                              child: GestureDetector(
                                child: Container(
                                  height: 155,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          bottomLeft: Radius.circular(12)
                                      ),
                                      color: c.graySub2,
                                      image: DecorationImage(
                                          image: NetworkImage(''),
                                          fit: BoxFit.cover
                                      )
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                    urlImage: [],
                                  )));
                                },
                              ),
                            ),
                            SizedBox( width: 5 ),
                            Expanded(
                              child: GestureDetector(
                                child: Container(
                                  height: 155,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(12),
                                          bottomRight: Radius.circular(12)
                                      ),
                                      color: c.graySub2,
                                      image: DecorationImage(
                                          image: NetworkImage(''),
                                          fit: BoxFit.cover
                                      )
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                      urlImage: [],
                                      index: 2
                                  )));
                                },
                              ),
                            )
                          ],
                        ),
                      ],
                    ),


                    // if(widget.urlImage?.length==4)
                    //   Column(
                    //   children: [
                    //     Row(
                    //       children: [
                    //         // SizedBox(width: 60),
                    //         Expanded(
                    //           child: GestureDetector(
                    //             child: Container(
                    //               height: 155,
                    //               decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.only(
                    //                       topLeft: Radius.circular(12),
                    //                       bottomLeft: Radius.circular(12)
                    //                   ),
                    //                   color: c.graySub2,
                    //                   image: DecorationImage(
                    //                       image: NetworkImage(''),
                    //                       fit: BoxFit.cover
                    //                   )
                    //               ),
                    //             ),
                    //             onTap: () {
                    //               Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                    //                 urlImage: [],
                    //               )));
                    //             },
                    //           ),
                    //         ),
                    //         SizedBox( width: 5 ),
                    //         Expanded(
                    //           child: GestureDetector(
                    //             child: Container(
                    //               height: 155,
                    //               decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.only(
                    //                       topRight: Radius.circular(12),
                    //                       bottomRight: Radius.circular(12)
                    //                   ),
                    //                   color: c.graySub2,
                    //                   image: DecorationImage(
                    //                       image: NetworkImage(''),
                    //                       fit: BoxFit.cover
                    //                   )
                    //               ),
                    //             ),
                    //             onTap: () {
                    //               Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                    //                   urlImage: [],
                    //                   index: 2
                    //               )));
                    //             },
                    //           ),
                    //         )
                    //       ],
                    //     ),
                    //     SizedBox( height: 5 ),
                    //     Row(
                    //       children: [
                    //         // SizedBox(width: 60),
                    //         Expanded(
                    //           child: GestureDetector(
                    //             child: Container(
                    //               height: 155,
                    //               decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.only(
                    //                       topLeft: Radius.circular(12),
                    //                       bottomLeft: Radius.circular(12)
                    //                   ),
                    //                   color: c.graySub2,
                    //                   image: DecorationImage(
                    //                       image: NetworkImage(''),
                    //                       fit: BoxFit.cover
                    //                   )
                    //               ),
                    //             ),
                    //             onTap: () {
                    //               Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                    //                 urlImage: [],
                    //               )));
                    //             },
                    //           ),
                    //         ),
                    //         SizedBox( width: 5 ),
                    //         Expanded(
                    //           child: GestureDetector(
                    //             child: Container(
                    //               height: 155,
                    //               decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.only(
                    //                       topRight: Radius.circular(12),
                    //                       bottomRight: Radius.circular(12)
                    //                   ),
                    //                   color: c.graySub2,
                    //                   image: DecorationImage(
                    //                       image: NetworkImage(''),
                    //                       fit: BoxFit.cover
                    //                   )
                    //               ),
                    //             ),
                    //             onTap: () {
                    //               Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                    //                   urlImage: [],
                    //                   index: 2
                    //               )));
                    //             },
                    //           ),
                    //         )
                    //       ],
                    //     ),
                    //   ],
                    // ),

                    SizedBox(height: 8),
                    Row(
                      children: [
                        Inter(text: '19:26', size: 12.5, color: c.greyMain, fontWeight: f.regular),
                        SizedBox(width: 5),
                        Inter(text: '14/12/2564' + ' BE', size: 12.5, color: c.greyMain, fontWeight: f.regular),
                      ],
                    ),
                    SizedBox(height: 8),
                    Divider(
                      color: c.greyMain,
                      thickness: 0.7,
                      height: 0,
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Inter(text: 1.toString(), size: 13.5, color: c.textBlack, fontWeight: f.bold),
                        SizedBox(width: 3),
                        Inter(text: 'Mention to', size: 12.5, color: c.textBlack, fontWeight: f.regular),
                      ],
                    ),
                    SizedBox(height: 8),
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
                                      image: NetworkImage('https://s3.images-iherb.com/pix/pix82102/v/14.jpg'),
                                      fit: BoxFit.fitHeight
                                  )
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 250,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 8),
                                    child: PoppinsLeft(text: 'Pixi Skintreasts', size: 10.5, color: Colors.white, fontWeight: f.semiBold),
                                  ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: c.greySub
                                ),
                              ),
                              SizedBox(height: 2),
                              PoppinsLeft(text: 'Glow Tonic Toner', size: 15.5, color: c.textBlack, fontWeight: f.semiBold),
                              SizedBox(height: 15),
                              Roboto(text: 'It is a long established fact that a reader will be distracted.', size: 13, color: c.greyMain, fontWeight: f.regular)
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(
                      color: c.greyMain,
                      thickness: 0.7,
                      height: 0,
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Inter(text: 45.toString(), size: 13.5, color: c.textBlack, fontWeight: f.bold),
                        SizedBox(width: 3),
                        Inter(text: 'Comments', size: 12.5, color: c.textBlack, fontWeight: f.regular),

                        SizedBox(width: 9),

                        Inter(text: 327.toString(), size: 13.5, color: c.textBlack, fontWeight: f.bold),
                        SizedBox(width: 3),
                        Inter(text: 'Likes', size: 12.5, color: c.textBlack, fontWeight: f.regular),

                        SizedBox(width: 9),

                        Inter(text: 16.toString(), size: 13.5, color: c.textBlack, fontWeight: f.bold),
                        SizedBox(width: 3),
                        Inter(text: 'Shared', size: 12.5, color: c.textBlack, fontWeight: f.regular),
                      ],
                    ),
                    SizedBox(height: 8),
                    Divider(
                      color: c.greyMain,
                      thickness: 0.7,
                      height: 0,
                    ),
                    SizedBox(height: 9),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 45),
                          child: Icon(FeatherIcons.messageSquare, size:19, color: c.greyMain),
                        ),
                        Expanded(child: Container()),
                        Icon(FeatherIcons.heart, size:19, color: c.greyMain),
                        Expanded(child: Container()),
                        Padding(
                          padding: const EdgeInsets.only(right: 45),
                          child: Icon(FeatherIcons.share2, size:19, color: c.greyMain),
                        ),
                      ],
                    ),
                    SizedBox(height: 9),
                    Divider(
                      color: c.greyMain,
                      thickness: 0.7,
                      height: 0,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 12),
          child: Row(
            children: [
              Icon(FeatherIcons.camera, size:25, color: Colors.black),
              SizedBox(width: 13),
              Expanded(
                child: Container(
                  height: 35,
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: c.searchbar,
                      contentPadding: EdgeInsets.fromLTRB(18, 0, 0, 0),
                      hintText: 'Write a comment...',
                      hintStyle: TextStyle(
                          fontSize: 13.5,
                          color: c.greyMain,
                          fontWeight: f.medium),
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        borderSide: BorderSide(
                            color: c.graySub2.withOpacity(0), width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        borderSide: BorderSide(
                            color: c.graySub2.withOpacity(0), width: 2),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
