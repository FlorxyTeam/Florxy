import 'package:flutter/material.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';

class Covid19 extends StatefulWidget {
  String? title;
  Covid19({Key? key, this.title}) : super(key: key);

  @override
  _Covid19State createState() => _Covid19State();
}

class _Covid19State extends State<Covid19> {

  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
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
              child: Stack(
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back_ios_new_rounded),
                      color: c.blackMain,
                      iconSize: 30,
                      onPressed: () => Navigator.of(context).pop()),

                  Padding(
                    padding: const EdgeInsets.only(top: 13, left: 0 ),
                    child: Center(
                      child: Inter(
                          text: "Help Center",
                          size: 18,
                          color: c.blackMain,
                          fontWeight: f.semiBold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        // resizeToAvoidBottomInset: true,

        child: Container(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Form(
              child: ListView(
                padding: const EdgeInsets.only(top: 20,right: 30,left: 30),
                children: <Widget>[
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child:Inter(text: widget.title!, size: 18, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Divider(
                        color: c.greyMain,
                        thickness: 0.5,
                        height: 0,
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     Information about COVID-19 vaccines and eligibility is only available in some countries.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     FLORXY is committed to keeping people safe and informed about coronavirus (COVID-19).", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     In the COVID-19 Information center you may see:", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - Facts about COVID-19 and COVID-19 vaccines in your area.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - Links to recognized health organizations, such as the World Health Organization (WHO) and your local health ministries.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - COVID-19 vaccine eligibility in your area (this feature is only available in some countries).", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "Where does FLORXY get this information?", size: 18, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We use information from credible health organizations, national and local government authorities and local health ministries to provide accurate COVID-19 resources and information.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "How do I share something from the COVID-19 Information Center?", size: 18, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     Currently, you can only share something from the COVID-19 Information Center to your story or in a direct message.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     To share to your story:", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     1.From the COVID-19 Information Center, tap in symbol the top right.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     2.Tap Add to your story, then tap Send to.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     3.Tap Share next to Your story, then tap Done.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     To share in a direct message:", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     1.From the COVID-19 Information Center, tap symbol in the top right.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     2.Select a person or group (up to 32 people) from the list below or tap Search to search for someone.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     3.Add an optional message at the top. Tap Send, then tap Done.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "Can other people on FLORXY see my activity in the COVID-19 Information Center?", size: 18, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     No, your followers and other FLORXY users will not see when you click on information about COVID-19.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "I’m already vaccinated or have a vaccination plan, how do I hide reminders about COVID-19 and vaccines on FLORXY?", size: 18, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     You may see banners on FLORXY for things like COVID-19 vaccine information or how to access the COVID-19 Information Center. You can remove reminders at the top of your FLORXY feed by tapping X to the right of the reminder. At this time, banners about COVID-19 and vaccines on posts in your feed cannot be hidden or removed.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We send these reminders to keep people informed about the status of COVID-19 and vaccines in their area. We aren't paid to provide these reminders.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "What information does FLORXY use to show me content in the COVID-19 Information Center?", size: 18, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     On FLORXY, we use your location data to show you information related to COVID-19, such as facts about COVID-19 and vaccine eligibility in your location. The location information you provide for features related to COVID-19 on FLORXY isn't displayed to other people on FLORXY.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     You can update the location listed in the COVID-19 Information Center at any time to receive accurate information about vaccination eligibility in your area.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     To edit your location from the FLORXY app for Android or iPhone:", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     1.Tap your profile picture in the bottom right to go to your profile.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     2.Tap more options in the top right, then tap COVID-19 Information Center at the bottom.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     3.Tap Change state or Change country at the top, then follow the on-screen instructions.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "How do I hide links to information about COVID-19 on FLORXY?", size: 18, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     You can remove reminders at the top of your FLORXY feed by tapping X to the right of the reminder.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     You may see links to the COVID-19 Information Center or health organizations on content you’ve posted or on posts in your feed if they mention COVID-19 or vaccines. At this time, banners about COVID-19 or vaccines on posts in your feed cannot be hidden or removed.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "How does FLORXY know my location?", size: 18, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     FLORXY collects location-related information from people in three different ways:", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - When people enable Location services on their device. Keep in mind that you can turn location services on or off at any time.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - Through people’s activity on our services. Even if someone does not enable Location services, FLORXY may still gather information about their location based on information that they and others provide through their activities and connections on our services.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - From IP addresses. In addition to the two prior methods, we also receive IP addresses and other network information when people’s devices connect to FLORXY servers.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "How else is my personal information used?", size: 18, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     FLORXY uses certain information about how you interact with the COVID-19 Information Center and notifications about the COVID-19 Information Center, like views and clicks, to improve product experience. Your information is stored in accordance with our Data Policy.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Divider(
                        color: c.greyMain,
                        thickness: 0.5,
                        height: 0,
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}