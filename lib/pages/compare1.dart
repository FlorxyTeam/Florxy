import 'package:Florxy/Model/productModel.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:Florxy/NetworkHandler.dart';

import '../postProvider.dart';


class compare1 extends StatefulWidget {
  String? id1, id2, id3;
  compare1({Key? key, this.id2, this.id1, this.id3}) : super(key: key);

  @override
  _compare1State createState() => _compare1State();
}

class _compare1State extends State<compare1> {

  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();
  @override
  void fetchData() async {
    await networkHandler.get("/product/compare/" + widget.id1!+"/"+widget.id2!+"/" +widget.id3!);

  }

  @override
  void initState() {
    fetchData();
    Provider.of<PostProvider>(context, listen: false).fetchCompare3();
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back_ios_new_rounded),
                      color: c.blackMain,
                      iconSize: 22,
                      onPressed: () => Navigator.of(context).pop()),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Poppins(
                      text: "Compare 3 products",
                      color: c.blackMain,
                      fontWeight: f.semiBold,
                      size: 25,
                    ),
                  ),
                ],
              ),
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
                                  model.com3![index]['mention'],
                                  model.com3![index]['p_brand'],
                                  model.com3![index]['ing_name']
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

  Widget buildCard_brand_Mention(String p_name, String p_img, String id, int mention, String p_brand, List ing_name) =>
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
                                child: ListView.builder(
                                  itemCount: ing_name.length,
                                  itemBuilder: (context,int index){

                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Roboto(text: ing_name[index], size: 13, color: Color(0xFF053118).withOpacity(0.8), fontWeight:f.regular),
                                        SizedBox(height: 10)
                                      ],
                                    );
                                  },
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                ),
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
