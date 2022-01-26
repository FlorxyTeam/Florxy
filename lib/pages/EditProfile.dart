import 'dart:io';
import 'package:Florxy/NetworkHandler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/fontWeight.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  bool circular = false;
  final networkHandler = NetworkHandler();
  final _globalkey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _profession = TextEditingController();
  TextEditingController _dob = TextEditingController();
  TextEditingController _title = TextEditingController();
  TextEditingController _about = TextEditingController();

  File? image;

  Future takePhoto(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: Icon(Icons.close_rounded),
                      color: c.blackMain,
                      iconSize: 30,
                      onPressed: () => Navigator.of(context).pop()),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Inter(
                        text: "Edit profile",
                        size: 18,
                        color: c.blackMain,
                        fontWeight: f.semiBold),
                  ),
                  Expanded(child: Container()),
                  TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                      ),
                      onPressed: () {},
                      child: Inter(
                        text: "Save",
                        fontWeight: f.bold,
                        color: c.greenMain,
                        size: 18,
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        // resizeToAvoidBottomInset: true,

        child: Center(
          child: Form(
            key: _globalkey,
            child: ListView(
              padding: const EdgeInsets.all(30.0),
              children: <Widget>[
                imageProfile(),
                SizedBox(
                  height: 20,
                ),
                nameTextField(),
                SizedBox(
                  height: 20,
                ),
                professionTextField(),
                SizedBox(
                  height: 20,
                ),
                aboutTextField(),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        color: c.greyMain,
                        height: 55,
                        onPressed: () {},
                        child: Inter(
                          text: "Switch to Professional Account",
                          size: 13,
                          color: c.textWhite,
                          fontWeight: f.bold,
                        )),
                  ],
                ),

                // InkWell(
                //   onTap: () async {
                //     setState(() {
                //       circular = true;
                //     });
                //     if (_globalkey.currentState!.validate()) {
                //       Map<String, String> data = {
                //         "name": _name.text,
                //         "profession": _profession.text,
                //         "DOB": _dob.text,
                //         "titleline": _title.text,
                //         "about": _about.text,
                //       };
                //       var response =
                //           await networkHandler.post("/profile/add", data);
                //       if (response.statusCode == 200 ||
                //           response.statusCode == 201) {
                //         if (image != null) {
                //           var imageResponse = await networkHandler.patchImage(
                //               "/profile/add/image", image!.path);
                //           if (imageResponse.statusCode == 200 ||
                //               imageResponse.statusCode == 201) {
                //             setState(() {
                //               circular = false;
                //             });
                //             Navigator.of(context).pop();
                //           }
                //         } else {
                //           setState(() {
                //             circular = false;
                //           });
                //           Navigator.of(context).pop();
                //         }
                //       }
                //     }
                //   },
                //   child: Center(
                //     child: Container(
                //       child: Center(
                //         child: circular
                //             ? CircularProgressIndicator()
                //             : Text(
                //                 'Submit',
                //                 style: TextStyle(
                //                   color: Colors.white,
                //                   fontSize: 18,
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //       ),
                //       width: 200,
                //       height: 50,
                //       decoration: BoxDecoration(
                //           color: Colors.teal,
                //           borderRadius: BorderRadius.circular(10)),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/img/user_1.jpg'),
            // child: image != null
            //     ? Image.file(
            //   image!,
            //
            // )
            //     : FlutterLogo(
            //
            //
            // ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: c.blackMain.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(50)),
              child: InkWell(
                onTap: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      actions: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 7),
                          child: Column(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                    bottom: BorderSide(
                                        width: 0.8,
                                        color: c.greyMain.withOpacity(0.5)),

                                  )),
                                  child: ListTile(
                                      onTap: () {
                                        takePhoto(ImageSource.camera);
                                      },
                                      title: Inter(
                                        text: "Take photo",
                                        color: c.blackMain,
                                        size: 14,
                                        fontWeight: f.medium,
                                      ))),
                              Container(
                                  child: ListTile(
                                onTap: () {
                                  takePhoto(ImageSource.gallery);
                                },
                                title: Inter(
                                  text: "Choose existing photo",
                                  color: c.blackMain,
                                  size: 14,
                                  fontWeight: f.medium,
                                ),
                              ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget AlertDialog1() {
  //
  //   return Container(
  //     color: Colors.transparent,
  //     width: MediaQuery.of(context).size.width,
  //     margin: EdgeInsets.symmetric(
  //       horizontal: 20,
  //       vertical: 20,
  //     ),
  //     child: Container(
  //       color: c.textWhite,
  //       height: 40,
  //       child: Column(
  //         children: [
  //           Text(
  //             "Choose Profile Image",
  //             style: TextStyle(
  //               fontSize: 20,
  //             ),
  //           ),
  //           SizedBox(
  //             height: 20,
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               FlatButton.icon(
  //                   onPressed: () {
  //                     takePhoto(ImageSource.camera);
  //                   },
  //                   icon: Icon(Icons.camera),
  //                   label: Text("Camera")),
  //               FlatButton.icon(
  //                   onPressed: () {
  //                     takePhoto(ImageSource.gallery);
  //                   },
  //                   icon: Icon(Icons.image),
  //                   label: Text("Gallery")),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  //Name
  Widget nameTextField() {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Poppins(
              text: 'Name', size: 14, color: c.blackSub, fontWeight: f.medium),
        ),
        SizedBox(height: 5),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(13.0)),
          ),
          child: TextFormField(
              decoration: InputDecoration(
            hintText: 'Name',
            hintStyle: TextStyle(
                fontSize: 14, color: c.graySub2, fontWeight: f.medium),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(13.0)),
              borderSide:
                  BorderSide(color: c.graySub2.withOpacity(0), width: 2),
            ),
            prefixText: '---',
            prefixStyle: TextStyle(color: Colors.transparent),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(13.0)),
              borderSide: BorderSide(color: c.greenMain, width: 2),
            ),
          )),
        ),
      ],
    );
  }

  Widget professionTextField() {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Poppins(
              text: 'Username',
              size: 14,
              color: c.blackSub,
              fontWeight: f.medium),
        ),
        SizedBox(height: 5),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(13.0)),
          ),
          child: TextFormField(
              decoration: InputDecoration(
            hintText: '@giopo12',
            hintStyle: TextStyle(
                fontSize: 14, color: c.graySub2, fontWeight: f.medium),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(13.0)),
              borderSide:
                  BorderSide(color: c.graySub2.withOpacity(0), width: 2),
            ),
            prefixText: '---',
            prefixStyle: TextStyle(color: Colors.transparent),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(13.0)),
              borderSide: BorderSide(color: c.greenMain, width: 2),
            ),
          )),
        ),
      ],
    );
  }

  // Widget titlelineTextField() {
  //   return TextFormField(
  //     controller: _title,
  //     validator: (value) {
  //       if (value!.isEmpty) return "titleline can't be empty";
  //       return null;
  //     },
  //     decoration: InputDecoration(
  //       border: OutlineInputBorder(
  //         borderSide: BorderSide(
  //           color: Colors.teal,
  //         ),
  //       ),
  //       focusedBorder: OutlineInputBorder(
  //         borderSide: BorderSide(color: Colors.orange, width: 2),
  //       ),
  //       prefixIcon: Icon(
  //         Icons.person,
  //         color: Colors.green,
  //       ),
  //       labelText: "Titleline",
  //       hintText: "Full Stack, Backend Developer",
  //       helperText: "*Titleline can't be empty",
  //       hintStyle: TextStyle(color: Colors.grey[400]),
  //     ),
  //   );
  // }

  // Widget dobTextField() {
  //   return TextFormField(
  //     controller: _dob,
  //     validator: (value) {
  //       if (value!.isEmpty) return "DOB can't be empty";
  //       return null;
  //     },
  //     decoration: InputDecoration(
  //       border: OutlineInputBorder(
  //         borderSide: BorderSide(
  //           color: Colors.teal,
  //         ),
  //       ),
  //       focusedBorder: OutlineInputBorder(
  //         borderSide: BorderSide(color: Colors.orange, width: 2),
  //       ),
  //       prefixIcon: Icon(
  //         Icons.person,
  //         color: Colors.green,
  //       ),
  //       labelText: "Date of Birth",
  //       hintText: "31/12/2000",
  //       helperText: "provide DOB on dd/mm/yy",
  //       hintStyle: TextStyle(color: Colors.grey[400]),
  //     ),
  //   );
  // }

  Widget aboutTextField() {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Poppins(
              text: 'BIO', size: 14, color: c.blackSub, fontWeight: f.medium),
        ),
        SizedBox(height: 5),
        Container(
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(13.0)),
          ),
          child: TextFormField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText:
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                hintStyle: TextStyle(
                    fontSize: 14, color: c.graySub2, fontWeight: f.medium),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                  borderSide:
                      BorderSide(color: c.graySub2.withOpacity(0), width: 2),
                ),
                prefixText: '---',
                prefixStyle: TextStyle(color: Colors.transparent),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                  borderSide: BorderSide(color: c.greenMain, width: 2),
                ),
              )),
        ),
      ],
    );
    // return TextFormField(
    //   controller: _about,
    //   validator: (value) {
    //     if (value!.isEmpty) return "About can't be empty";
    //     return null;
    //   },
    //   maxLines: 5,
    //   decoration: InputDecoration(
    //     border: OutlineInputBorder(
    //       borderSide: BorderSide(
    //         color: Colors.teal,
    //       ),
    //     ),
    //     focusedBorder: OutlineInputBorder(
    //       borderSide: BorderSide(color: Colors.orange, width: 2),
    //     ),
    //     prefixIcon: Icon(
    //       Icons.person,
    //       color: Colors.green,
    //     ),
    //     labelText: "About me",
    //     hintText: "Hi I'm from thailand",
    //     helperText: "*It can't be empty",
    //     hintStyle: TextStyle(color: Colors.grey[400]),
    //   ),
    // );
  }
}
