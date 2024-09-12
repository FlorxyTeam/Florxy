import 'package:Florxy/pages/reportpage.dart';
import 'package:Florxy/pages/searchpost.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:boxicons/boxicons.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/button.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import '../Model/profileModel.dart';
import '../NetworkHandler.dart';
import '../postProvider.dart';
import 'help.dart';
import 'navbar.dart';


class ReportProblem extends StatefulWidget {

  @override
  _ReportProblemState createState() => _ReportProblemState();
}

class _ReportProblemState extends State<ReportProblem> {
  TextEditingController _problem = TextEditingController();
  bool circular = false;
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();
  final _globalkey = GlobalKey<FormState>();
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


  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  void fetchData() async{
    var response = await networkHandler.get("/profile/getData");
    setState(() {
      profileModel = ProfileModel.fromJson(response["data"]);
      circular = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(77.0),
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
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(26),
                  )),
              title: Padding(
                padding: const EdgeInsets.only(top: 18.5, left: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: Icon(Icons.arrow_back_ios_new_rounded),
                        color: c.blackMain,
                        iconSize: 30,
                        onPressed: () => Navigator.of(context).pop()),
                    Poppins(
                        text: "What's your problem?",
                        size: 17,
                        color: c.blackSub,
                        fontWeight: f.bold
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.close_rounded,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Color(0xffF9F9F9),
        body: Stack(
          children: [
            SafeArea(
              child: Container(
                padding: EdgeInsets.only(left: 40, right: 40, top: 20),
                child: Column(
                  children:[
                    Padding(
                      padding: const EdgeInsets.only(left: 0, right: 0, top: 30),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Poppins(
                                text: 'Detail',
                                size: 18,
                                color: c.blackSub,
                                fontWeight: f.bold),
                          ),
                          SizedBox(height: 30),
                          Container(
                            height: 90,
                            width: MediaQuery.of(context).size.width-90,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(13.0)),
                            ),
                            child: TextFormField(
                              maxLines: 5,
                              controller: _problem,
                              decoration: InputDecoration(
                                hintText: 'You can tell us about your problem here ...',
                                hintStyle: TextStyle(fontSize: 14, color: c.graySub2, fontWeight: f.regular),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                  borderSide: BorderSide(color: c.graySub2.withOpacity(0), width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                  borderSide: BorderSide(color: c.greyMain, width: 2),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 30,
                child: Column(
                  children: [

                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.only(left: 40,right: 40),
                        child: GestureDetector(
                          onTap: () async {
                            Map<String, String> data = {
                              "username": profileModel.username,
                              "body" : _problem.text,
                            };
                            var response = await networkHandler.post("/home/problem", data);
                            print(response);
                            setState(() {

                            });
                            Navigator.pop(context);
                          },
                          child: GreyButton(
                            text: 'SUBMIT',
                            size: 13,
                            color: c.textWhite,
                            height: 60,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
            )
          ],
        )
    );
  }
}