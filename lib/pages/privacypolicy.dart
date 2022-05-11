import 'package:flutter/material.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {

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
                          text: "Privacy Policy",
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage('assets/img/icon2.png'),
                            height: 40,
                          ),
                          SizedBox(width: 20,),
                          Align(
                            alignment: Alignment.topCenter,
                            child:Text(
                              "Data Policy",
                              style: TextStyle(fontSize: 20,height: 1.5,fontWeight: f.bold),
                            ),
                          ),
                        ],
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
                        child:Inter(text: "Data Policy", size: 18, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     The Facebook company is now Meta. We've updated our Terms of Use, Data Policy and Cookies Policy to reflect the new name on 4 January 2022. While our company name has changed, we are continuing to offer the same products, including the Facebook app from Meta. Our Data Policy and Terms of Service remain in effect, and this name change does not affect how we use or share data. Learn more about Meta and our vision for the metaverse.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "Data Policy", size: 16, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     This policy describes the information that we process to support Facebook, FLORXY, Messenger and other products and features offered by Meta Platforms, Inc. (Meta Products or Products). You can find additional tools and information in the Facebook settings and FLORXY settings.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "I. What kinds of information do we collect?", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     To provide the Meta Products, we must process information about you. The type of information that we collect depends on how you use our Products. You can learn how to access and delete information that we collect by visiting the Facebook settings and FLORXY settings.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "Things that you and others do and provide.", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - Information and content you provide.", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We collect the content, communications and other information you provide when you use our Products, including when you sign up for an account, create or share content and message or communicate with others. This can include information in or about the content that you provide (e.g. metadata), such as the location of a photo or the date a file was created. It can also include what you see through features that we provide, such as our camera, so we can do things such as suggest masks and filters that you might like, or give you tips on using camera formats. Our systems automatically process content and communications that you and others provide to analyse context and what's in them for the purposes described below. Learn more about how you can control who can see the things you share.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     Data with special protections: You can choose to provide information in your Facebook profile fields or life events about your religious views, political views, who you are interested in or your health. This and other information (such as racial or ethnic origin, philosophical beliefs or trade union membership) could be subject to special protections under the laws of your country.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - Networks and connections.", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We collect information about the people, accounts, hashtags, Facebook groups and Pages that you are connected to and how you interact with them across our Products, such as people you communicate with the most or groups that you are part of. We also collect contact information if you choose to upload, sync or import it from a device (such as an address book or call log or SMS log history), which we use for things such as helping you and others find people you may know and for the other purposes listed below.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - Your usage.", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We collect information about how you use our Products, such as the types of content that you view or engage with, the features you use, the actions you take, the people or accounts you interact with and the time, frequency and duration of your activities. For example, we log when you're using and have last used our Products, and what posts, videos and other content you view on our Products. We also collect information about how you use features such as our camera.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - Information about transactions made on our Products.", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     If you use our Products for purchases or other financial transactions (such as when you make a purchase in a game or make a donation), we collect information about the purchase or transaction. This includes payment information, such as your credit or debit card number and other card information, other account and authentication information, and billing, delivery and contact details.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - Things others do and information they provide about you. ", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We also receive and analyse content, communications and information that other people provide when they use our Products. This can include information about you, such as when others share or comment on a photo of you, send a message to you or upload, sync or import your contact information.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "Device information.", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     As described below, we collect information from and about the computers, phones, connected TVs and other web-connected devices you use that integrate with our Products, and we combine this information across different devices you use. For example, we use information collected about your use of our Products on your phone to better personalise the content (including ads) or features that you see when you use our Products on another device, such as your laptop or tablet, or to measure whether you took an action in response to an ad that we showed you on your phone on a different device.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     Information we obtain from these devices includes:", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - Device attributes:", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     information such as the operating system, hardware and software versions, battery level, signal strength, available storage space, browser type, app and file names and types, and plugins.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - Device operations:", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     information about operations and behaviours performed on the device, such as whether a window is in the foreground or background, or mouse movements (which can help distinguish humans from bots).", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - Identifiers:", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     unique identifiers, device IDs and other identifiers, such as from games, apps or accounts that you use, and Family Device IDs (or other identifiers unique to Meta Company Products associated with the same device or account).", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - Device signals: ", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     Bluetooth signals, information about nearby Wi-Fi access points, beacons and mobile phone masts.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - Data from device settings:", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     information you allow us to receive through device settings that you turn on, such as access to your GPS location, camera or photos.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - Network and connections: ", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     information such as the name of your mobile operator or ISP, language, time zone, mobile phone number, IP address, connection speed and, in some cases, information about other devices that are nearby or on your network, so we can do things such as help you stream a video from your phone to your TV.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - Cookie data:", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     data from cookies stored on your device, including cookie IDs and settings. Learn more about how we use cookies in the Facebook Cookies Policy and FLORXY Cookies Policy.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "Information from partners.", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     Advertisers, app developers and publishers can send us information through Meta Business Tools that they use, including our social plug-ins (such as the Like button), Facebook Login, our APIs and SDKs or the Meta pixel. These partners provide information about your activities off of our Products – including information about your device, websites you visit, purchases you make, the ads you see and how you use their services – whether or not you have an account or are logged in to our Products. For example, a game developer could use our API to tell us what games you play, or a business could tell us about a purchase you made in its shop. We also receive information about your online and offline actions and purchases from third-party data providers who have the rights to provide us with your information.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     Partners receive your data when you visit or use their services, or through third parties that they work with. We require each of these partners to have lawful rights to collect, use and share your data before providing us with any data. Learn more about the types of partners we receive data from.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     To learn more about how we use cookies in connection with Meta Business Tools, review the Facebook Cookies Policy and FLORXY Cookies Policy.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "II. How do we use this information?", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We use the information that we have (subject to choices you make) as described below and to provide and support the Meta Products and related services described in the Meta Terms and FLORXY Terms. Here's how:", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     Provide, personalise and improve our Products.", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We use the information that we have to deliver our Products, including to personalise features and content (including your ads, Facebook News Feed, FLORXY feed and FLORXY Stories) and make suggestions for you (such as groups or events that you may be interested in or topics that you may want to follow) on and off our Products. To create personalised Products that are unique and relevant to you, we use your connections, preferences, interests and activities based on the data that we collect and learn from you and others (including any data with special protections you choose to provide); how you use and interact with our Products; and the people, places or things that you're connected to and interested in on and off our Products. Learn more about how we use information about you to personalise your Facebook and FLORXY experience, including features, content and recommendations in Meta Products; you can also learn more about how we choose the ads that you see.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - Information across Meta Products and devices: ", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We connect information about your activities on different Meta Products and devices to provide a more tailored and consistent experience on all Meta Products that you use, wherever you use them. For example, we can suggest that you join a group on Facebook that includes people you follow on FLORXY or communicate with using Messenger. We can also make your experience more seamless, for example, by automatically filling in your registration information (such as your phone number) from one Meta Product when you sign up for an account on a different Product.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - Location-related information:", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We use location-related information – such as your current location, where you live, the places you like to go, and the businesses and people you're near – to provide, personalise and improve our Products, including ads, for you and others. Location-related information can be based on things such as precise device location (if you've allowed us to collect it), IP addresses and information from your and others' use of Meta Products (such as check-ins or events that you attend).", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - Product research and development: ", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We use the information we have to develop, test and improve our Products, including by conducting surveys and research, and testing and troubleshooting new products and features.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - Ads and other sponsored content: ", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We use the information we have about you – including information about your interests, actions and connections – to select and personalise ads, offers and other sponsored content that we show you. Learn more about how we select and personalise ads, and your choices over the data we use to select ads and other sponsored content for you in the Facebook Settings and FLORXY Settings.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "Providing measurement, analytics and other business services.", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We use the information we have (including your activity off our Products, such as the websites you visit and ads you see) to help advertisers and other partners measure the effectiveness and distribution of their ads and services, and understand the types of people who use their services and how people interact with their websites, apps and services. Learn how we share information with these partners.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "Promoting safety, integrity and security.", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We use the information that we have to verify accounts and activity, combat harmful conduct, detect and prevent spam and other bad experiences, maintain the integrity of our Products, and promote safety and security on and off of Meta Products. For example, we use data that we have to investigate suspicious activity or violations of our Terms or Policies, or to detect when someone needs help. To learn more, visit the Facebook Security Help Centre and FLORXY Security Tips.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "Communicate with you.", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We use the information that we have to send you marketing communications, communicate with you about our Products and let you know about our Policies and Terms. We also use your information to respond to you when you contact us.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "Researching and innovating for social good.", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We use the information we have (including from research partners we collaborate with) to conduct and support research and innovation on topics of general social welfare, technological advancement, public interest, health and well-being. For example, we analyse information we have about migration patterns during crises to aid relief efforts. Learn more about our research programmes.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "III. How is this information shared?", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     Your information is shared with others in the following ways:", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "Sharing on Meta Products", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "People and accounts that you share and communicate with", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     When you share and communicate using our Products, you choose the audience for what you share. For example, when you post on Facebook, you select the audience for the post, such as a group, all of your friends, the public or a customised list of people. Similarly, when you use Messenger or FLORXY to communicate with people or businesses, those people and businesses can see the content you send. Your network can also see actions that you have taken on our Products, including engagement with ads and sponsored content. We also let other accounts see who has viewed their Facebook or FLORXY Stories.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     Learn more about what information is public and how to control your visibility on Facebook and FLORXY.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "Content that others share or reshare about you.", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     You should consider who you choose to share with, because people who can see your activity on our Products can choose to share it with others on and off our Products, including people and businesses outside the audience that you shared with. For example, when you share a post or send a message to specific friends or accounts, they can download, screenshot or reshare that content to others across or off our Products, in person or in virtual reality experiences such as Horizon Worlds. Also, when you comment on someone else's post or react to their content, your comment or reaction will be visible to anyone who can see the other person's content, and that person will be able to change the audience later.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     People can also use our Products to create and share content about you with the audience they choose. For example, people can share a photo of you in a story, mention or tag you at a location in a post, or share information about you in their posts or messages. If you are uncomfortable with what others have shared about you on our Products, you can learn how to report the content.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "Information about your active status or presence on our Products.", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     People in your networks can see signals telling them whether you are active on our Products, including whether you are currently active on FLORXY, Messenger or Facebook, or when you last used our Products.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "Apps, websites and third-party integrations on or using our Products.", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     When you choose to use third-party apps, websites or other services that use, or are integrated with, our Products, they can receive information about what you post or share. For example, when you play a game with your Facebook friends or use a Facebook Comment or Share button on a website, the game developer or website can receive information about your activities in the game or receive a comment or link that you share from the website on Facebook. Also, when you download or use such third-party services, they can access your public profile on Facebook, and any information that you share with them. Apps and websites that you use may receive your list of Facebook friends if you choose to share it with them. But apps and websites that you use will not be able to receive any other information about your Facebook friends from you, or information about any of your FLORXY followers (although your friends and followers may, of course, choose to share this information themselves). Information collected by these third-party services is subject to their own terms and policies, not this one.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     Devices and operating systems providing native versions of Facebook and FLORXY (i.e. where we have not developed our own first-party apps) will have access to all information you choose to share with them, including information your friends share with you, so they can provide our core functionality to you.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     Note: We are in the process of restricting developers' data access even further to help prevent abuse. For example, we will remove developers' access to your Facebook and FLORXY data if you haven't used their app in three months, and we are changing login, so that in the next version, we will reduce the data that an app can request without app review to include only name, FLORXY username and bio, profile photo and email address. Requesting any other data will require our approval.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "New owner.", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     If the ownership or control of all or part of our Products or their assets changes, we may transfer your information to the new owner.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "Sharing with third-party partners", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We work with third-party partners who help us provide and improve our Products or who use Meta Business Tools to grow their businesses, which makes it possible to operate our companies and provide free services to people around the world. We don't sell any of your information to anyone and we never will. We also impose strict restrictions on how our partners can use and disclose the data we provide. Here are the types of third parties that we share information with:", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "Partners who use our analytics services.", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We provide aggregated statistics and insights that help people and businesses understand how people are engaging with their posts, listings, Facebook Pages, videos and other content on and off the Meta Products. For example, Facebook Page admins and FLORXY business profiles receive information about the number of people or accounts who viewed, reacted to or commented on their posts, as well as aggregate demographic and other information that helps them understand interactions with their account or Facebook Page.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "Advertisers.", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We provide advertisers with reports about the kinds of people seeing their ads and how their ads are performing, but we don't share information that personally identifies you (information such as your name or email address that by itself can be used to contact you or identifies who you are) unless you give us permission. For example, we provide general demographic and interest information for advertisers (for example, that an ad was seen by a woman between the ages of 25 and 34 who lives in Madrid and likes software engineering) to help them better understand their audience. We also confirm which ads led you to make a purchase or take an action with an advertiser.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "Measurement partners.", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We share information about you with companies that aggregate it to provide analytics and measurement reports to our partners.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "Partners offering goods and services in our Products.", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     When you subscribe to receive premium content, or buy something from a seller in our Products, the content creator or seller can receive your public information and other information that you share with them, as well as the information needed to complete the transaction, including shipping and contact details.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "Vendors and service providers.", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We provide information and content to vendors and service providers who support our business, such as by providing technical infrastructure services, analysing how our Products are used, providing customer service, facilitating payments or conducting surveys.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "Researchers and academics.", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We also provide information and content to research partners and academics to conduct research that advances scholarship and innovation that supports our business or mission and enhances discovery and innovation on topics of general social welfare, technological advancement, public interest, health and well-being.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "Law enforcement or legal requests.", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We share information with law enforcement or in response to legal requests in the circumstances outlined below.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     Learn more about how you can control the information about you that you or others share with third-party partners in the Facebook settings and FLORXY settings.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "IV. How do the Meta Companies work together?", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     Facebook and FLORXY share infrastructure, systems and technology with other Meta Companies (which include WhatsApp and Oculus) to provide an innovative, relevant, consistent and safe experience across all Meta Company Products that you use. We also process information about you across the Meta Companies for these purposes, as permitted by applicable law and in accordance with their terms and policies. For example, we process information from WhatsApp about accounts sending spam on its service so we can take appropriate action against those accounts on Facebook, FLORXY or Messenger. We also work to understand how people use and interact with Meta Company Products, such as understanding the number of unique users on different Meta Company Products.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "V. How can I manage or delete information about me?", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We provide you with the ability to access, rectify, port and delete your data. Learn more in your Facebook settings and FLORXY settings.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We store data until it is no longer necessary to provide our services and Meta Products, or until your account is deleted – whichever comes first. This is a case-by-case determination that depends on things such as the nature of the data, why it is collected and processed, and relevant legal or operational retention needs. For example, when you search for something on Facebook, you can access and delete that query from within your search history at any time, but the log of that search is deleted after six months. If you submit a copy of your government-issued ID for account verification purposes, we delete that copy 30 days after review, unless otherwise stated. Learn more about deletion of content that you have shared and cookie data obtained through social plugins.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     When you delete your account, we delete things that you have posted, such as your photos and status updates, and you won't be able to recover this information later. Information that others have shared about you isn't part of your account and won't be deleted. If you don't want to delete your account but want to temporarily stop using the Products, you can deactivate your account instead. To delete your account at any time, please visit the Facebook settings and FLORXY settings.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "VI. How do we respond to legal requests or prevent harm?", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We access, preserve and share your information with regulators, law enforcement or others:", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - In response to a legal request (e.g. a search warrant, court order or subpoena) if we have a good-faith belief that the law requires us to do so. This may include responding to legal requests from jurisdictions outside of the United States when we have a good-faith belief that the response is required by law in that jurisdiction, affects users in that jurisdiction and is consistent with internationally recognised standards.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - When we have a good-faith belief that it is necessary to: detect, prevent and address fraud, unauthorised use of the Products, breaches of our Terms or Policies, or other harmful or illegal activity; to protect ourselves (including our rights, property or Products), you or others, including as part of investigations or regulatory enquiries; or to prevent death or imminent bodily harm. For example, if relevant, we provide information to and receive information from third-party partners about the reliability of your account to prevent fraud, abuse and other harmful activity on and off our Products.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     Information that we receive about you (including financial transaction data related to purchases made on our Products) can be accessed and preserved for an extended period when it is the subject of a legal request or obligation, governmental investigation or investigations of possible violations of our terms or policies, or otherwise to prevent harm. We also retain information from accounts disabled for term breaches for at least a year to prevent repeat abuse or other term breaches.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "VII. How do we operate and transfer data as part of our global services?", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We share information globally, both internally within the Meta Companies, and externally with our partners and with those you connect and share with around the world in accordance with this policy. Your information may, for example, be transferred or transmitted to, or stored and processed in the United States or other countries outside of where you live for the purposes as described in this Policy. These data transfers are necessary to provide the services set forth in the Meta Terms and FLORXY Terms and to globally operate and provide our Products to you. We utilise standard contract clauses, rely on the European Commission's adequacy decisions about certain countries, as applicable, and obtain your consent for these data transfers to the United States and other countries.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "VIII. How will we notify you of changes to this Policy?", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We'll notify you before we make changes to this Policy and give you the opportunity to review the revised Policy before you choose to continue using our Products.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "IX. How to contact us with questions", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     You can learn more about how privacy works on Facebook and on FLORXY. If you have questions about this policy, you can contact us as described below.", size: 15, color: c.greyMain, fontWeight: f.medium),
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