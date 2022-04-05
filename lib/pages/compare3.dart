import 'package:Florxy/NetworkHandler.dart';
import 'package:Florxy/pages/Loadingscreen.dart';
import 'package:Florxy/widgets/button.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../postProvider.dart';




class ModalMentionPost {
  static Dialog_Settings(context, x,y,z) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.92,
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(33.0),
            topRight: const Radius.circular(33.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 78,
                  child: Divider(
                    height: 0,
                    color: c.greyMain,
                    thickness: 3.5,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Expanded(child: Product(id1: x, id2: y, id3: z)),
              Padding(
                  padding: EdgeInsets.only(left: 50,right: 50,bottom: 50),
                  child: Column(
                    children: [

                      InkWell(

                        onTap: (){

                        },
                        child: GreenButton(
                          text: 'COMPARE',
                          size: 18,
                          color: c.textWhite,
                          height: 60,
                        ),
                      )
                    ],
                  )
              ),


            ],
          ),
        ),
      ),
    );
  }
}







class Product extends StatefulWidget {
  String? id1, id2, id3;
  Product({Key? key, this.id2, this.id1, this.id3}) : super(key: key);


  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
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
      body: Container(
        color: Colors.white,
        child: Consumer<PostProvider>(builder: (context,model,_) => FutureBuilder(
          future: model.fetchCompare3(),
          builder: (context,snapshot) => ListView.builder(
            // scrollDirection: Axis.vertical,
            itemCount: model.com3?.length??0,
            itemBuilder: (context,int index){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Column(
                  children: [
                    SizedBox(height: 15),
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
                                      image: NetworkImage(  model.com3![index]['p_img']),
                                      fit: BoxFit.contain
                                  )
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Container(
                            width: 190,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10, left: 10, top: 5, bottom: 5),
                                    child: Inter(
                                        text:model.com3![index]['p_brand'],
                                        size: 13,
                                        color: Colors.white,
                                        fontWeight: f.semiBold),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Color(0xFF9FA8A3),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                PoppinsLeft(text:  model.com3![index]['p_name'], size: 15, color: Color(0xFF053118), fontWeight: f.semiBold),
                                SizedBox(height: 10),
                                Roboto(text: model.com3![index]['p_desc'].toString().substring(0, 70) + "...", size: 12,  color: Color(0xFF9D9D9D), fontWeight: f.regular)
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: InkWell(
                            onTap: () {


                            },
                            child:
                            Icon(Icons.close_rounded, color: c.redMain, size: 24),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 15),
                    Divider(
                      color: c.greyMain,
                      thickness: 0.5,
                      height: 0,
                    ),
                  ],
                ),
              );
            },
          ),
        )),
      ),
    );
  }
}


