import 'package:Florxy/Model/productModel.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/material.dart';

import '../Model/profileModel.dart';
import '../NetworkHandler.dart';

class SavedPro extends StatefulWidget {
  String? username;
  SavedPro({Key? key, this.username}) : super(key: key);

  @override
  _SavedProState createState() => _SavedProState();
}

class _SavedProState extends State<SavedPro> {
  final networkHandler = NetworkHandler();
  ProfileModel profileModel = ProfileModel(
    id: '',
    username: '',
    fullname: '',
    DOB: '',
    professor: '',
    influencer: '',
    bio: '',
    img: '',
    pinned: '',
    notification: [],
    saveproduct: [],
    favorite: [],
    listfollower: [],
    listfollowing: [],
  );
  List save = [];

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    fetchData();
  }
  
  void fetchData() async {
    var response = await networkHandler.get("/profile/getSaveProduct/" + widget.username!);
    setState(() {
      profileModel = ProfileModel.fromJson(response['data']);
      save = profileModel.saveproduct;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 23, right: 23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Poppins(
                text: "All Product",
                size: 15,
                color: c.blackMain,
                fontWeight: f.semiBold),
            SizedBox(height: 10),
            ListView.builder(
              itemCount: save.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                Map saveProduct = save[index];
                return buildProoduct(
                    '${saveProduct['p_brand']}',
                    '${saveProduct['_id']}',
                    '${saveProduct['p_name']}',
                    '${saveProduct['p_desc']}',
                    '${saveProduct['p_img']}',
                    true,
                    widget.username!
                );
              }
            )
          ],
        ),
      ),
    );
  }

  Widget buildProoduct(String brand, String id, String product, String desc, String img, bool isSave, String username) => Column(
    children: [
      Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 14),
                  Center(
                    child: Container(
                      height: 100,
                      width: 70,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          image: DecorationImage(
                              image: NetworkImage(img),
                              fit: BoxFit.contain
                          )
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                child: PoppinsLeft(text: brand, size: 11, color: Colors.white, fontWeight: f.semiBold),
                              ),
                            decoration: BoxDecoration(
                              color: c.greySub,
                              borderRadius: BorderRadius.circular(50)
                            ),
                          ),
                          SizedBox(height: 2),
                          PoppinsLeft(text: product, size: 13, color: c.textBlack, fontWeight: f.semiBold),
                          SizedBox(height: 15),
                          Roboto_Crop(text: desc, size: 12, color: c.greySub, fontWeight: f.regular)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: isSave?InkWell(
                      onTap: () async{
                        final networkHandler = NetworkHandler();
                        Map<String, String> data = {
                          "unSave": id
                        };
                        await networkHandler.post("/profile/unSaveProduct/"+username, data);
                        setState(() {
                          isSave = false;
                        });
                      },
                      child: Icon(Icons.bookmark_rounded,
                        color:c.greenMain,
                        size: 25,
                      ),
                    ):
                    Icon(Icons.bookmark_rounded,
                      color:c.graySub2,
                      size: 25,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: c.shadow.withOpacity(0.1),
              spreadRadius: -15,
              blurRadius: 41,
              offset: Offset(3, 7), // changes position of shadow
            ),
          ],
        ),
      ),
      SizedBox(height: 18)
    ],
  );
}
