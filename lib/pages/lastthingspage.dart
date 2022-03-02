import 'dart:math';

import 'package:Florxy/widgets/TagState.dart';
import 'package:Florxy/widgets/button.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'navbar.dart';

class LastThingPage extends StatefulWidget {
  const LastThingPage({Key? key}) : super(key: key);


  @override
  _LastThingPageState createState() => _LastThingPageState();
}

class _LastThingPageState extends State<LastThingPage> {
  final controller = Get.put(TagStateController());
  final textController = TextEditingController();
  var suggestTag = [
    'Wrinkles',
    'Moisturizes the Skin',
    'Dark Spots',
    'Pores',
    'Crow’s feet',
    'Sunburn',
    'Acne'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      body: Stack(
        children: [
          // SafeArea(
          //     child: Container(
          //       padding: const EdgeInsets.only(left: 35, right: 35, top: 30),
          //       child: Column(
          //         children: [
          //           Container(
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Inter(
          //                       text: 'JUST ONE',
          //                       size: 32,
          //                       color: c.greenMain,
          //                       fontWeight: f.bold,
          //                     ),
          //                     SizedBox(height: 4),
          //                     Inter(
          //                       text: 'LAST THINGS',
          //                       size: 32,
          //                       color: c.greenMain,
          //                       fontWeight: f.bold,
          //                     ),
          //                   ],
          //                 ),
          //                 Expanded(child: Container()),
          //                 GestureDetector(
          //                   onTap: (){
          //                     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Navbar()), (route) => false);
          //                   },
          //                   child: Inter(
          //                     text: 'SKIP',
          //                     size: 14,
          //                     color: c.greyMain,
          //                     fontWeight: f.semiBold,
          //                   ),
          //                 ),
          //                 // Column(
          //                 //   children: [
          //                 //     TypeAheadField(
          //                 //       textFieldConfiguration: TextFieldConfiguration(
          //                 //         controller: textController,
          //                 //         onEditingComplete: () {
          //                 //           controller.listTags.add(textController.text);
          //                 //           textController.clear();
          //                 //         },
          //                 //         autofocus: false,
          //                 //         decoration: InputDecoration(
          //                 //           filled: true,
          //                 //           fillColor: Colors.white,
          //                 //           contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          //                 //           hintText: 'You can type here',
          //                 //           hintStyle: TextStyle(
          //                 //               fontSize: 14,
          //                 //               color: c.graySub2,
          //                 //               fontWeight: f.medium),
          //                 //         )
          //                 //       ),
          //                 //       suggestionsCallback: (String pattern) {
          //                 //         return suggestTag.where((element) => element.toLowerCase().contains(pattern.toLowerCase()));
          //                 //       },
          //                 //       itemBuilder: (BuildContext context, String itemData) {
          //                 //         return ListTile(
          //                 //           title: Roboto(text: itemData, color: Colors.black, fontWeight: f.medium, size: 12,)
          //                 //         );
          //                 //       },
          //                 //       onSuggestionSelected: (String sugesstion) => controller.listTags.add(sugesstion),
          //                 //     )
          //                 //   ],
          //                 // )
          //               ],
          //             ),
          //           ),
          //         ],
          //       ),
          //     )
          // ),
          SafeArea(
           child:
              Padding(
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
                          Expanded(child: Container()),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Navbar(currentState: 0)), (route) => false);
                            },
                            child: Inter(
                              text: 'SKIP',
                              size: 14,
                              color: c.greyMain,
                              fontWeight: f.semiBold,
                            ),
                          ),
                          // Column(
                          //   children: [
                          //     TypeAheadField(
                          //       textFieldConfiguration: TextFieldConfiguration(
                          //         controller: textController,
                          //         onEditingComplete: () {
                          //           controller.listTags.add(textController.text);
                          //           textController.clear();
                          //         },
                          //         autofocus: false,
                          //         decoration: InputDecoration(
                          //           filled: true,
                          //           fillColor: Colors.white,
                          //           contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          //           hintText: 'You can type here',
                          //           hintStyle: TextStyle(
                          //               fontSize: 14,
                          //               color: c.graySub2,
                          //               fontWeight: f.medium),
                          //         )
                          //       ),
                          //       suggestionsCallback: (String pattern) {
                          //         return suggestTag.where((element) => element.toLowerCase().contains(pattern.toLowerCase()));
                          //       },
                          //       itemBuilder: (BuildContext context, String itemData) {
                          //         return ListTile(
                          //           title: Roboto(text: itemData, color: Colors.black, fontWeight: f.medium, size: 12,)
                          //         );
                          //       },
                          //       onSuggestionSelected: (String sugesstion) => controller.listTags.add(sugesstion),
                          //     )
                          //   ],
                          // )
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: MediaQuery.of(context).size.width-70,
                      child: Roboto_LH(
                          text: 'Please let us know if you have any reason to use Florxy. We pledge not to inform anybody, but to assist you in achieving your purpose more efficiently!',
                          size: 14,
                          color: c.blackSub,
                          fontWeight: f.medium,
                          height: 1.35),
                    ),
                    SizedBox(height: 30),
                    TypeAheadField(
                    textFieldConfiguration: TextFieldConfiguration(
                        controller: textController,
                        onEditingComplete: () {
                          controller.listTags.add(textController.text);
                          textController.clear();
                        },
                        autofocus: false,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.fromLTRB(20.0, 17.0, 20.0, 17.0),
                          hintText: 'You can search or type here',
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color: c.graySub2,
                              fontWeight: f.medium),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(13.0)),
                            borderSide: BorderSide(
                                color: c.graySub2.withOpacity(0), width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(13.0)),
                            borderSide:
                            BorderSide(color: c.greenMain, width: 2),
                          ),
                        )
                    ),
                    suggestionsCallback: (String pattern) {
                      return suggestTag.where((e) => e.toLowerCase().contains(pattern.toLowerCase()));
                    },
                    itemBuilder: (BuildContext context, String itemData) {
                      return ListTile(
                          title: Roboto(text: itemData, color: Colors.black, fontWeight: f.medium, size: 14,)
                      );
                    },
                    onSuggestionSelected: (String sugesstion) => controller.listTags.add(sugesstion),
                  ),
                    SizedBox(height: 20),
                    Obx(() => controller.listTags.length == 0
                      ? Roboto(text: '', color: Colors.black, fontWeight: f.medium, size: 14,)
                      : Wrap(
                      children: controller.listTags.map((element) =>
                         Padding(
                            padding: EdgeInsets.only(right: 11),
                            child: Chip(label: Roboto(text: element, size: 14, color: c.blackSub, fontWeight: f.medium,),
                              deleteIcon: Icon(Icons.clear, size: 20),
                              onDeleted: () => controller.listTags.remove(element),
                            )
                         )).toList(),
                    ))
                  ],
                ),
              ),
          ),
          Positioned(
              bottom: 35,
              child: Column(
                children: [
                  Center(
                      child: Roboto_Center(text: 'By continuing, you agree to Florxy’s Terms & Conditions\nand Pricacy Policy.', size: 11.5, color: Color(0xFFAFC8A9), fontWeight: f.medium)
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.only(left: 45,right: 45),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Navbar(currentState: 0)), (route) => false);
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


