import 'package:Florxy/Model/profileModel.dart';
import 'package:Florxy/pages/homepage.dart';
import 'package:Florxy/pages/navbar.dart';
import 'package:boxicons/boxicons.dart';
import 'package:Florxy/postProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:Florxy/NetworkHandler.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'ViewPhotoWidget.dart';

class MentionPost extends StatefulWidget {
  String? name, postTime, username, brand, product, post, id;
  int comment, favorite;
  List? urlImage;

  MentionPost(
      {Key? key, this.name, this.postTime, this.username, this.brand, this.product, this.post, required this.comment, required this.favorite, this.urlImage, this.id})
      : super(key: key);

  @override
  _MentionPostState createState() => _MentionPostState();
}

class _MentionPostState extends State<MentionPost> {
  final _key = GlobalKey();
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();
  bool isFav = false;

  @override
  void initState() {
  // TODO: implement initState
  // fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 23, right: 4),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
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
                          text: widget.name!,
                          fontWeight: f.semiBold,
                          size: 13,
                          color: Colors.black,
                        ),
                        SizedBox( width: 5 ),
                        Inter(text: widget.postTime!, size: 11, color: c.graySub2, fontWeight: f.medium)
                      ],
                    ),
                    Inter(text: widget.username!, size: 11, color: c.textUsername, fontWeight: f.medium),
                    SizedBox( height: 7 ),
                    Row(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 7, left: 7, top: 4, bottom: 4),
                            child: Inter(
                                text: "Beauty Advisor",
                                size: 8,
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
                                size: 8,
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
                    icon: Icon(Boxicons.bx_dots_vertical_rounded, size: 30, color: c.greyMain),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 80, right: 23),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(widget.urlImage?.length==null)Container(),
                if(widget.urlImage?.length==1)Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        child: Container(
                          key: _key,
                          height: 285,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: c.graySub2,
                              image: DecorationImage(
                                  image: NetworkImage(widget.urlImage![0]),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                            urlImage: widget.urlImage,
                          )));
                        },
                      ),
                    ),
                  ],
                ),
                if(widget.urlImage?.length==2)Row(
                  children: [
                    // SizedBox(width: 60),
                    Expanded(
                      child: GestureDetector(
                        child: Container(
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12)
                            ),
                            color: c.graySub2,
                            image: DecorationImage(
                              image: NetworkImage(widget.urlImage![0]),
                              fit: BoxFit.cover
                            )
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                            urlImage: widget.urlImage,
                          )));
                        },
                      ),
                    ),
                    SizedBox( width: 5 ),
                    Expanded(
                      child: GestureDetector(
                        child: Container(
                          height: 140,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(12),
                                  bottomRight: Radius.circular(12)
                              ),
                              color: c.graySub2,
                              image: DecorationImage(
                                  image: NetworkImage(widget.urlImage![1]),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                              urlImage: widget.urlImage,
                              index: 2
                          )));
                        },
                      ),
                    )
                  ],
                ),
                if(widget.urlImage?.length==3)Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            child: Container(
                              key: _key,
                              height: 140,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: c.graySub2,
                                  image: DecorationImage(
                                      image: NetworkImage(widget.urlImage![0]),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                urlImage: widget.urlImage,
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
                              height: 140,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12)
                                  ),
                                  color: c.graySub2,
                                  image: DecorationImage(
                                      image: NetworkImage(widget.urlImage![1]),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                urlImage: widget.urlImage,
                              )));
                            },
                          ),
                        ),
                        SizedBox( width: 5 ),
                        Expanded(
                          child: GestureDetector(
                            child: Container(
                              height: 140,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(12),
                                      bottomRight: Radius.circular(12)
                                  ),
                                  color: c.graySub2,
                                  image: DecorationImage(
                                      image: NetworkImage(widget.urlImage![2]),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                  urlImage: widget.urlImage,
                                  index: 2
                              )));
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                if(widget.urlImage?.length==4)Column(
                  children: [
                    Row(
                      children: [
                        // SizedBox(width: 60),
                        Expanded(
                          child: GestureDetector(
                            child: Container(
                              height: 140,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12)
                                  ),
                                  color: c.graySub2,
                                  image: DecorationImage(
                                      image: NetworkImage(widget.urlImage![0]),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                urlImage: widget.urlImage,
                              )));
                            },
                          ),
                        ),
                        SizedBox( width: 5 ),
                        Expanded(
                          child: GestureDetector(
                            child: Container(
                              height: 140,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(12),
                                      bottomRight: Radius.circular(12)
                                  ),
                                  color: c.graySub2,
                                  image: DecorationImage(
                                      image: NetworkImage(widget.urlImage![1]),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                  urlImage: widget.urlImage,
                                  index: 2
                              )));
                            },
                          ),
                        )
                      ],
                    ),
                    SizedBox( height: 5 ),
                    Row(
                      children: [
                        // SizedBox(width: 60),
                        Expanded(
                          child: GestureDetector(
                            child: Container(
                              height: 140,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12)
                                  ),
                                  color: c.graySub2,
                                  image: DecorationImage(
                                      image: NetworkImage(widget.urlImage![2]),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                urlImage: widget.urlImage,
                              )));
                            },
                          ),
                        ),
                        SizedBox( width: 5 ),
                        Expanded(
                          child: GestureDetector(
                            child: Container(
                              height: 140,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(12),
                                      bottomRight: Radius.circular(12)
                                  ),
                                  color: c.graySub2,
                                  image: DecorationImage(
                                      image: NetworkImage(widget.urlImage![3]),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                  urlImage: widget.urlImage,
                                  index: 2
                              )));
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                if(widget.urlImage?.length!=null)SizedBox(height: 10),
                if(widget.urlImage?.length!=null)Row(
                  children: [
                    // SizedBox(width: 60),
                    Inter(text: 'mention to', size: 11, color: c.blackMain, fontWeight: f.medium),
                    SizedBox(width: 5),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 9, right: 4, top: 3, bottom: 3),
                        child: Row(
                          children: [
                            Container(
                              constraints: BoxConstraints(maxWidth: 160),
                              child: Inter_Crop(
                                  text: widget.brand! + " " + widget.product!,
                                  size: 10,
                                  color: Colors.white,
                                  fontWeight: f.semiBold
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(FeatherIcons.chevronRight, size: 14, color: Colors.white),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: c.blackMain,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ],
                ),
                if(widget.urlImage?.length!=null)SizedBox(height: 8),
                GestureDetector(
                  onTap: () async {
                    var res = await networkHandler.get("/home/getPost/viewPost/" + widget.id! + "/" + widget.brand!);
                    print(res);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Inter(text: widget.post!, size: 12, color: c.postText, fontWeight: f.regular),
                  ),
                ),
                if(widget.urlImage?.length==null)SizedBox(height: 8),
                if(widget.urlImage?.length==null)Row(
                  children: [
                    // SizedBox(width: 60),
                    Inter(text: 'mention to', size: 11, color: c.blackMain, fontWeight: f.medium),
                    SizedBox(width: 5),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 9, right: 4, top: 3, bottom: 3),
                        child: Row(
                          children: [
                            Container(
                              constraints: BoxConstraints(maxWidth: 160),
                              child: Inter_Crop(
                                  text: widget.brand! + " " + widget.product!,
                                  size: 10,
                                  color: Colors.white,
                                  fontWeight: f.semiBold
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(FeatherIcons.chevronRight, size: 14, color: Colors.white),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: c.blackMain,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Icon(FeatherIcons.messageSquare, size:19, color: c.greyMain),
                    SizedBox(width: 3),
                    Inter(text: widget.comment.toString(), size: 11, color: c.greyMain, fontWeight: f.medium),
                    Expanded(child: Container()),
                    if(isFav == false)InkWell(
                        onTap: () async {
                            Map<String, String> data = {
                              "favorite":widget.id!
                            };
                            print(data);
                            var idStorage = await storage.read(key: 'id');
                            await networkHandler.post("/home/addFav/" + idStorage!, data);
                            setState(() {
                              widget.favorite+=1;
                              isFav = true;
                            });
                        },
                      child: Icon(FeatherIcons.heart, size:19, color: c.greyMain)
                    ),
                    if(isFav == true)InkWell(
                        onTap: () async {
                          Map<String, String> data = {
                            "favorite":widget.id!
                          };
                          print(data);
                          var idStorage = await storage.read(key: 'id');
                          await networkHandler.post("/home/unFav/" + idStorage!, data);
                          setState(() {
                            widget.favorite-=1;
                            isFav = false;
                          });
                        },
                        child: Icon(Boxicons.bxs_heart, size:19, color: c.redMain)
                    ),
                    SizedBox(width: 3),
                    if(isFav == false)Inter(text: widget.favorite.toString(), size: 11, color: c.greyMain, fontWeight: f.medium),
                    if(isFav == true)Inter(text: widget.favorite.toString(), size: 11, color: c.redMain, fontWeight: f.medium),
                    Expanded(child: Container()),
                    Icon(FeatherIcons.share2, size:19, color: c.greyMain),
                    Expanded(child: Container()),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Divider(
            color: c.greyMain,
            thickness: 0.5,
            height: 0,
          ),
        ],
      ),
    );
  }
}

// class MentionPost extends StatelessWidget {
//   String? name, postTime, username, brand, product, post, id;
//   int? comment, favorite;
//   List? urlImage;
//
//   MentionPost(
//       {Key? key, this.name, this.postTime, this.username, this.brand, this.product, this.post, this.comment, this.favorite, this.urlImage, this.id})
//       : super(key: key);
//
//   final _key = GlobalKey();
//   final networkHandler = NetworkHandler();
//   final storage = new FlutterSecureStorage();
//   bool isFav = false;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           SizedBox(height: 8),
//           Padding(
//             padding: const EdgeInsets.only(left: 23, right: 4),
//             child: Row(
//               children: [
//                 CircleAvatar(
//                   radius: 25,
//                   backgroundColor: Colors.orange,
//                   // backgroundImage:
//                   // NetworkHandler().getImage(profileModel.email),
//                 ),
//                 SizedBox( width: 8 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Poppins(
//                           text: name!,
//                           fontWeight: f.semiBold,
//                           size: 13,
//                           color: Colors.black,
//                         ),
//                         SizedBox( width: 5 ),
//                         Inter(text: postTime!, size: 11, color: c.graySub2, fontWeight: f.medium)
//                       ],
//                     ),
//                     Inter(text: username!, size: 11, color: c.textUsername, fontWeight: f.medium),
//                     SizedBox( height: 7 ),
//                     Row(
//                       children: [
//                         Container(
//                           child: Padding(
//                             padding: const EdgeInsets.only(
//                                 right: 7, left: 7, top: 4, bottom: 4),
//                             child: Inter(
//                                 text: "Beauty Advisor",
//                                 size: 8,
//                                 color: Colors.white,
//                                 fontWeight: f.semiBold),
//                           ),
//                           decoration: BoxDecoration(
//                               color: c.greenMain,
//                               borderRadius: BorderRadius.circular(10)),
//                         ),
//                         SizedBox( width: 5 ),
//                         Container(
//                           child: Padding(
//                             padding: const EdgeInsets.only(
//                                 right: 5, left: 5, top: 2, bottom: 2),
//                             child: Inter(
//                                 text: "Brand Presenter",
//                                 size: 8,
//                                 color: c.blueMain,
//                                 fontWeight: f.bold),
//                           ),
//                           decoration: BoxDecoration(
//                               border: Border.all(
//                                 color: c.blueMain,
//                                 width: 2,
//                               ),
//                               borderRadius: BorderRadius.circular(10)),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//                 Expanded(child: Container()),
//                 Container(
//                   height: 66,
//                   alignment: Alignment.topRight,
//                   child: IconButton(
//                     onPressed: () {},
//                     alignment: Alignment.topRight,
//                     icon: Icon(Boxicons.bx_dots_vertical_rounded, size: 30, color: c.greyMain),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 8),
//           Padding(
//             padding: const EdgeInsets.only(left: 80, right: 23),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 if(urlImage?.length==null)Container(),
//                 if(urlImage?.length==1)Row(
//                   children: [
//                     Expanded(
//                       child: GestureDetector(
//                         child: Container(
//                           key: _key,
//                           height: 285,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12),
//                               color: c.graySub2,
//                               image: DecorationImage(
//                                   image: NetworkImage(urlImage![0]),
//                                   fit: BoxFit.cover
//                               )
//                           ),
//                         ),
//                         onTap: () {
//                           Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
//                             urlImage: urlImage,
//                           )));
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//                 if(urlImage?.length==2)Row(
//                   children: [
//                     // SizedBox(width: 60),
//                     Expanded(
//                       child: GestureDetector(
//                         child: Container(
//                           height: 140,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(12),
//                                   bottomLeft: Radius.circular(12)
//                               ),
//                               color: c.graySub2,
//                               image: DecorationImage(
//                                   image: NetworkImage(urlImage![0]),
//                                   fit: BoxFit.cover
//                               )
//                           ),
//                         ),
//                         onTap: () {
//                           Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
//                             urlImage: urlImage,
//                           )));
//                         },
//                       ),
//                     ),
//                     SizedBox( width: 5 ),
//                     Expanded(
//                       child: GestureDetector(
//                         child: Container(
//                           height: 140,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.only(
//                                   topRight: Radius.circular(12),
//                                   bottomRight: Radius.circular(12)
//                               ),
//                               color: c.graySub2,
//                               image: DecorationImage(
//                                   image: NetworkImage(urlImage![1]),
//                                   fit: BoxFit.cover
//                               )
//                           ),
//                         ),
//                         onTap: () {
//                           Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
//                               urlImage: urlImage,
//                               index: 2
//                           )));
//                         },
//                       ),
//                     )
//                   ],
//                 ),
//                 if(urlImage?.length==3)Column(
//                   children: [
//                     Row(
//                       children: [
//                         Expanded(
//                           child: GestureDetector(
//                             child: Container(
//                               key: _key,
//                               height: 140,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(12),
//                                   color: c.graySub2,
//                                   image: DecorationImage(
//                                       image: NetworkImage(urlImage![0]),
//                                       fit: BoxFit.cover
//                                   )
//                               ),
//                             ),
//                             onTap: () {
//                               Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
//                                 urlImage: urlImage,
//                               )));
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox( height: 5 ),
//                     Row(
//                       children: [
//                         // SizedBox(width: 60),
//                         Expanded(
//                           child: GestureDetector(
//                             child: Container(
//                               height: 140,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(12),
//                                       bottomLeft: Radius.circular(12)
//                                   ),
//                                   color: c.graySub2,
//                                   image: DecorationImage(
//                                       image: NetworkImage(urlImage![1]),
//                                       fit: BoxFit.cover
//                                   )
//                               ),
//                             ),
//                             onTap: () {
//                               Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
//                                 urlImage: urlImage,
//                               )));
//                             },
//                           ),
//                         ),
//                         SizedBox( width: 5 ),
//                         Expanded(
//                           child: GestureDetector(
//                             child: Container(
//                               height: 140,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.only(
//                                       topRight: Radius.circular(12),
//                                       bottomRight: Radius.circular(12)
//                                   ),
//                                   color: c.graySub2,
//                                   image: DecorationImage(
//                                       image: NetworkImage(urlImage![2]),
//                                       fit: BoxFit.cover
//                                   )
//                               ),
//                             ),
//                             onTap: () {
//                               Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
//                                   urlImage: urlImage,
//                                   index: 2
//                               )));
//                             },
//                           ),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//                 if(urlImage?.length==4)Column(
//                   children: [
//                     Row(
//                       children: [
//                         // SizedBox(width: 60),
//                         Expanded(
//                           child: GestureDetector(
//                             child: Container(
//                               height: 140,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(12),
//                                       bottomLeft: Radius.circular(12)
//                                   ),
//                                   color: c.graySub2,
//                                   image: DecorationImage(
//                                       image: NetworkImage(urlImage![0]),
//                                       fit: BoxFit.cover
//                                   )
//                               ),
//                             ),
//                             onTap: () {
//                               Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
//                                 urlImage: urlImage,
//                               )));
//                             },
//                           ),
//                         ),
//                         SizedBox( width: 5 ),
//                         Expanded(
//                           child: GestureDetector(
//                             child: Container(
//                               height: 140,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.only(
//                                       topRight: Radius.circular(12),
//                                       bottomRight: Radius.circular(12)
//                                   ),
//                                   color: c.graySub2,
//                                   image: DecorationImage(
//                                       image: NetworkImage(urlImage![1]),
//                                       fit: BoxFit.cover
//                                   )
//                               ),
//                             ),
//                             onTap: () {
//                               Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
//                                   urlImage: urlImage,
//                                   index: 2
//                               )));
//                             },
//                           ),
//                         )
//                       ],
//                     ),
//                     SizedBox( height: 5 ),
//                     Row(
//                       children: [
//                         // SizedBox(width: 60),
//                         Expanded(
//                           child: GestureDetector(
//                             child: Container(
//                               height: 140,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(12),
//                                       bottomLeft: Radius.circular(12)
//                                   ),
//                                   color: c.graySub2,
//                                   image: DecorationImage(
//                                       image: NetworkImage(urlImage![2]),
//                                       fit: BoxFit.cover
//                                   )
//                               ),
//                             ),
//                             onTap: () {
//                               Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
//                                 urlImage: urlImage,
//                               )));
//                             },
//                           ),
//                         ),
//                         SizedBox( width: 5 ),
//                         Expanded(
//                           child: GestureDetector(
//                             child: Container(
//                               height: 140,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.only(
//                                       topRight: Radius.circular(12),
//                                       bottomRight: Radius.circular(12)
//                                   ),
//                                   color: c.graySub2,
//                                   image: DecorationImage(
//                                       image: NetworkImage(urlImage![3]),
//                                       fit: BoxFit.cover
//                                   )
//                               ),
//                             ),
//                             onTap: () {
//                               Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
//                                   urlImage: urlImage,
//                                   index: 2
//                               )));
//                             },
//                           ),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//                 if(urlImage?.length!=null)SizedBox(height: 10),
//                 if(urlImage?.length!=null)Row(
//                   children: [
//                     // SizedBox(width: 60),
//                     Inter(text: 'mention to', size: 11, color: c.blackMain, fontWeight: f.medium),
//                     SizedBox(width: 5),
//                     Container(
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 9, right: 4, top: 3, bottom: 3),
//                         child: Row(
//                           children: [
//                             Container(
//                               constraints: BoxConstraints(maxWidth: 160),
//                               child: Inter_Crop(
//                                   text: brand! + " " + product!,
//                                   size: 10,
//                                   color: Colors.white,
//                                   fontWeight: f.semiBold
//                               ),
//                             ),
//                             SizedBox(width: 4),
//                             Icon(FeatherIcons.chevronRight, size: 14, color: Colors.white),
//                           ],
//                         ),
//                       ),
//                       decoration: BoxDecoration(
//                           color: c.blackMain,
//                           borderRadius: BorderRadius.circular(10)),
//                     ),
//                   ],
//                 ),
//                 if(urlImage?.length!=null)SizedBox(height: 8),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 0),
//                   child: Inter(text: post!, size: 12, color: c.postText, fontWeight: f.regular),
//                 ),
//                 if(urlImage?.length==null)SizedBox(height: 8),
//                 if(urlImage?.length==null)Row(
//                   children: [
//                     // SizedBox(width: 60),
//                     Inter(text: 'mention to', size: 11, color: c.blackMain, fontWeight: f.medium),
//                     SizedBox(width: 5),
//                     Container(
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 9, right: 4, top: 3, bottom: 3),
//                         child: Row(
//                           children: [
//                             Container(
//                               constraints: BoxConstraints(maxWidth: 160),
//                               child: Inter_Crop(
//                                   text: brand! + " " + product!,
//                                   size: 10,
//                                   color: Colors.white,
//                                   fontWeight: f.semiBold
//                               ),
//                             ),
//                             SizedBox(width: 4),
//                             Icon(FeatherIcons.chevronRight, size: 14, color: Colors.white),
//                           ],
//                         ),
//                       ),
//                       decoration: BoxDecoration(
//                           color: c.blackMain,
//                           borderRadius: BorderRadius.circular(10)),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 12),
//                 Row(
//                   children: [
//                     Icon(FeatherIcons.messageSquare, size:19, color: c.greyMain),
//                     SizedBox(width: 3),
//                     Inter(text: comment!.toString(), size: 11, color: c.greyMain, fontWeight: f.medium),
//                     Expanded(child: Container()),
//                     InkWell(
//                         onTap: () async {
//                           Map<String, String> data = {
//                             "favorite":id!
//                           };
//                           print(data);
//                           isFav = true;
//                           var idStorage = await storage.read(key: 'id');
//                           await networkHandler.post("/home/addFav/" + idStorage!, data);
//                           // Navigator.pushAndRemoveUntil(context, MaterialPageRoute
//                           //   (builder: (context)=>Navbar()), (route) => false);
//                         },
//                         child: Icon(FeatherIcons.heart, size:19, color: c.greyMain)
//                     ),
//                     SizedBox(width: 3),
//                     Inter(text: favorite!.toString(), size: 11, color: c.greyMain, fontWeight: f.medium),
//                     Expanded(child: Container()),
//                     Icon(FeatherIcons.share2, size:19, color: c.greyMain),
//                     Expanded(child: Container()),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 16),
//           Divider(
//             color: c.greyMain,
//             thickness: 0.5,
//             height: 0,
//           ),
//         ],
//       ),
//     );
//   }
// }

class ReviewPost extends StatelessWidget {
  String? name,postTime,username,brand,product,post;
  int? comment,favorite;
  double? rating;
  List? urlImage;
  ReviewPost({Key? key, this.name, this.postTime, this.username, this.brand, this.product, this.post, this.comment, this.favorite, this.rating, this.urlImage}) : super(key: key);

  final _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 23, right: 4),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
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
                          size: 13,
                          color: Colors.black,
                        ),
                        SizedBox( width: 5 ),
                        Inter(text: postTime!, size: 11, color: c.graySub2, fontWeight: f.medium)
                      ],
                    ),
                    Inter(text: username!, size: 11, color: c.textUsername, fontWeight: f.medium),
                    SizedBox( height: 7 ),
                    Row(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 7, left: 7, top: 4, bottom: 4),
                            child: Inter(
                                text: "Beauty Advisor",
                                size: 8,
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
                                size: 8,
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
                    icon: Icon(Boxicons.bx_dots_vertical_rounded, size: 30, color: c.greyMain),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 80, right: 23),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(urlImage?.length==1)Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        child: Container(
                          key: _key,
                          height: 285,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: c.graySub2,
                              image: DecorationImage(
                                  image: NetworkImage(urlImage![0]),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                            urlImage: urlImage,
                          )));
                        },
                      ),
                    ),
                  ],
                ),
                if(urlImage?.length==null)Container(),
                if(urlImage?.length==2)Row(
                  children: [
                    // SizedBox(width: 60),
                    Expanded(
                      child: GestureDetector(
                        child: Container(
                          height: 140,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  bottomLeft: Radius.circular(12)
                              ),
                              color: c.graySub2,
                              image: DecorationImage(
                                  image: NetworkImage(urlImage![0]),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                            urlImage: urlImage,
                          )));
                        },
                      ),
                    ),
                    SizedBox( width: 5 ),
                    Expanded(
                      child: GestureDetector(
                        child: Container(
                          height: 140,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(12),
                                  bottomRight: Radius.circular(12)
                              ),
                              color: c.graySub2,
                              image: DecorationImage(
                                  image: NetworkImage(urlImage![1]),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                              urlImage: urlImage,
                              index: 2
                          )));
                        },
                      ),
                    )
                  ],
                ),
                if(urlImage?.length==3)Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            child: Container(
                              key: _key,
                              height: 140,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: c.graySub2,
                                  image: DecorationImage(
                                      image: NetworkImage(urlImage![0]),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                urlImage: urlImage,
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
                              height: 140,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12)
                                  ),
                                  color: c.graySub2,
                                  image: DecorationImage(
                                      image: NetworkImage(urlImage![1]),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                urlImage: urlImage,
                              )));
                            },
                          ),
                        ),
                        SizedBox( width: 5 ),
                        Expanded(
                          child: GestureDetector(
                            child: Container(
                              height: 140,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(12),
                                      bottomRight: Radius.circular(12)
                                  ),
                                  color: c.graySub2,
                                  image: DecorationImage(
                                      image: NetworkImage(urlImage![2]),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                  urlImage: urlImage,
                                  index: 2
                              )));
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                if(urlImage?.length==4)Column(
                  children: [
                    Row(
                      children: [
                        // SizedBox(width: 60),
                        Expanded(
                          child: GestureDetector(
                            child: Container(
                              height: 140,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12)
                                  ),
                                  color: c.graySub2,
                                  image: DecorationImage(
                                      image: NetworkImage(urlImage![0]),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                urlImage: urlImage,
                              )));
                            },
                          ),
                        ),
                        SizedBox( width: 5 ),
                        Expanded(
                          child: GestureDetector(
                            child: Container(
                              height: 140,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(12),
                                      bottomRight: Radius.circular(12)
                                  ),
                                  color: c.graySub2,
                                  image: DecorationImage(
                                      image: NetworkImage(urlImage![1]),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                  urlImage: urlImage,
                                  index: 2
                              )));
                            },
                          ),
                        )
                      ],
                    ),
                    SizedBox( height: 5 ),
                    Row(
                      children: [
                        // SizedBox(width: 60),
                        Expanded(
                          child: GestureDetector(
                            child: Container(
                              height: 140,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12)
                                  ),
                                  color: c.graySub2,
                                  image: DecorationImage(
                                      image: NetworkImage(urlImage![2]),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                urlImage: urlImage,
                              )));
                            },
                          ),
                        ),
                        SizedBox( width: 5 ),
                        Expanded(
                          child: GestureDetector(
                            child: Container(
                              height: 140,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(12),
                                      bottomRight: Radius.circular(12)
                                  ),
                                  color: c.graySub2,
                                  image: DecorationImage(
                                      image: NetworkImage(urlImage![3]),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewPhotoWidget(
                                  urlImage: urlImage,
                                  index: 2
                              )));
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                if(urlImage?.length!=null)SizedBox(height: 10),
                if(urlImage?.length!=null)Row(
                  children: [
                    // SizedBox(width: 60),
                    Inter(text: 'reviewed', size: 11, color: c.blackMain, fontWeight: f.medium),
                    SizedBox(width: 5),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 9, right: 4,top: 2.5,bottom: 2.5),
                        child: Row(
                          children: [
                            // Inter(
                            //     text: brand!,
                            //     size: 10,
                            //     color: Colors.white,
                            //     fontWeight: f.semiBold
                            // ),
                            // SizedBox(
                            //     height: 20,
                            //     child: VerticalDivider(
                            //       color: Colors.white,
                            //       thickness: 1.5,
                            //       indent: 3.3,
                            //       endIndent: 3.3,
                            //       width: 13,
                            //     )
                            // ),
                            Container(
                              constraints: BoxConstraints(maxWidth: 125),
                              child: Inter_Crop(
                                  text: brand!+" "+product!,
                                  size: 10,
                                  color: Colors.white,
                                  fontWeight: f.semiBold
                              ),
                            ),
                            SizedBox(width: 7),
                            Inter(
                                text: rating!.toString(),
                                size: 10,
                                color: Colors.white,
                                fontWeight: f.semiBold
                            ),
                            SizedBox(width: 2),
                            Icon(Boxicons.bxs_star, size: 13, color: c.yellowMain),
                            SizedBox(width: 4),
                            Icon(FeatherIcons.chevronRight, size: 14, color: Colors.white),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: c.blackMain,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ],
                ),
                if(urlImage?.length!=null)SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Inter(text: post!, size: 12, color: c.postText, fontWeight: f.regular),
                ),
                if(urlImage?.length==null)SizedBox(height: 12),
                if(urlImage?.length==null)Row(
                  children: [
                    // SizedBox(width: 60),
                    Inter(text: 'reviewed', size: 11, color: c.blackMain, fontWeight: f.medium),
                    SizedBox(width: 5),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 9, right: 4,top: 2.5,bottom: 2.5),
                        child: Row(
                          children: [
                            // Inter(
                            //     text: brand!,
                            //     size: 10,
                            //     color: Colors.white,
                            //     fontWeight: f.semiBold
                            // ),
                            // SizedBox(
                            //     height: 20,
                            //     child: VerticalDivider(
                            //       color: Colors.white,
                            //       thickness: 1.5,
                            //       indent: 3.3,
                            //       endIndent: 3.3,
                            //       width: 13,
                            //     )
                            // ),
                            Container(
                              constraints: BoxConstraints(maxWidth: 125),
                              child: Inter_Crop(
                                  text: brand!+" "+product!,
                                  size: 10,
                                  color: Colors.white,
                                  fontWeight: f.semiBold
                              ),
                            ),
                            SizedBox(width: 7),
                            Inter(
                                text: rating!.toString(),
                                size: 10,
                                color: Colors.white,
                                fontWeight: f.semiBold
                            ),
                            SizedBox(width: 2),
                            Icon(Boxicons.bxs_star, size: 13, color: c.yellowMain),
                            SizedBox(width: 4),
                            Icon(FeatherIcons.chevronRight, size: 14, color: Colors.white),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: c.blackMain,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Icon(FeatherIcons.messageSquare, size:19, color: c.greyMain),
                    SizedBox(width: 3),
                    Inter(text: comment!.toString(), size: 11, color: c.greyMain, fontWeight: f.medium),
                    Expanded(child: Container()),
                    Icon(FeatherIcons.heart, size:19, color: c.greyMain),
                    SizedBox(width: 3),
                    Inter(text: favorite!.toString(), size: 11, color: c.greyMain, fontWeight: f.medium),
                    Expanded(child: Container()),
                    Icon(FeatherIcons.share2, size:19, color: c.greyMain),
                    Expanded(child: Container()),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Divider(
            color: c.greyMain,
            thickness: 0.5,
            height: 0,
          ),
        ],
      ),
    );
  }
}


