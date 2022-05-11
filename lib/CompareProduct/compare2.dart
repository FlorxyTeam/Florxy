import 'package:Florxy/NetworkHandler.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import '../postProvider.dart';


class compare2 extends StatefulWidget {
  String? id1, id2;
  compare2({Key? key, this.id1, this.id2}) : super(key: key);

  @override
  _compare2State createState() => _compare2State();
}

class _compare2State extends State<compare2> {
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();

  @override
  void fetchData() async {

    await networkHandler.get("/compare2/compare/" + widget.id1! + "/" + widget.id2!);
  }

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<PostProvider>(context, listen: false).fetchCompare2();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Consumer<PostProvider>(
            builder: (context, model, _) => FutureBuilder(
                  future: model.fetchCompare2(),
                  builder: (context, snapshot) => ListView.builder(
                    // scrollDirection: Axis.vertical,
                    itemCount: model.pro1?.length ?? 0,
                    itemBuilder: (context, index) {
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
                                              image: NetworkImage(
                                                  model.pro1![index][index]
                                                      ['p_img']),
                                              fit: BoxFit.contain)),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: Container(
                                    width: 190,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10,
                                                left: 10,
                                                top: 5,
                                                bottom: 5),
                                            child: Inter(
                                                text: model.pro1![index][index]
                                                    ['p_brand'],
                                                size: 13,
                                                color: Colors.white,
                                                fontWeight: f.semiBold),
                                          ),
                                          decoration: BoxDecoration(
                                              color: Color(0xFF9FA8A3),
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        PoppinsLeft(
                                            text: model.pro1![index][index]
                                                ['p_name'],
                                            size: 15,
                                            color: Color(0xFF053118),
                                            fontWeight: f.semiBold),
                                        SizedBox(height: 15),
                                        Roboto(
                                            text: model.pro1![index][index]
                                                        ['p_desc']
                                                    .toString()
                                                    .substring(0, 70) +
                                                "...",
                                            size: 12,
                                            color: Color(0xFF9D9D9D),
                                            fontWeight: f.regular)
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Container(
                                    child: InkWell(
                                      onTap: () {},
                                      child: Icon(Icons.close_rounded,
                                          color: c.redMain, size: 24),
                                    ),
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
