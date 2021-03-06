import 'package:Florxy/Model/mentionProductModel.dart';
import 'package:Florxy/Model/productModel.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:Florxy/NetworkHandler.dart';

import '../postProvider.dart';


class compare1 extends StatefulWidget {
  String? id1, id2, id3;
  List<MentionProductModel>? product;
  compare1({Key? key, this.id2, this.id1, this.id3, this.product}) : super(key: key);

  @override
  _compare1State createState() => _compare1State();
}

class _compare1State extends State<compare1> {
  List<MentionProductModel> compare3 = [];
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();
  @override
  void fetchData() async {
    setState(() {
      compare3 = widget.product!;
    });
    var i = 0;
    var l = 1 ;
    for(i = 0; i < compare3.length; i++){
      print(compare3[i].id);
      if( compare3[i].id != null){
        await storage.write(key: "p_id${l}", value: compare3[i].id);
        print(compare3[i].id);
        l = l+1;
      }


    }
    var p1 = await storage.read(key: "p_id1");
    var p2 = await storage.read(key: "p_id2");
    var p3 = await storage.read(key: "p_id3");
    await networkHandler.get("/product/compare3/" + p1!+"/"+p2!+"/" +p3!);

  }

  @override
  void initState() {
    fetchData();
    Provider.of<PostProvider>(context, listen: false).fetchCompare3();
    // TODO: implement initState
    super.initState();

  }


  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            Theme.of(context).platform == TargetPlatform.android ? 95 : 76.0),
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
            centerTitle: false,
            titleSpacing: 0,
            backgroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(0),
                )),
            bottom: PreferredSize(
              preferredSize: Size(0, 0),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [

                    Column(
                      children: [
                        Poppins(
                          text: "     Comparing",
                          size: 18,
                          color: c.blackMain,
                          fontWeight: f.semiBold,
                        ),
                        Poppins(
                          text: "Products",
                          size: 18,
                          color: c.blackMain,
                          fontWeight: f.semiBold,
                        ),
                      ],
                    ),
                    Expanded(child: Container()),


                    Padding(
                      padding: EdgeInsets.only(top: Theme.of(context).platform==TargetPlatform.android?0.5:0, right: 10),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        icon: Icon(FeatherIcons.alertCircle),
                        iconSize: 20,
                        color: c.greenMain,
                        onPressed: () {
                          // Navigator.pop(context);
                        },
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: Theme.of(context).platform==TargetPlatform.android?0.5:0, right: 20),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        icon: Icon(Icons.keyboard_arrow_down_rounded),
                        iconSize: 35,
                        color: Colors.black,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),


                  ],
                ),
              ),
            ),
            // leading: Padding(
            //   padding: EdgeInsets.only(top: Theme.of(context).platform==TargetPlatform.android?17.5:0, left: 13),
            //   child: IconButton(
            //     padding: EdgeInsets.zero,
            //     constraints: BoxConstraints(),
            //     icon: Icon(FeatherIcons.chevronLeft),
            //     iconSize: 34,
            //     color: Colors.black,
            //     onPressed: () {
            //       Navigator.pop(context);
            //     },
            //   ),
            // ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [

                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  // color: c.redMain,
                  child: Consumer<PostProvider>(
                    builder: (context, model, _) => FutureBuilder(
                      future: model.fetchCompare3(),
                      builder: (context, snapshot) => ListView.separated(
                        padding: EdgeInsets.only(left: 28, right: 2),
                        itemCount: model.com3?.length ?? 0,
                        separatorBuilder: (context, _) => SizedBox(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            buildCard_brand_Mention(
                              model.com3![index]['p_name'],
                              model.com3![index]['p_img'],
                              model.com3![index]['_id'],
                              model.com3![index]['p_brand'],
                              model.com3![index]['p_desc'],
                              model.com3![index]['p_cate'],
                              model.com3![index]['ind_id'],
                              model.com3![index]['rating'].toDouble(),
                              model.com3![index]['numReview'],

                            ),
                      ),
                    ),
                  ),
                ),





                // Container(
                //   height: MediaQuery.of(context).size.height,
                //   width: MediaQuery.of(context).size.width,
                //   // color: c.redMain,
                //   child: Consumer<PostProvider>(
                //     builder: (context, model, _) => FutureBuilder(
                //       future: model.fetchCompare2(),
                //       builder: (context, snapshot) => ListView.separated(
                //         padding: EdgeInsets.only(left: 28, right: 2),
                //         itemCount: model.com2?.length ?? 0,
                //         separatorBuilder: (context, _) => SizedBox(),
                //         scrollDirection: Axis.horizontal,
                //         itemBuilder: (context, index) =>
                //             buildCard_brand_Mention(
                //               model.com2![index]['p_name'],
                //               model.com2![index]['p_img'],
                //               model.com2![index]['_id'],
                //
                //               model.com2![index]['p_brand'],
                //
                //             ),
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 5,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }



  Widget buildCard_brand_Mention(String p_name, String p_img, String id,  String p_brand, String p_desc, String p_cate, List ing, double rating, int numReview) =>
      Container(
        width: MediaQuery.of(context).size.width * 0.41,
        // height: MediaQuery.of(context).size.height ,
        child: Stack(
          children: [
            Center(
              child: InkWell(
                onTap: () {

                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.41,
                  // height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(

                    border: Border.all( color: c.greyMain,
                      width: 0.4,
                    ),

                    color: Colors.white,

                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0, right: 0, top: 7, bottom: 7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                          margin: EdgeInsets.only(top: 5, left: 5),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 10, left: 10, top: 5, bottom: 5),
                            child: Inter(
                                text:p_brand,
                                size: 12,
                                color: Colors.white,
                                fontWeight: f.semiBold),
                          ),
                          decoration: BoxDecoration(
                              color:  Color(0xFF32A060),
                              borderRadius: BorderRadius.circular(50)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width ,
                          decoration: BoxDecoration(

                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),

                            ),
                            image: DecorationImage(
                              image:NetworkImage(p_img),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        Container(
                          height: 45,
                          padding: const EdgeInsets.only(top: 5, left: 7),
                          width: MediaQuery.of(context).size.width * 0.34,
                          child: Text(
                            p_name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: f.semiBold,
                                color: Color(0xFF0254231)),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(),
                          width: MediaQuery.of(context).size.width+4,
                          child: Divider(
                            height: 0,
                            color: c.greyMain,
                            thickness: 0.4,
                          ),
                        ),
                        Container(
                          // height: 45,
                          padding: const EdgeInsets.only(top: 5, left: 7),
                          width: MediaQuery.of(context).size.width * 0.34,
                          child: Text(
                            p_desc,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: f.semiBold,
                                color: Color(0xFF0254231)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(),
                          width: MediaQuery.of(context).size.width+4,
                          child: Divider(
                            height: 0,
                            color: c.greyMain,
                            thickness: 0.4,
                          ),
                        ),
                        Container(
                          // height: 45,
                          padding: const EdgeInsets.only(top: 5, left: 7),
                          width: MediaQuery.of(context).size.width * 0.34,
                          child: Text(
                            p_cate,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: f.semiBold,
                                color: Color(0xFF0254231)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(),
                          width: MediaQuery.of(context).size.width+4,
                          child: Divider(
                            height: 0,
                            color: c.greyMain,
                            thickness: 0.4,
                          ),
                        ),
                        Container(
                          // height: 45,
                          padding: const EdgeInsets.only(top: 5, left: 7),
                          width: MediaQuery.of(context).size.width * 0.34,
                          child: Text(
                            "Higlight",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: f.semiBold,
                                color: Color(0xFF0254231)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(),
                          width: MediaQuery.of(context).size.width+4,
                          child: Divider(
                            height: 0,
                            color: c.greyMain,
                            thickness: 0.4,
                          ),
                        ),
                        Container(
                          // height: 45,
                          padding: const EdgeInsets.only(top: 5, left: 7),
                          width: MediaQuery.of(context).size.width * 0.34,
                          child: Text(
                            "Beware",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: f.semiBold,
                                color: Color(0xFF0254231)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(),
                          width: MediaQuery.of(context).size.width+4,
                          child: Divider(
                            height: 0,
                            color: c.greyMain,
                            thickness: 0.4,
                          ),
                        ),
                        numReview !=0 ?
                        Container(
                          // height: 45,
                          padding: const EdgeInsets.only(top: 5, left: 7),
                          width: MediaQuery.of(context).size.width * 0.34,
                          child: Text(
                            rating.toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: f.semiBold,
                                color: Color(0xFF0254231)),
                          ),
                        ):Container(
                          // height: 45,
                          padding: const EdgeInsets.only(top: 5, left: 7),
                          width: MediaQuery.of(context).size.width * 0.34,
                          child: Text(
                            "No review",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: f.semiBold,
                                color: Color(0xFF0254231)),
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: MediaQuery.removePadding(
                              context: context,
                              removeTop: true,
                              removeBottom: true,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                // child: ListView.builder(
                                //   itemCount: ing_name.length,
                                //   itemBuilder: (context,int index){
                                //
                                //     return Column(
                                //       crossAxisAlignment: CrossAxisAlignment.start,
                                //       children: [
                                //         Roboto(text: ing_name[index], size: 13, color: Color(0xFF053118).withOpacity(0.8), fontWeight:f.regular),
                                //         SizedBox(height: 10)
                                //       ],
                                //     );
                                //   },
                                //   shrinkWrap: true,
                                //   physics: NeverScrollableScrollPhysics(),
                                // ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
