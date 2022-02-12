import 'package:Florxy/pages/privilege3.dart';
import 'package:Florxy/pages/license.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:Florxy/widgets/button.dart';



class ProfessorAccount extends StatefulWidget {
  const ProfessorAccount({Key? key}) : super(key: key);

  @override
  _ProfessorAccountState createState() => _ProfessorAccountState();
}

class _ProfessorAccountState extends State<ProfessorAccount> {
  String alias = '';
  @override
  changeText1() {
    setState(() {
      alias = 'Pharmacy';
    });
  }
  changeText2() {
    setState(() {
      alias = 'Advisor';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            SafeArea(
              child: Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Stack(
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back_ios_new,),
                            iconSize: 30,
                            color: Colors.black,
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Privilege3()));
                            },
                          ),
                          SizedBox(height: 18),
                          Padding(
                            padding: EdgeInsets.only(left: 18, right: 0, top: 80),
                            child: Column(
                              children: [
                                Poppins(
                                    text: '   Select best Alias for',
                                    size: 18,
                                    color: c.blackSub,
                                    fontWeight: f.bold
                                ),
                                Poppins(
                                    text: 'Professor account',
                                    size: 18,
                                    color: c.blackSub,
                                    fontWeight: f.bold
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 140),
                            child: alias == 'Pharmacy' ? Container(
                              height: 36,
                              decoration: BoxDecoration(
                                color: Color(0xffb92796),
                                borderRadius: BorderRadius.all(Radius.circular(13.0)),
                              ),
                              child : Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GFButton(
                                    onPressed:  () {},
                                    text: 'Pharmacy',
                                    textStyle : TextStyle(color: Colors.white, fontSize: 14, fontWeight: f.bold),
                                    icon: Icon(
                                      Icons.circle,
                                      color: Color(0xffb92796),
                                      size: 20,
                                    ),
                                    color: Colors.white.withOpacity(0),
                                  ),
                                  Container(
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xffb92796),
                                      borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                    ),
                                    child : Icon(
                                      Icons.check_outlined,color: Colors.white,size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ) : Container(
                              height: 36,
                              decoration: BoxDecoration(
                                color: Color(0xffb92796).withOpacity(0),
                                borderRadius: BorderRadius.all(Radius.circular(13.0)),
                              ),
                              child : Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GFButton(
                                    onPressed:  () => changeText1(),
                                    text: 'Pharmacy',
                                    textStyle : TextStyle(color: c.blackMain, fontSize: 14, fontWeight: f.bold),
                                    icon: Icon(
                                      Icons.circle,
                                      color: Color(0xffb92796),
                                      size: 20,
                                    ),
                                    color: Colors.white.withOpacity(0),
                                  ),
                                  Container(
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xffb92796).withOpacity(0),
                                      borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                    ),
                                    child : Icon(
                                      Icons.check_outlined,color: Colors.white,size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 170),
                            child: alias == 'Advisor' ? Container(
                              height: 36,
                              decoration: BoxDecoration(
                                color: Color(0xff861a8c),
                                borderRadius: BorderRadius.all(Radius.circular(13.0)),
                              ),
                              child : Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GFButton(
                                    onPressed:  () {},
                                    text: 'Advisor',
                                    textStyle : TextStyle(color: c.blackMain, fontSize: 14, fontWeight: f.bold),
                                    icon: Icon(
                                      Icons.circle,
                                      color: Color(0xff861a8c),
                                      size: 20,
                                    ),
                                    color: Colors.white.withOpacity(0),
                                  ),
                                  Container(
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xff831989),
                                      borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                    ),
                                    child : Icon(
                                      Icons.check_outlined,color: Colors.white,size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ) : Container(
                              height: 36,
                              decoration: BoxDecoration(
                                color: Color(0xff861a8c).withOpacity(0),
                                borderRadius: BorderRadius.all(Radius.circular(13.0)),
                              ),
                              child : Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GFButton(
                                    onPressed:  () => changeText2(),
                                    text: 'Advisor',
                                    textStyle : TextStyle(color: c.blackMain, fontSize: 14, fontWeight: f.bold),
                                    icon: Icon(
                                      Icons.circle,
                                      color: Color(0xff861a8c),
                                      size: 20,
                                    ),
                                    color: Colors.white.withOpacity(0),
                                  ),
                                  Container(
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xff831989).withOpacity(0),
                                      borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                    ),
                                    child : Icon(
                                      Icons.check_outlined,color: Colors.white,size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 200),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GFButton(
                                  onPressed:  () {},
                                  text: 'Dermatologist',
                                  textStyle : TextStyle(color: c.blackMain, fontSize: 14, fontWeight: f.bold),
                                  icon: Icon(
                                    Icons.circle,
                                    color: Color(0xff5e0e93),
                                    size: 20,
                                  ),
                                  color: Colors.white,
                                ),
                                Icon(
                                  Icons.check_outlined,color: Colors.white,size: 20,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 230),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GFButton(
                                  onPressed:  () {},
                                  text: 'R&D Cosmetics',
                                  textStyle : TextStyle(color: c.blackMain, fontSize: 14, fontWeight: f.bold),
                                  icon: Icon(
                                    Icons.circle,
                                    color: Color(0xff3a0693),
                                    size: 20,
                                  ),
                                  color: Colors.white,
                                ),
                                Icon(
                                  Icons.check_outlined,color: Colors.white,size: 20,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 260),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GFButton(
                                  onPressed:  () {},
                                  text: 'Scientist',
                                  textStyle : TextStyle(color: c.blackMain, fontSize: 14, fontWeight: f.bold),
                                  icon: Icon(
                                    Icons.circle,
                                    color: Color(0xff2c0397),
                                    size: 20,
                                  ),
                                  color: Colors.white,
                                ),
                                Icon(
                                  Icons.check_outlined,color: Colors.white,size: 20,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 290),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GFButton(
                                  onPressed:  () {},
                                  text: 'Makeup Artist',
                                  textStyle : TextStyle(color: c.blackMain, fontSize: 14, fontWeight: f.bold),
                                  icon: Icon(
                                    Icons.circle,
                                    color: Color(0xff1a19aa),
                                    size: 20,
                                  ),
                                  color: Colors.white,
                                ),
                                Icon(
                                  Icons.check_outlined,color: Colors.white,size: 20,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 320),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GFButton(
                                  onPressed:  () {},
                                  text: 'Beauty Advisor',
                                  textStyle : TextStyle(color: c.blackMain, fontSize: 14, fontWeight: f.bold),
                                  icon: Icon(
                                    Icons.circle,
                                    color: Color(0xff1432bf),
                                    size: 20,
                                  ),
                                  color: Colors.white,
                                ),
                                Icon(
                                  Icons.check_outlined,color: Colors.white,size: 20,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 350),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GFButton(
                                  onPressed:  () {},
                                  text: 'Beauty, Cosmetic & Personal Care',
                                  textStyle : TextStyle(color: c.blackMain, fontSize: 14, fontWeight: f.bold),
                                  icon: Icon(
                                    Icons.circle,
                                    color: Color(0xff2b64ac),
                                    size: 20,
                                  ),
                                  color: Colors.white,
                                ),
                                Icon(
                                  Icons.check_outlined,color: Colors.white,size: 20,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 380),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GFButton(
                                  onPressed:  () {},
                                  text: 'Hair Salon',
                                  textStyle : TextStyle(color: c.blackMain, fontSize: 14, fontWeight: f.bold),
                                  icon: Icon(
                                    Icons.circle,
                                    color: Color(0xff479ed2),
                                    size: 20,
                                  ),
                                  color: Colors.white,
                                ),
                                Icon(
                                  Icons.check_outlined,color: Colors.white,size: 20,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 410),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GFButton(
                                  onPressed:  () {},
                                  text: 'Barber Salon',
                                  textStyle : TextStyle(color: c.blackMain, fontSize: 14, fontWeight: f.bold),
                                  icon: Icon(
                                    Icons.circle,
                                    color: Color(0xff439596),
                                    size: 20,
                                  ),
                                  color: Colors.white,
                                ),
                                Icon(
                                  Icons.check_outlined,color: Colors.white,size: 20,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 440),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GFButton(
                                  onPressed:  () {},
                                  text: 'Cosmetic Dentist',
                                  textStyle : TextStyle(color: c.blackMain, fontSize: 14, fontWeight: f.bold),
                                  icon: Icon(
                                    Icons.circle,
                                    color: Color(0xff85b853),
                                    size: 20,
                                  ),
                                  color: Colors.white,
                                ),
                                Icon(
                                  Icons.check_outlined,color: Colors.white,size: 20,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 470),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GFButton(
                                  onPressed:  () {},
                                  text: 'Plastic Surgeon',
                                  textStyle : TextStyle(color: c.blackMain, fontSize: 14, fontWeight: f.bold),
                                  icon: Icon(
                                    Icons.circle,
                                    color: Color(0xff54b538),
                                    size: 20,
                                  ),
                                  color: Colors.white,
                                ),
                                Icon(
                                  Icons.check_outlined,color: Colors.white,size: 20,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 500),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GFButton(
                                  onPressed:  () {},
                                  text: 'Medical Spa',
                                  textStyle : TextStyle(color: c.blackMain, fontSize: 14, fontWeight: f.bold),
                                  icon: Icon(
                                    Icons.circle,
                                    color: Color(0xff469850),
                                    size: 20,
                                  ),
                                  color: Colors.white,
                                ),
                                Icon(
                                  Icons.check_outlined,color: Colors.white,size: 20,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 530),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GFButton(
                                  onPressed:  () {},
                                  text: 'Surgeon',
                                  textStyle : TextStyle(color: c.blackMain, fontSize: 14, fontWeight: f.bold),
                                  icon: Icon(
                                    Icons.circle,
                                    color: Color(0xff29614b),
                                    size: 20,
                                  ),
                                  color: Colors.white,
                                ),
                                Icon(
                                  Icons.check_outlined,color: Colors.white,size: 20,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 560),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GFButton(
                                  onPressed:  () {},
                                  text: 'Lasik/Laser Eye Surgeon',
                                  textStyle : TextStyle(color: c.blackMain, fontSize: 14, fontWeight: f.bold),
                                  icon: Icon(
                                    Icons.circle,
                                    color: Color(0xff1d494a),
                                    size: 20,
                                  ),
                                  color: Colors.white,
                                ),
                                Icon(
                                  Icons.check_outlined,color: Colors.white,size: 20,
                                ),
                              ],
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
                bottom: 15,
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.only(left: 40,right: 40),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => License()));
                          },
                          child: GreenButton(
                            text: 'CONTINUE',
                            size: 18,
                            color: c.textWhite,
                            height: 60,
                          ),
                        ),
                      ),
                    )],
                )
            )
          ],
        )
    );
  }
}