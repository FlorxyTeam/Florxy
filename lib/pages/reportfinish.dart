import 'package:Florxy/pages/reportpage.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:boxicons/boxicons.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/button.dart';
import 'navbar.dart';


class ReportFinish extends StatefulWidget {
  final String Bad;
  const ReportFinish({Key? key,required this.Bad}) : super(key: key);

  @override
  _ReportFinishState createState() => _ReportFinishState();
}

class _ReportFinishState extends State<ReportFinish> {
  String notific = "No Check";
  Check() {
    setState(() {
      notific = 'Check';
    });
  }
  NoCheck() {
    setState(() {
      notific = 'No Check';
    });
  }

  @override
  Widget build(BuildContext context) {
    String Choose = widget.Bad;
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
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute
                          (builder: (context)=>ReportPage()), (route) => false);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        size: 30,
                        color: c.blackMain,
                      ),
                    ),
                    Poppins(
                        text: 'Report an issue',
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
                        padding: EdgeInsets.only(left: 0, right: 0, top: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Boxicons.bxs_error_circle,color: c.redMain,size: 30,
                            ),
                            Text(
                              '  $Choose',
                              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: c.blackMain),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 0, right: 0, top: 10),
                        child: Column(
                          children:[
                            Text(
                              'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also ',
                              style: TextStyle(fontSize: 11.5,color: c.greySub),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0, right: 0, top: 10),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Poppins(
                                  text: 'Detail',
                                  size: 14,
                                  color: c.blackSub,
                                  fontWeight: f.bold),
                            ),
                            SizedBox(height: 5),
                            Container(
                              height: 90,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(13.0)),
                              ),
                              child: TextField(
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    hintText: 'You can type here',
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
                bottom: 50,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Poppins(
                          text: 'Receive notifications about this report            ',
                          size: 11.5,
                          color: c.blackSub,
                          fontWeight: f.medium,
                        ),
                        notific == 'Check' ? IconButton(
                            onPressed: ()=> NoCheck(),
                            icon: Icon(Boxicons.bxs_checkbox_checked,color: c.greenSub2,)
                        ): IconButton(
                            onPressed: ()=> Check(),
                            icon: Icon(Boxicons.bx_checkbox,)
                        )
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.only(left: 40,right: 40),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute
                              (builder: (context)=>Navbar(currentState: 0)), (route) => false);
                          },
                          child: GreenButton(
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