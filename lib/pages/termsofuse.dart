import 'package:flutter/material.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';

class TermsOfUse extends StatefulWidget {
  const TermsOfUse({Key? key}) : super(key: key);

  @override
  _TermsOfUseState createState() => _TermsOfUseState();
}

class _TermsOfUseState extends State<TermsOfUse> {

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
                          text: "Teams Of Use",
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
                              "Teams Of Use",
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
                        child:Inter(text: "     The Facebook company is now Meta. We've updated our Terms of Use, Data Policy and Cookies Policy to reflect the new name on 4 January 2022. While our company name has changed, we are continuing to offer the same products, including FLORXY from Meta. Our Data Policy and Terms of Use remain in effect, and this name change does not affect how we use or share data. Learn more about Meta and our vision for the metaverse.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     Welcome to FLORXY!", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     These Terms of Use (or Terms) govern your use of FLORXY, except where we expressly state that separate terms (and not these) apply, and provide information about the FLORXY Service (the Service), outlined below. When you create an FLORXY account or use FLORXY, you agree to these Terms. The Meta Terms of Service do not apply to this Service.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     The FLORXY Service is one of the Meta Products, provided to you by Meta Platforms, Inc. These Terms of Use therefore constitute an agreement between you and Meta Platforms, Inc.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "The FLORXY Service", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We agree to provide you with the FLORXY Service. The Service includes all of the FLORXY products, features, applications, services, technologies and software that we provide to advance FLORXY's mission: To bring you closer to the people and things you love. The Service is made up of the following aspects:", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - Offering personalised opportunities to create, connect, communicate, discover and share.", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     People are different. We want to strengthen your relationships through shared experiences that you actually care about. So we build systems that try to understand who and what you and others care about, and use that information to help you create, find, join and share in experiences that matter to you. Part of that is highlighting content, features, offers and accounts that you might be interested in, and offering ways for you to experience FLORXY, based on things that you and others do on and off FLORXY.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - Fostering a positive, inclusive and safe environment.", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We develop and use tools and offer resources to our community members that help to make their experiences positive and inclusive, including when we think they might need help. We also have teams and systems that work to combat abuse and breaches of our Terms and Policies, as well as harmful and deceptive behaviour. We use all the information we have ??? including your information ??? to try to keep our platform secure. We may also share information about misuse or harmful content with other Meta Companies or law enforcement. Learn more in the Data Policy.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - Developing and using technologies that help us consistently serve our growing community.", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     Organising and analysing information for our growing community is central to our Service. A big part of our Service is creating and using cutting-edge technologies that help us personalise, protect and improve our Service on an incredibly large scale for a broad global community. Technologies such as artificial intelligence and machine learning give us the power to apply complex processes across our Service. Automated technologies also help us to ensure the functionality and integrity of our Service.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - Providing consistent and seamless experiences across other Meta Company Products.", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     FLORXY is part of the Meta Companies, which share technology, systems, insights and information ??? including the information that we have about you (learn more in the Data Policy) in order to provide services that are better, safer and more secure. We also provide ways to interact across the Meta Company Products that you use, and have designed systems to achieve a seamless and consistent experience across the Meta Company Products.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - Ensuring access to our Service.", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     To operate our global Service, we must store and transfer data across our systems around the world, including outside of your country of residence. The use of this global infrastructure is necessary and essential to provide our Service. This infrastructure may be owned or operated by Meta Platforms, Inc., Meta Platforms Ireland Limited or their affiliates.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - Connecting you with brands, products and services in ways you care about.", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We use data from FLORXY and other Meta Company Products, as well as from third-party partners, to show you ads, offers and other sponsored content that we believe will be meaningful to you. And we try to make that content as relevant as all your other experiences on FLORXY.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - Research and innovation.", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We use the information we have to study our Service and collaborate with others on research to make our Service better and contribute to the well-being of our community.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "How our Service is funded", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     Instead of paying to use FLORXY, by using the Service covered by these Terms, you acknowledge that we can show you ads that businesses and organisations pay us to promote on and off the Meta Company Products. We use your personal data, such as information about your activity and interests, to show you ads that are more relevant to you.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We show you relevant and useful ads without telling advertisers who you are. We don't sell your personal data. We allow advertisers to tell us things such as their business goal and the kind of audience they want to see their ads. We then show their ad to people who might be interested.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We also provide advertisers with reports about the performance of their ads to help them understand how people are interacting with their content on and off FLORXY. For example, we provide general demographic and interest information to advertisers to help them better understand their audience. We don't share information that directly identifies you (information such as your name or email address that by itself can be used to contact you or identifies who you are) unless you give us specific permission. Learn more about how FLORXY ads work here.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     You may see branded content on FLORXY posted by account holders who promote products or services based on a commercial relationship with the business partner mentioned in their content. You can learn more about this here.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "The Data Policy", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     Providing our Service requires collecting and using your information. The Data Policy explains how we collect, use and share information across the Meta Products. It also explains the many ways in which you can control your information, including in the FLORXY privacy and security settings. You must agree to the Data Policy to use FLORXY.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "Your commitments", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     In return for our commitment to provide the Service, we require you to make the below commitments to us.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     Who can use FLORXY. ", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We want our Service to be as open and inclusive as possible, but we also want it to be safe, secure and in accordance with the law. So, we need you to commit to a few restrictions in order to be part of the FLORXY community.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - You must be at least 13 years old or the minimum legal age in your country to use FLORXY.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - You must not be prohibited from receiving any aspect of our Service under applicable laws or engaging in payments-related Services if you are on an applicable denied party listing.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - We must not have previously disabled your account for violation of law or any of our policies.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - You must not be a convicted sex offender.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     How you can't use FLORXY. ", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     How you can't use FLORXY. ", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - You can't impersonate others or provide inaccurate information. You don't have to disclose your identity on FLORXY, but you must provide us with accurate and up-to-date information (including registration information), which may include providing personal data. Also, you may not impersonate someone or something you aren't, and you can't create an account for someone else unless you have their express permission.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - You can't do anything unlawful, misleading or fraudulent or for an illegal or unauthorised purpose.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - You can't violate (or help or encourage others to violate) these Terms or our policies, including in particular the FLORXY Community Guidelines, Meta Platform Terms and Developer Policies and Music Guidelines.If you post branded content, you must comply with our Branded Content Policies, which require you to use our branded content tool. Learn how to report conduct or content in our Help Centre.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - You can't do anything to interfere with or impair the intended operation of the Service.This includes misusing any reporting, dispute or appeals channel, such as by making fraudulent or groundless reports or appeals.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - You can't attempt to create accounts or access or collect information in unauthorised ways.This includes creating accounts or collecting information in an automated way without our express permission.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - You can't sell, licence or purchase any account or data obtained from us or our Service.This includes attempts to buy, sell or transfer any aspect of your account (including your username); solicit, collect or use login credentials or badges of other users; or request or collect FLORXY usernames, passwords or misappropriate access tokens.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - You can't post someone else's private or confidential information without permission or do anything that violates someone else's rights, including intellectual property rights (e.g. copyright infringement, trademark infringement, counterfeit or pirated goods). You may use someone else's works under exceptions or limitations to copyright and related rights under applicable law. You represent that you own or have obtained all necessary rights to the content you post or share. Learn more, including how to report content that you think infringes your intellectual property rights, here.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - You can't modify, translate, create derivative works of or reverse engineer our products or their components.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - You can't use a domain name or URL in your username without our prior written consent.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     Permissions you give to us. ", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     As part of our agreement, you also give us permissions that we need to provide the Service.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We do not claim ownership of your content, but you grant us a licence to use it.Nothing is changing about your rights in your content. We do not claim ownership of your content that you post on or through the Service and you are free to share your content with anyone else, wherever you choose. However, we need certain legal permissions from you (known as a licence) to provide the Service. When you share, post or upload content that is covered by intellectual property rights (such as photos or videos) on or in connection with our Service, you hereby grant to us a non-exclusive, royalty-free, transferable, sub-licensable, worldwide licence to host, use, distribute, modify, run, copy, publicly perform or display, translate and create derivative works of your content (consistent with your privacy and application settings). This licence will end when your content is deleted from our systems. You can delete content individually or all at once by deleting your account. To learn more about how we use information, and how to control or delete your content, review the Data Policy and visit the FLORXY Help Centre.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     Permission to use your username, profile picture and information about your relationships and actions with accounts, ads and sponsored content.You give us permission to show your username, profile picture and information about your actions (such as likes) or relationships (such as follows) next to or in connection with accounts, ads, offers and other sponsored content that you follow or engage with that are displayed on Meta Products, without any compensation to you. For example, we may show that you liked a sponsored post created by a brand that has paid us to display its ads on FLORXY. As with actions on other content and follows of other accounts, actions on sponsored content and follows of sponsored accounts can be seen only by people who have permission to see that content or follow. We will also respect your ad settings. You can learn more here about your ad settings.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     You agree that we can download and install updates to the Service on your device.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "Additional rights we retain", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - If you select a username or similar identifier for your account, we may change it if we believe it is appropriate or necessary (for example, if it infringes someone's intellectual property or impersonates another user).", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - If you use content covered by intellectual property rights that we have and make available in our Service (for example, images, designs, videos, or sounds we provide that you add to content you create or share), we retain all rights to our content (but not yours).", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - You can only use our intellectual property and trademarks or similar marks as expressly permitted by our Brand Guidelines or with our prior written permission.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - You must obtain written permission from us or under an open-source licence to modify, create derivative works of, decompile or otherwise attempt to extract source code from us.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "Content removal and disabling or terminating your account", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - We can remove any content or information that you share on the Service if we believe that it violates these Terms of Use, our policies (including our FLORXY Community Guidelines) or we are permitted or required to do so by law. We can refuse to provide or stop providing all or part of the Service to you (including terminating or disabling your access to the Meta Products and Meta Company Products) immediately to protect our community or services, or if you create risk or legal exposure for us, violate these Terms of Use or our policies (including our FLORXY Community Guidelines), if you repeatedly infringe other people's intellectual property rights, or where we are permitted or required to do so by law. We can also terminate or change the Service, remove or block content or information shared on our Service, or stop providing all or part of the Service if we determine that doing so is reasonably necessary to avoid or mitigate adverse legal or regulatory impacts on us. If you believe that your account has been terminated in error, or you want to disable or permanently delete your account, consult our Help Centre. When you request to delete content or your account, the deletion process will automatically begin no more than 30 days after your request. It may take up to 90 days to delete content after the deletion process begins. While the deletion process for such content is being undertaken, the content is no longer visible to other users, but remains subject to these Terms of Use and our Data Policy. After the content is deleted, it may take us up to another 90 days to remove it from backups and disaster recovery systems.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - where your content has been used by others in accordance with this licence and they have not deleted it (in which case this licence will continue to apply until that content is deleted); or", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - where deletion within 90 days is not possible due to technical limitations of our systems, in which case, we will complete the deletion as soon as technically feasible; or", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - where deletion would restrict our ability to:", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - investigate or identify illegal activity or violations of our terms and policies (for example, to identify or investigate misuse of our products or systems);", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - protect the safety and security of our products, systems and users;", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - comply with a legal obligation, such as the preservation of evidence; or", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - comply with a request of a judicial or administrative authority, law enforcement or a government agency;", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - in which case, the content will be retained for no longer than is necessary for the purposes for which it has been retained (the exact duration will vary on a case-by-case basis).", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - If you delete or we disable your account, these Terms shall terminate as an agreement between you and us, but this section and the section below called 'Our Agreement and What Happens if We Disagree' will still apply even after your account is terminated, disabled or deleted.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "Our agreement and what happens if we disagree", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     Our agreement.", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - Your use of music on the Service is also subject to our Music Guidelines, and your use of our API is subject to our Meta Platform Terms and Developer Policies. If you use certain other features or related services, additional terms will be made available and will also become a part of our agreement. For example, if you use payment features, you will be asked to agree to the Community Payment Terms. If any of those terms conflict with this agreement, those other terms will govern.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - If any aspect of this agreement is unenforceable, the rest will remain in effect.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - Any amendment or waiver to our agreement must be in writing and signed by us. If we fail to enforce any aspect of this agreement, it will not be a waiver.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - We reserve all rights not expressly granted to you.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     Who has rights under this agreement.", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - This agreement does not give rights to any third parties.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - You cannot transfer your rights or obligations under this agreement without our consent.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - Our rights and obligations can be assigned to others. For example, this could occur if our ownership changes (as in a merger, acquisition or sale of assets) or by law.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     Who is responsible if something happens.", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - Our Service is provided as is, and we can't guarantee that it will be safe and secure or will work perfectly all the time. TO THE EXTENT PERMITTED BY LAW, WE ALSO DISCLAIM ALL WARRANTIES, WHETHER EXPRESS OR IMPLIED, INCLUDING THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - We also don't control what people and others do or say, and we aren't responsible for their (or your) actions or conduct (whether online or offline) or content (including unlawful or objectionable content). We also aren't responsible for services and features offered by other people or companies, even if you access them through our Service.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     - Our responsibility for anything that happens on the Service (also called liability) is limited as much as the law will allow. If there is an issue with our Service, we can't know what all the possible impacts might be. You agree that we won't be responsible (liable) for any lost profits, revenues, information or data, or consequential, special, indirect, exemplary, punitive or incidental damages arising out of or related to these Terms, even if we know that they are possible. This includes when we delete your content, information or account.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     How we will handle disputes.", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     If you are a consumer, the laws of the country in which you reside will apply to any claim, cause of action or dispute that you have against us that arises out of or relates to these Terms (claim), and you may resolve your claim in any competent court in that country that has jurisdiction over the claim. In all other cases, you agree that the claim must be resolved exclusively in the US District Court for the Northern District of California or a state court located in San Mateo County, that you submit to the personal jurisdiction of either of these courts for the purpose of litigating any such claim, and that the laws of the State of California will govern these Terms and any claim, without regard to conflict of law provisions. Without prejudice to the foregoing, you agree that, in its sole discretion, Meta Platforms Inc. may also bring any claim that we have against you related to efforts to abuse, interfere or engage with our products in unauthorised ways in the country in which you reside that has jurisdiction over the claim.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     Unsolicited material.", size: 15, color: c.blackMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We always appreciate feedback or other suggestions, but may use them without any restrictions or obligation to compensate you for them, and are under no obligation to keep them confidential.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "Updating these Terms", size: 15, color: c.blackMain, fontWeight: f.bold),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "     We may change our Service and Policies, and we may need to make changes to these Terms so that they accurately reflect our Service and Policies. Unless otherwise required by law, we will notify you (for example, through our Service) before we make changes to these Terms and give you an opportunity to review them before they go into effect. Then, if you continue to use the Service, you will be bound by the updated Terms. If you do not want to agree to these or any updated Terms, you can delete your account here.", size: 15, color: c.greyMain, fontWeight: f.medium),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Inter(text: "Revised: 12 May 2022", size: 15, color: c.greyMain, fontWeight: f.medium),
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