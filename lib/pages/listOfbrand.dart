import 'package:flutter/material.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:Florxy/pages/brandoverview.dart';

import '../postProvider.dart';

class listOfbrand extends StatefulWidget {
  const listOfbrand({Key? key}) : super(key: key);

  @override
  _listOfbrandState createState() => _listOfbrandState();
}

class _listOfbrandState extends State<listOfbrand> {
  @override
  void initState() {
    Provider.of<PostProvider>(context, listen: false).fetchBrand();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 30),
          child: Container(
              color: c.textWhite,
              child: Consumer<PostProvider>(
                  builder: (context, model, _) => FutureBuilder(
                        future: model.fetchBrand(),
                        builder: (context, snapshot) => ListView.builder(
                            itemCount: model.listOfbrand?.length ?? 0,
                            itemBuilder: (context, int index) {
                              return model.listOfbrand![index] != 'Pixi by Petra' && model.listOfbrand![index] != 'Biore UV' && model.listOfbrand![index] != 'Clinique for Men'
                                  ? InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Brandoverview(
                                                        p_brand:
                                                            model.listOfbrand![
                                                                index])));
                                      },
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  12,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.4,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: c.greenMain,
                                                  style: BorderStyle.solid,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              child: Center(
                                                child: Roboto(
                                                    text:
                                                        model.listOfbrand![index],
                                                    size: 20,
                                                    color: c.greenMain,
                                                    fontWeight: f.regular),
                                              )),
                                          Container(
                                            height: 15,
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container();
                            }),
                      ))),
        ),
      ),
    );
  }
}
