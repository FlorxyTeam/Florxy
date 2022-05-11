import 'package:Florxy/widgets/fontWeight.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:boxicons/boxicons.dart';
import 'package:Florxy/pages/productoverview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Florxy/NetworkHandler.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:Florxy/CompareProduct/compare1.dart';
import 'package:Florxy/CompareProduct/compare2.dart';



class comparepage extends StatefulWidget {
  String? id;
  final int currentState;
  comparepage({Key? key, this.id, required this.currentState}) : super(key: key);

  @override
  _comparepageState createState() => _comparepageState();
}

class _comparepageState extends State<comparepage> {
  List pages = [ProductOverview()];
  int _currentIndex = 0;
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();
  String? num;

  @override
  void fetchData() async {
    print(widget.id);
    await storage.write(key: "p_id", value: widget.id);
    await networkHandler.get("/product/" + widget.id!);

  }

  fetchNum() async{
    num = await storage.read(key: "num");
    return num;
  }

  @override
  void initState()  {
      fetchData();

    // TODO: implement initState
    super.initState();
    _currentIndex = widget.currentState;

  }

  @override
  void dispose() {
   super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          pages[_currentIndex],
          Positioned(
              bottom: 0,
              left: 0,
              child: InkWell(
                onTap: () {
                },
                child: Container(
                  width: size.width,
                  height: Theme.of(context).platform == TargetPlatform.android
                      ? 95
                      : 115,
                  decoration: BoxDecoration(
                      color: c.greenMain,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(39),
                          topRight: Radius.circular(39))),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 20),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 19,
                              width: MediaQuery.of(context).size.width / 2.3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  color: c.textWhite),
                              child: TextButton(
                                onPressed: () async {
                                  var x = await storage.read(key: "p_id1");
                                  var y = await storage.read(key: "p_id2");
                                  var z = await storage.read(key: "p_id3");
                                  var numoflist = await storage.read(key: "num");
                                  if (numoflist == null){

                                  }
                                  setState(() {
                                    if( x == null && x != widget.id){
                                      storage.write(key: "p_id1", value: widget.id);
                                    numoflist = (int.parse(numoflist!)+1).toString();
                                      storage.write(key: "num", value: numoflist!);
                                    }else if(y == null && x != widget.id){
                                      storage.write(key: "p_id2", value: widget.id);
                                      numoflist = (int.parse(numoflist!)+1).toString();
                                      storage.write(key: "num", value: numoflist!);
                                    }else if(z == null && x != widget.id && y != widget.id){
                                      storage.write(key: "p_id3", value: widget.id);
                                      numoflist = (int.parse(numoflist!)+1).toString();
                                      storage.write(key: "num", value: numoflist!);
                                    }else{
                                      print("x: " + x.toString());
                                      print("y: " + y.toString());
                                      print("z: " + z.toString());
                                      print("full");
                                    }
                                    //
                                    // num = (await storage.read(key: "num")).toString();
                                    // print("num "+ num.toString());

                                    if( x != null && y == null && z == null ){


                                    }else if( x != null && y == null && z == null ){

                                    }else if( x != null && y != null && z != null ){

                                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => compare1(id1: x, id2: y, id3: z,)));


                                    }
                                  });

                                  },
                                child: Inter(
                                    text: "ADD TO LIST",
                                    letterSpacing: 2,
                                    size: 15,
                                    color: Color(0xFF32A060),
                                    fontWeight: f.extraBold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2, left: 20),
                            child: Roboto(
                                text: "add product to compare",
                                size: 13,
                                color: Color(0xFFFFFFFF).withOpacity(0.68),
                                fontWeight: f.medium),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      Roboto(
                          text: "in list",
                          size: 16,
                          letterSpacing: 1.2,
                          color: Color(0xFFFFFFFF).withOpacity(0.68),
                          fontWeight: f.bold),
                      SizedBox(width: 6),
                      Container(
                        height: MediaQuery.of(context).size.height / 21,
                        width: MediaQuery.of(context).size.height / 21,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                          color: Color(0xFFFFFFFF).withOpacity(0.68),
                        ),
                        child: Center(
                          child: FutureBuilder(
                            future: fetchNum(),
                              builder: (context, snapshot) =>
                            Inter(
                                text: num.toString(),
                                size: 20,
                                color: Color(0xFF0B391E),
                                fontWeight: f.extraBold),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }


}
