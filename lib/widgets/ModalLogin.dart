import 'package:Florxy/pages/LoginPage.dart';
import 'package:Florxy/pages/createaccount_withemail.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:slide_popup_dialog_null_safety/slide_popup_dialog.dart' as slideDialog;
import 'package:Florxy/pages/EditProfile.dart';
import 'package:Florxy/pages/setting.dart';

class ModalLogin {
  static Dialog_Settings(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            color: Colors.transparent,
            height: 520,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: _buildLoginMenu(context),
              ),
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(40),
                      topRight: const Radius.circular(40))),
            ),
          );
        });
  }
}

Column _buildLoginMenu(context) {
  return Column(
    children: [
      Container(
        width: 88,
        child: Divider(
          height: 0,
          color: c.greyMain,
          thickness: 4,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 45,right: 45, top: 48),
        child: Container(
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: c.shadow.withOpacity(0.32),
                  spreadRadius: -4,
                  blurRadius: 23,
                  offset: Offset(0, 6), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 9),
                  child: Image(
                    image: AssetImage('assets/img/Google_icon-icons.com_66793.png'),
                    height: 23,
                  ),
                ),
                Inter(
                    text: 'Continue with Google',
                    size: 13,
                    color: Color(0xFF484848),
                    fontWeight: f.bold
                )
              ],
            )
        ),
      ),
      SizedBox(height: 25),
      Padding(
        padding: EdgeInsets.only(left: 45,right: 45),
        child: Container(
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: c.shadow.withOpacity(0.32),
                  spreadRadius: -4,
                  blurRadius: 23,
                  offset: Offset(0, 6), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.only(right: 7),
                    child: Icon(Boxicons.bxl_facebook_circle, size: 30,color: Color(0xFF156ACF))),
                Inter(
                    text: 'Continue with Facebook',
                    size: 13,
                    color: Color(0xFF484848),
                    fontWeight: f.bold
                )
              ],
            )
        ),
      ),
      SizedBox(height: 25),
      Padding(
          padding: EdgeInsets.only(left: 45,right: 45),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Container(
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: c.shadow.withOpacity(0.32),
                      spreadRadius: -4,
                      blurRadius: 23,
                      offset: Offset(0, 6), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(right: 7),
                        child: Icon(Boxicons.bxs_envelope, size: 28,color: Colors.black)),
                    Inter(
                        text: 'Email  ',
                        size: 13,
                        color: Color(0xFF484848),
                        fontWeight: f.bold
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: VerticalDivider(
                        color: c.greySub,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5, right: 7),
                      child: Material(
                        child: Ink(
                          height: 23,
                          width: 23,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(0),
                              child: Icon(Boxicons.bxs_phone,size: 18,color: Colors.white)
                            ),
                          ),
                        ),
                      ),
                    ),
                    Inter(
                        text: 'Phone number',
                        size: 13,
                        color: Color(0xFF484848),
                        fontWeight: f.bold
                    ),
                  ],
                )
            ),
          )
      ),
    ],
  );
}
