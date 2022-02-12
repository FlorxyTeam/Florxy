import 'dart:io';

import 'package:Florxy/NetworkHandler.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:Florxy/widgets/fontWeight.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final _globalkey = GlobalKey<FormState>();
  NetworkHandler networkHandler = NetworkHandler();
  TextEditingController _title = TextEditingController();
  TextEditingController _body = TextEditingController();
  String? errorText;
  String? errorpassText;
  bool validate = false;
  bool circular = false;
  final storage = new FlutterSecureStorage();

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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.clear),
            color: Colors.grey,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            FlatButton(onPressed: (){}, child: Text("Preview",style: TextStyle(
              fontSize: 18,
              color: Colors.teal,
            ),)),
          ],
        ),
        body: Form(
          key: _globalkey,
          child: ListView(
            children: [
              imageProfile(),
              titleTextField(),
              bodyTextField(),
              SizedBox(
                height: 30,
              ),
              addButton(),
            ],
          ),
        ));
  }

  Widget titleTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: TextFormField(
        controller: _title,
        validator: (value){
          if(value!.isEmpty){
            return "Title can't be empty";
          }
         return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange,
              width: 2,
            ),
          ),
          labelText: "Add Image and Title",
          prefixIcon: IconButton(
            icon: Icon(
              Icons.image,
              color: Colors.teal,
            ),
            onPressed: () {
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
                                  onTap: () async {
                                    Future.delayed(Duration(seconds: 5));
                                    Navigator.of(context).pop();
                                    await takePhoto(ImageSource.camera);
                                  },
                                  title: Inter(
                                    text: "Take photo",
                                    color: c.blackMain,
                                    size: 14,
                                    fontWeight: f.medium,
                                  ))),
                          Container(
                              child: ListTile(
                                onTap: () async {
                                  Future.delayed(Duration(seconds: 5));
                                  Navigator.of(context).pop();
                                  await takePhoto(ImageSource.gallery);
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
          ),
        ),
        maxLength: 100,
        maxLines: null,
      ),
    );
  }

  Widget bodyTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: TextFormField(
        controller: _body,
        validator: (value){
          if(value!.isEmpty){
            return "Body can't be empty";
          }
          return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange,
              width: 2,
            ),
          ),
          labelText: "Provide Body Your Post",
        ),
        maxLines: null,
      ),
    );
  }

  Widget addButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: InkWell(
        onTap: (){
          print('hi');
        },
        child: Center(
          child: Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.teal),
            child: Center(
              child: Text(
                "Add Post",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
          Container(
              child: image == null ? Container(
                child:  FlutterLogo(
                  size: 120,
                ),
              ) : Container(
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(50)
                ),
                child: ClipOval(
                  child: Image.file(
                    image!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              )
          ),
          // Positioned(
          //   bottom: 0,
          //   right: 0,
          //   child: Container(
          //     height: 100,
          //     width: 100,
          //     decoration: BoxDecoration(
          //         color: c.blackMain.withOpacity(0.5),
          //         borderRadius: BorderRadius.circular(50)),
          //     child: InkWell(
          //       onTap: () {
          //         showDialog<String>(
          //           context: context,
          //           builder: (BuildContext context) => AlertDialog(
          //             backgroundColor: Colors.white,
          //             shape: RoundedRectangleBorder(
          //                 borderRadius:
          //                 BorderRadius.all(Radius.circular(10.0))),
          //             actions: <Widget>[
          //               Padding(
          //                 padding: const EdgeInsets.only(left: 7),
          //                 child: Column(
          //                   children: [
          //                     Container(
          //                         decoration: BoxDecoration(
          //                             border: Border(
          //                               bottom: BorderSide(
          //                                   width: 0.8,
          //                                   color: c.greyMain.withOpacity(0.5)),
          //
          //                             )),
          //                         child: ListTile(
          //                             onTap: () async {
          //                               Future.delayed(Duration(seconds: 5));
          //                               Navigator.of(context).pop();
          //                               await takePhoto(ImageSource.camera);
          //                             },
          //                             title: Inter(
          //                               text: "Take photo",
          //                               color: c.blackMain,
          //                               size: 14,
          //                               fontWeight: f.medium,
          //                             ))),
          //                     Container(
          //                         child: ListTile(
          //                           onTap: () async {
          //                             Future.delayed(Duration(seconds: 5));
          //                             Navigator.of(context).pop();
          //                             await takePhoto(ImageSource.gallery);
          //                           },
          //                           title: Inter(
          //                             text: "Choose existing photo",
          //                             color: c.blackMain,
          //                             size: 14,
          //                             fontWeight: f.medium,
          //                           ),
          //                         ))
          //                   ],
          //                 ),
          //               ),
          //             ],
          //           ),
          //         );
          //       },
          //       child: Icon(
          //         Icons.camera_alt_outlined,
          //         color: Colors.white,
          //         size: 30,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

}
