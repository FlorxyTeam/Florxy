import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:boxicons/boxicons.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ViewPhotoWidget extends StatefulWidget {
  final PageController pageController;
  final int index;
  List? urlImage;
  ViewPhotoWidget({Key? key, this.urlImage, this.index=0}) : pageController = PageController(initialPage: index);

  @override
  _ViewPhotoState createState() => _ViewPhotoState();
}

class _ViewPhotoState extends State<ViewPhotoWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(top: Theme.of(context).platform==TargetPlatform.android?17.5:0),
          child: IconButton(
            icon: Icon(FeatherIcons.chevronLeft),
            iconSize: 34,
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: Theme.of(context).platform==TargetPlatform.android?17.5:0),
            child: IconButton(
              icon: Icon(Boxicons.bx_dots_vertical_rounded),
              iconSize: 30,
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(FeatherIcons.chevronLeft, size: 30, color: Colors.white),
              Icon(Boxicons.bx_dots_vertical_rounded, size: 30, color: Colors.white),
            ],
          ),
          PhotoViewGallery.builder(
            pageController: widget.pageController,
              itemCount: widget.urlImage!.length,
              builder: (context,index) {
                final urlImage = widget.urlImage![index];
                return PhotoViewGalleryPageOptions(
                    imageProvider: NetworkImage(urlImage),
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: PhotoViewComputedScale.contained*4
                );
              }
          ),
          Positioned(
            bottom: 60,
            left: 30,
            right: 30,
            child: Container(
              child: Row(
                children: [
                  Icon(FeatherIcons.messageSquare, size:21, color: Colors.white),
                  SizedBox(width: 3),
                  Inter(text: 566.toString(), size: 13, color: Colors.white, fontWeight: f.medium),
                  Expanded(child: Container()),
                  Icon(FeatherIcons.heart, size:21, color: Colors.white),
                  SizedBox(width: 3),
                  Inter(text: 1284.toString(), size: 13, color: Colors.white, fontWeight: f.medium),
                  Expanded(child: Container()),
                  Icon(FeatherIcons.share2, size:21, color: Colors.white),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class View1PhotoWidget extends StatefulWidget {
  final PageController pageController;
  final int index;
  String? urlImage;
  View1PhotoWidget({Key? key, this.urlImage, this.index = 0}) : pageController = PageController(initialPage: index);

  @override
  _View1PhotoState createState() => _View1PhotoState();
}

class _View1PhotoState extends State<View1PhotoWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: c.blackMain,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(top: Theme.of(context).platform==TargetPlatform.android?17.5:0),
          child: IconButton(
            icon: Icon(FeatherIcons.chevronLeft),
            iconSize: 34,
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: Theme.of(context).platform==TargetPlatform.android?17.5:0),
            child: IconButton(
              icon: Icon(Boxicons.bx_dots_vertical_rounded),
              iconSize: 30,
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(FeatherIcons.chevronLeft, size: 30, color: Colors.white),
              Icon(Boxicons.bx_dots_vertical_rounded, size: 30, color: Colors.white),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              color: Colors.white.withOpacity(0),
              width: MediaQuery.of(context).size.width-200,
              height: MediaQuery.of(context).size.height-200,
              child: ClipRRect(
                child: CachedNetworkImage(imageUrl: widget.urlImage!,fit: BoxFit.fitWidth,errorWidget: (context, url, error) => Container(),),
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            left: 30,
            right: 30,
            child: Container(
              child: Row(
                children: [
                  Icon(FeatherIcons.messageSquare, size:21, color: Colors.white),
                  SizedBox(width: 3),
                  Inter(text: 566.toString(), size: 13, color: Colors.white, fontWeight: f.medium),
                  Expanded(child: Container()),
                  Icon(FeatherIcons.heart, size:21, color: Colors.white),
                  SizedBox(width: 3),
                  Inter(text: 1284.toString(), size: 13, color: Colors.white, fontWeight: f.medium),
                  Expanded(child: Container()),
                  Icon(FeatherIcons.share2, size:21, color: Colors.white),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
