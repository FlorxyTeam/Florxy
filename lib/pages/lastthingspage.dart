import 'package:Florxy/widgets/button.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_tags/flutter_tags.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';

class LastThingPage extends StatefulWidget {
  const LastThingPage({Key? key}) : super(key: key);

  @override
  _LastThingPageState createState() => _LastThingPageState();
}

class _LastThingPageState extends State<LastThingPage> {
  List<String> tagsList = ['apple', 'banana', 'orange', 'kiwi', ''];
  List<String> selectedTags = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      body: Stack(
        children: [
          SafeArea(
              child: Container(
                padding: const EdgeInsets.only(left: 35, right: 35, top: 30),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Inter(
                                text: 'JUST ONE',
                                size: 32,
                                color: c.greenMain,
                                fontWeight: f.bold,
                              ),
                              SizedBox(height: 4),
                              Inter(
                                text: 'LAST THINGS',
                                size: 32,
                                color: c.greenMain,
                                fontWeight: f.bold,
                              ),
                            ],
                          ),
                          Inter(
                            text: 'SKIP',
                            size: 14,
                            color: c.greyMain,
                            fontWeight: f.semiBold,
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              )
          ),
          Positioned(
              bottom: 50,
              child: Column(
                children: [
                  Center(
                      child: Roboto(text: 'By continuing, you agree to Florxy’s Terms & Conditions\nand Pricacy Policy.', size: 11.5, color: Color(0xFFAFC8A9), fontWeight: f.medium)
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.only(left: 45,right: 45),
                      child: GestureDetector(
                        onTap: () {

                        },
                        child: GreenButton(
                          text: 'FINISH!',
                          size: 16,
                          color: c.textWhite,
                          height: 60,
                        ),
                      ),
                    ),
                  )],
              )
          )
        ],
      ),
    );
  }
}
