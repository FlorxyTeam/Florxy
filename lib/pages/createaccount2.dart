import 'package:Florxy/pages/createaccount3.dart';
import 'package:Florxy/widgets/button.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:flutter_linear_datepicker/flutter_datepicker.dart';
import 'package:flutter_linear_datepicker/number_picker.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CreateAccount2 extends StatefulWidget {
  const CreateAccount2({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

const String MIN_DATETIME = '1970-01-01';
const String MAX_DATETIME = '2022-02-10';
const String INIT_DATETIME = '2010-06-10';
const String DATE_FORMAT = 'MMMM-d-yyyy';

class _CreateAccountState extends State<CreateAccount2> {
  Color _colorText = c.greyMain;
  late DateTime _dateTime;
  DateTime today = DateTime.now();
  bool circular = false;
  final storage = new FlutterSecureStorage();

  bool check() {
    String formattedDate = DateFormat('MMMM-d-yyyy').format(_dateTime);
    DateTime birthDate = DateFormat(DATE_FORMAT).parse(formattedDate);
    DateTime adultDate = DateTime(
      birthDate.year + 15,
      birthDate.month,
      birthDate.day,
    );

    return adultDate.isBefore(today);
  }

  @override
  void initState() {
    super.initState();
    _dateTime = DateTime.parse(INIT_DATETIME);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF9F9F9),
        body: Stack(
          children: [
            SafeArea(
              child: Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Stack(
                        children: [
                          IconButton(
                            icon: Icon(Boxicons.bx_left_arrow_alt),
                            iconSize: 35,
                            color: Colors.black,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 22.75),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 5.5,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color: c.greySub,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Container(
                                  height: 5.5,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color: c.greenMain,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Container(
                                  height: 5.5,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color: c.greySub,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(
                          image: AssetImage('assets/img/icon2.png'),
                          height: 40,
                        ),
                        const SizedBox(width: 10),
                        Poppins(
                          text: 'Got it',
                          size: 18,
                          fontWeight: f.medium,
                          color: Colors.black,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Poppins(
                          text: 'What is your date birth?',
                          size: 24,
                          fontWeight: f.semiBold,
                          color: Colors.black,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Stack(
                      children: [
                        Center(
                          child: Container(
                            width: 280,
                            child: DateTimePickerWidget(
                              minDateTime: DateTime.parse(MIN_DATETIME),
                              maxDateTime: DateTime.parse(MAX_DATETIME),
                              initDateTime: DateTime.parse(INIT_DATETIME),
                              dateFormat: DATE_FORMAT,
                              pickerTheme: DateTimePickerTheme(
                                pickerHeight: 235,
                                itemHeight: 58,
                                showTitle: false,
                                selectionOverlay: Container(),
                                itemTextStyle: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                  color: c.greenMain,
                                  fontSize: 17,
                                  fontWeight: f.medium,
                                )),
                                backgroundColor: Color(0xffF9F9F9),
                              ),
                              onChange: (dateTime, selectedIndex) {
                                setState(() {
                                  _dateTime = dateTime;
                                });
                              },
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 95),
                            height: 45,
                            width: 320,
                            decoration: BoxDecoration(
                                color: c.greenLight2.withOpacity(0.33),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    check()
                        ? Container()
                        : Roboto(
                            text:
                                "Sorry, you don't meet Florxy's age requirements.",
                            size: 13,
                            color: c.redMain,
                            fontWeight: f.regular)
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 35,
              child: Column(
                children: [
                  Center(
                      child: Roboto_Center(
                          text:
                              'By continuing, you agree to Florxy’s Terms & Conditions\nand Pricacy Policy.',
                          size: 11.5,
                          color: Color(0xFFAFC8A9),
                          fontWeight: f.medium)),
                  SizedBox(height: 15),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                        padding: EdgeInsets.only(left: 40, right: 40),
                        child: check()
                            ? GestureDetector(
                                onTap: () async {
                                  setState(() {
                                    circular = true;
                                  });

                                  await storage.write(
                                      key: "date",
                                      value: DateFormat('MMMM-d-yyyy')
                                          .format(_dateTime));

                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => CreateAccount3()));

                                  setState(() {
                                    circular = false;
                                  });
                                },
                                child: circular
                                    ? Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 10),
                                        child: Center(
                                            child: CircularProgressIndicator()),
                                      )
                                    : GreenButton(
                                        text: 'NEXT',
                                        size: 16,
                                        color: c.textWhite,
                                        height: 65,
                                      ),
                              )
                            : GreyButton(
                                text: 'NEXT',
                                size: 16,
                                color: c.textWhite,
                                height: 65,
                              )),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
