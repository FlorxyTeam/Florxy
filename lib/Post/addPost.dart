import 'dart:io';

import 'package:Florxy/CustomWidget/OverlayCard.dart';
import 'package:Florxy/Model/profileModel.dart';
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
  TextEditingController _type = TextEditingController();
  TextEditingController _body = TextEditingController();
  String? errorText;
  String? errorpassText;
  bool validate = false;
  bool circular = false;
  final storage = new FlutterSecureStorage();


  ProfileModel profileModel = ProfileModel(
      DOB: '',
      img: '',
      influencer: '',
      fullname: '',
      bio: '',
      email: '',
      professor: '',
      username: '');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchData();
  }
  void fetchData() async{
    var response = await networkHandler.get("/profile/getData");
    setState(() {
      profileModel = ProfileModel.fromJson(response["data"]);
      circular = false;
    });
  }

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
            FlatButton(onPressed: (){
              showModalBottomSheet(context: context, builder: ((builder)=>OverlayCard()));
            }, child: Text("Preview",style: TextStyle(
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
        controller: _type,
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
      child: Center(
        child: InkWell(
          onTap: () async {
            setState(() {
              circular = true;
            });
            print("\n hi \n");
            print(profileModel.username);
            print(profileModel.fullname);
            if (_globalkey.currentState!.validate()) {
              Map<String, String> data = {
                "username":profileModel.username,
                "fullname":profileModel.fullname,
                "type": _type.text,
                "body": _body.text,
              };
              var response =
                  await networkHandler.post("/blogPost/Add", data);
              if (response.statusCode == 200 ||
                  response.statusCode == 201) {
                setState(() {
                  circular = false;
                });
                Navigator.of(context).pop();
              }else{
                setState(() {
                  circular = false;
                });
              }
              // if (response.statusCode == 200 ||
              //     response.statusCode == 201) {
              //   if (image != null) {
              //     var imageResponse = await networkHandler.patchImage(
              //         "/blogPost/add/postImage/:id", image!.path);
              //     if (imageResponse.statusCode == 200 ||
              //         imageResponse.statusCode == 201) {
              //       setState(() {
              //         circular = false;
              //       });
              //       Navigator.of(context).pop();
              //     }else {
              //       setState(() {
              //         circular = false;
              //       });
              //     }
              //
              //   } else {
              //     setState(() {
              //       circular = false;
              //     });
              //     Navigator.of(context).pop();
              //   }
              // }else {
              //   setState(() {
              //     circular = false;
              //   });
              // }
            }
            else {
              setState(() {
                circular = false;
              });
            }
          },
          child: Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.teal),
            child: Center(
              child: circular
                  ? Padding(
                padding:
                const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Center(
                    child: CircularProgressIndicator()
                ),
              )
                  : Inter(
                text: "Save",
                fontWeight: f.bold,
                color: c.textWhite,
                size: 18,
              )
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
