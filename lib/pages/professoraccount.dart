import 'package:Florxy/pages/license.dart';
import 'package:Florxy/pages/professororcreator.dart';
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

  changeText3() {
    setState(() {
      alias = 'Dermatologist';
    });
  }

  changeText4() {
    setState(() {
      alias = 'R&D Cosmetics';
    });
  }

  changeText5() {
    setState(() {
      alias = 'Scientist';
    });
  }

  changeText6() {
    setState(() {
      alias = 'Makeup Artist';
    });
  }

  changeText7() {
    setState(() {
      alias = 'Beauty Advisor';
    });
  }

  changeText8() {
    setState(() {
      alias = 'Beauty & Personal Care';
    });
  }

  changeText9() {
    setState(() {
      alias = 'Hair Salon';
    });
  }

  changeText10() {
    setState(() {
      alias = 'Barber Salon';
    });
  }

  changeText11() {
    setState(() {
      alias = 'Cosmetic Dentist';
    });
  }

  changeText12() {
    setState(() {
      alias = 'Plastic Surgeon';
    });
  }

  changeText13() {
    setState(() {
      alias = 'Medical Spa';
    });
  }

  changeText14() {
    setState(() {
      alias = 'Surgeon';
    });
  }

  changeText15() {
    setState(() {
      alias = 'Lasik/Laser Eye Surgeon';
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
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfessorOrCreator()));
                            },
                          ),
                          SizedBox(height: 18),
                          Padding(
                            padding: EdgeInsets.only(left: 18, right: 0, top: 80),
                            child: Column(
                              children: [
                                Poppins(
                                    text: '   Select best Alias for',
                                    size: 17,
                                    color: c.blackSub,
                                    fontWeight: f.bold
                                ),
                                Poppins(
                                    text: 'Professor account',
                                    size: 17,
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
                                    textStyle : TextStyle(color: Colors.white, fontSize: 12, fontWeight: f.bold),
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
                                    textStyle : TextStyle(color: c.blackMain, fontSize: 12, fontWeight: f.bold),
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
                            padding: EdgeInsets.only(left: 18, right: 20, top: 170),
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
                                    textStyle : TextStyle(color: Colors.white, fontSize: 12, fontWeight: f.bold),
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
                                    textStyle : TextStyle(color: c.blackMain, fontSize: 12, fontWeight: f.bold),
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
                              child: alias == 'Dermatologist' ? Container(
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Color(0xff5e0e93),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () {},
                                      text: 'Dermatologist',
                                      textStyle : TextStyle(color: Colors.white, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xff5e0e93),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xff5e0e93),
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
                                  color: Color(0xff5e0e93).withOpacity(0),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () => changeText3(),
                                      text: 'Dermatologist',
                                      textStyle : TextStyle(color: c.blackMain, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xff5e0e93),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xff5e0e93).withOpacity(0),
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
                              padding: EdgeInsets.only(left: 20, right: 20, top: 230),
                              child: alias == 'R&D Cosmetics' ? Container(
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Color(0xff3a0693),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () {},
                                      text: 'R&D Cosmetics',
                                      textStyle : TextStyle(color: Colors.white, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xff3a0693),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xff3a0693),
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
                                  color: Color(0xff3a0693).withOpacity(0),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () => changeText4(),
                                      text: 'R&D Cosmetics',
                                      textStyle : TextStyle(color: c.blackMain, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xff3a0693),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xff3a0693).withOpacity(0),
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
                              padding: EdgeInsets.only(left: 20, right: 20, top: 260),
                              child: alias == 'Scientist' ? Container(
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Color(0xff2c0397),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () {},
                                      text: 'Scientist',
                                      textStyle : TextStyle(color: Colors.white, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xff2c0397),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xff2c0397),
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
                                  color: Color(0xff2c0397).withOpacity(0),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () => changeText5(),
                                      text: 'Scientist',
                                      textStyle : TextStyle(color: c.blackMain, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xff2c0397),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xff2c0397).withOpacity(0),
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
                              padding: EdgeInsets.only(left: 20, right: 20, top: 290),
                              child: alias == 'Makeup Artist' ? Container(
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Color(0xff1a19aa),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () {},
                                      text: 'Makeup Artist',
                                      textStyle : TextStyle(color: Colors.white, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xff1a19aa),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xff1a19aa),
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
                                  color: Color(0xff1a19aa).withOpacity(0),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () => changeText6(),
                                      text: 'Makeup Artist',
                                      textStyle : TextStyle(color: c.blackMain, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xff1a19aa),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xff1a19aa).withOpacity(0),
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
                              padding: EdgeInsets.only(left: 20, right: 20, top: 320),
                              child: alias == 'Beauty Advisor' ? Container(
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Color(0xff1432bf),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () {},
                                      text: 'Beauty Advisor',
                                      textStyle : TextStyle(color: Colors.white, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xff1432bf),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xff1432bf),
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
                                  color: Color(0xff1432bf).withOpacity(0),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () => changeText7(),
                                      text: 'Beauty Advisor',
                                      textStyle : TextStyle(color: c.blackMain, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xff1432bf),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xff1432bf).withOpacity(0),
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
                              padding: EdgeInsets.only(left: 20, right: 20, top: 350),
                              child: alias == 'Beauty & Personal Care' ? Container(
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Color(0xff2b64ac),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () {},
                                      text: 'Beauty & Personal Care',
                                      textStyle : TextStyle(color: Colors.white, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xff2b64ac),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xff2b64ac),
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
                                  color: Color(0xff2b64ac).withOpacity(0),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () => changeText8(),
                                      text: 'Beauty & Personal Care',
                                      textStyle : TextStyle(color: c.blackMain, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xff2b64ac),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xff2b64ac).withOpacity(0),
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
                              padding: EdgeInsets.only(left: 20, right: 20, top: 380),
                              child: alias == 'Hair Salon' ? Container(
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Color(0xff479ed2),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () {},
                                      text: 'Hair Salon',
                                      textStyle : TextStyle(color: Colors.white, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xff479ed2),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xff479ed2),
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
                                  color: Color(0xff479ed2).withOpacity(0),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () => changeText9(),
                                      text: 'Hair Salon',
                                      textStyle : TextStyle(color: c.blackMain, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xff479ed2),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xff479ed2).withOpacity(0),
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
                              padding: EdgeInsets.only(left: 20, right: 20, top: 410),
                              child: alias == 'Barber Salon' ? Container(
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Color(0xff439596),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () {},
                                      text: 'Barber Salon',
                                      textStyle : TextStyle(color: Colors.white, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xff439596),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xff439596),
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
                                  color: Color(0xff439596).withOpacity(0),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () => changeText10(),
                                      text: 'Barber Salon',
                                      textStyle : TextStyle(color: c.blackMain, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xff439596),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xff439596).withOpacity(0),
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
                              padding: EdgeInsets.only(left: 20, right: 20, top: 440),
                              child: alias == 'Cosmetic Dentist' ? Container(
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Color(0xff85b853),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () {},
                                      text: 'Cosmetic Dentist',
                                      textStyle : TextStyle(color: Colors.white, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xff85b853),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xff85b853),
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
                                  color: Color(0xff85b853).withOpacity(0),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () => changeText11(),
                                      text: 'Cosmetic Dentist',
                                      textStyle : TextStyle(color: c.blackMain, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xff85b853),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xff85b853).withOpacity(0),
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
                              padding: EdgeInsets.only(left: 20, right: 20, top: 470),
                              child: alias == 'Plastic Surgeon' ? Container(
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Color(0xff54b538),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () {},
                                      text: 'Plastic Surgeon',
                                      textStyle : TextStyle(color: Colors.white, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xff54b538),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xff54b538),
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
                                  color: Color(0xff54b538).withOpacity(0),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () => changeText12(),
                                      text: 'Plastic Surgeon',
                                      textStyle : TextStyle(color: c.blackMain, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xff54b538),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xff54b538).withOpacity(0),
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
                              padding: EdgeInsets.only(left: 20, right: 20, top: 500),
                              child: alias == 'Medical Spa' ? Container(
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Color(0xff469850),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () {},
                                      text: 'Medical Spa',
                                      textStyle : TextStyle(color: Colors.white, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xff469850),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xff469850),
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
                                  color: Color(0xff469850).withOpacity(0),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () => changeText13(),
                                      text: 'Medical Spa',
                                      textStyle : TextStyle(color: c.blackMain, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xff469850),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xff469850).withOpacity(0),
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
                              padding: EdgeInsets.only(left: 20, right: 20, top: 530),
                              child: alias == 'Surgeon' ? Container(
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Color(0xff29614b),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () {},
                                      text: 'Surgeon',
                                      textStyle : TextStyle(color: Colors.white, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xff29614b),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xff29614b),
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
                                  color: Color(0xff29614b).withOpacity(0),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () => changeText14(),
                                      text: 'Surgeon',
                                      textStyle : TextStyle(color: c.blackMain, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xff29614b),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xff29614b).withOpacity(0),
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
                              padding: EdgeInsets.only(left: 20, right: 20, top: 560),
                              child: alias == 'Lasik/Laser Eye Surgeon' ? Container(
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Color(0xff1d494a),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () {},
                                      text: 'Lasik/Laser Eye Surgeon',
                                      textStyle : TextStyle(color: Colors.white, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xff1d494a),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xff1d494a),
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
                                  color: Color(0xff1d494a).withOpacity(0),
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                ),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed:  () => changeText15(),
                                      text: 'Lasik/Laser Eye Surgeon',
                                      textStyle : TextStyle(color: c.blackMain, fontSize: 12, fontWeight: f.bold),
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xff1d494a),
                                        size: 20,
                                      ),
                                      color: Colors.white.withOpacity(0),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xff1d494a).withOpacity(0),
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
                    SizedBox(height: 15),
                    alias == '' ? Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.only(left: 40,right: 40),
                        child: GestureDetector(
                          onTap: () {},
                          child: GreyButton(
                            text: 'CONTINUE',
                            size: 13,
                            color: c.textWhite,
                            height: 60,
                          ),
                        ),
                      ),
                    ) : Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.only(left: 40,right: 40),
                        child: GestureDetector(
                            onTap: () {

                              Navigator.push(context,MaterialPageRoute(builder: (context) => License(alias : alias)));
                            },
                          child: GreenButton(
                            text: 'CONTINUE',
                            size: 13,
                            color: c.textWhite,
                            height: 60,
                          ),
                        ),
                      ),
                    )
                  ],
                )
            )
          ],
        )
    );
  }
}