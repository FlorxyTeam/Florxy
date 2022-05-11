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


class compare2 extends StatefulWidget {
  String? id1, id2;
  List<MentionProductModel>? product2;
  compare2({Key? key, this.id2, this.id1, this.product2}) : super(key: key);

  @override
  _compare2State createState() => _compare2State();
}

class _compare2State extends State<compare2> {
  List<MentionProductModel> compare2 = [];
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();
  @override
  void fetchData() async {
    setState(() {
      compare2 = widget.product2!;
    });
    var i = 0;
    var l = 1;
    for(i = 0; i < compare2.length; i++){
      print(compare2[i].id);
      if( compare2[i].id != null){
        await storage.write(key: "p_id${l}", value: compare2[i].id);
        print(compare2[i].id);
        l = l+1;
      }


    }
    var p1 = await storage.read(key: "p_id1");
    var p2 = await storage.read(key: "p_id2");
    // await networkHandler.get("/product/compare2/" + p1!+"/"+p2!);

  }

  @override
  void initState() {
    fetchData();
    Provider.of<PostProvider>(context, listen: false).fetchCompare2();
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            Theme.of(context).platform == TargetPlatform.android ? 105 : 86.0),
        child: Container(

          decoration: BoxDecoration(
            color: Colors.red,
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
            title: Padding(
              padding: const EdgeInsets.only(top: 48.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Poppins(
                    text: "Comparing",
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Row(
              //   children: [
              //     IconButton(
              //         icon: Icon(Icons.arrow_back_ios_new_rounded),
              //         color: c.blackMain,
              //         iconSize: 22,
              //         onPressed: () => Navigator.of(context).pop()),
              //     Padding(
              //       padding: const EdgeInsets.only(),
              //       child: Poppins(
              //         text: "Compare 2 products",
              //         color: c.blackMain,
              //         fontWeight: f.semiBold,
              //         size: 25,
              //       ),
              //     ),
              //   ],
              // ),
              // Container(
              //   padding: EdgeInsets.only(right: 28, left: 28),
              //   width: MediaQuery.of(context).size.width,
              //   child: Divider(
              //     height: 0,
              //     color: c.greyMain,
              //     thickness: 0.4,
              //   ),
              // ),
              SizedBox(
                height: 5,
              ),



              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.height,
                    // color: c.redMain,
                    child: Consumer<PostProvider>(
                      builder: (context, model, _) => FutureBuilder(
                        future: model.fetchCompare2(),
                        builder: (context, snapshot) => ListView.separated(
                          padding: EdgeInsets.only(left: 28, right: 2),
                          itemCount: model.com2?.length ?? 0,
                          separatorBuilder: (context, _) => SizedBox(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              buildCard_brand_Mention(
                                model.com2![index]['p_name'],
                                model.com2![index]['p_img'],
                                model.com2![index]['_id'],

                                model.com2![index]['p_brand'],

                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard_brand_Mention(String p_name, String p_img, String id,  String p_brand) =>
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
                    padding: const EdgeInsets.only(left: 5, right: 5, top: 7, bottom: 7),
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
                          width: MediaQuery.of(context).size.width,
                          child: Divider(
                            height: 0,
                            color: c.greyMain,
                            thickness: 0.4,
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
