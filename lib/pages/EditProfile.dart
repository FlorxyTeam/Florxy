import 'dart:io';
import 'package:Florxy/NetworkHandler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
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
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    setState(() {
                      circular = true;
                    });
                    if (_globalkey.currentState!.validate()) {
                      Map<String, String> data = {
                        "name": _name.text,
                        "profession": _profession.text,
                        "DOB": _dob.text,
                        "titleline": _title.text,
                        "about": _about.text,
                      };
                      var response =
                      await networkHandler.post("/profile/add", data);
                      if (response.statusCode == 200 ||
                          response.statusCode == 201) {
                        if (image != null) {
                          var imageResponse = await networkHandler.patchImage(
                              "/profile/add/image", image!.path);
                          if (imageResponse.statusCode==200||imageResponse.statusCode==201){
                            setState(() {
                              circular = false;
                            });
                            Navigator.of(context).pop();
                          }
                        }else {
                          setState(() {
                            circular = false;
                          });
                          Navigator.of(context).pop();
                        }

                      }
                    }
                  },
                  child: Center(
                    child: Container(
                      child: Center(
                        child: circular
                            ? CircularProgressIndicator()
                            : Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
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
          image != null
              ? Image.file(
            image!,
            width: 200,
            height: 200,
          )
              : FlutterLogo(
            size: 120,
          ),
          Positioned(
            bottom: 45,
            right: 45,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => bottomSheet()),
                );
              },
              child: Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            "Choose Profile Image",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                  },
                  icon: Icon(Icons.camera),
                  label: Text("Camera")),
              FlatButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                  },
                  icon: Icon(Icons.image),
                  label: Text("Gallery")),
            ],
          ),
        ],
      ),
    );
  }

  Widget nameTextField() {
    return TextFormField(
      controller: _name,
      validator: (value) {
        if (value!.isEmpty) return "Name can't be empty";
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange, width: 2),
        ),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.green,
        ),
        labelText: "Name",
        hintText: "Nattapat Sittichai",
        helperText: "*Name can't be empty",
        hintStyle: TextStyle(color: Colors.grey[400]),
      ),
    );
  }

  Widget professionTextField() {
    return TextFormField(
      controller: _profession,
      validator: (value) {
        if (value!.isEmpty) return "Profession can't be empty";
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange, width: 2),
        ),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.green,
        ),
        labelText: "Profession",
        hintText: "Full Stack, Backend Developer",
        helperText: "*Profession can't be empty",
        hintStyle: TextStyle(color: Colors.grey[400]),
      ),
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
    return TextFormField(
      controller: _about,
      validator: (value) {
        if (value!.isEmpty) return "About can't be empty";
        return null;
      },
      maxLines: 2,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange, width: 2),
        ),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.green,
        ),
        labelText: "About me",
        hintText: "Hi I'm from thailand",
        helperText: "*It can't be empty",
        hintStyle: TextStyle(color: Colors.grey[400]),
      ),
    );
  }
}
