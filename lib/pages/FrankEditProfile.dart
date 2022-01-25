import 'dart:io';
import 'package:Florxy/pages/navbar.dart';
import 'package:Florxy/pages/profilepage.dart';
import 'package:Florxy/NetworkHandler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  bool circular = false;
  final networkHandler = NetworkHandler();
  final _globalkey = GlobalKey<FormState>();
  TextEditingController _fullname = TextEditingController();
  TextEditingController _bio = TextEditingController();

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
      body: Center(
        child: Form(
          key: _globalkey,
          child: ListView(
            padding: const EdgeInsets.all(30.0),
            children: <Widget>[
              imageProfile(),
              SizedBox(
                height: 20,
              ),
              fullnameTextField(),
              SizedBox(
                height: 20,
              ),
              bioTextField(),
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
                      "fullname": _fullname.text,
                      "bio": _bio.text,
                    };
                    var response =
                    await networkHandler.patch("/profile/update", data);
                    if (response.statusCode == 200 ||
                        response.statusCode == 201) {
                      if (image != null) {
                        var imageResponse = await networkHandler.patchImage(
                            "/profile/add/image", image!.path);
                        if (imageResponse.statusCode == 200 ||
                            imageResponse.statusCode == 201) {
                          setState(() {
                            circular = false;
                          });
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => Navbar()),
                                  (route) => false);
                        }else {
                          setState(() {
                            circular = false;
                          });
                        }

                      } else {
                        setState(() {
                          circular = false;
                        });
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) =>
                                Navbar()),
                                (route) => false);
                      }
                    }else {
                      setState(() {
                        circular = false;
                      });
                    }
                  }else {
                    setState(() {
                      circular = false;
                    });
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
            bottom: 20,
            right: 20,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => bottomSheet()),
                );
              },
              child: Icon(
                Icons.camera_alt,
                color: Colors.teal,
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
      width: MediaQuery
          .of(context)
          .size
          .width,
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

  Widget fullnameTextField() {
    return TextFormField(
      controller: _fullname,
      validator: (value) {
        if (value!.isEmpty) return "Full-Name can't be empty";
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
        labelText: "Full-Name",
        hintText: "Nattapat Sittichai",
        helperText: "*Full-Name can't be empty",
        hintStyle: TextStyle(color: Colors.grey[400]),
      ),
    );
  }

  Widget bioTextField() {
    return TextFormField(
      controller: _bio,
      validator: (value) {
        if (value!.isEmpty) return "Bio can't be empty";
        return null;
      },
      maxLines: 4,
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
        labelText: "Bio",
        hintText: "Hi I come from Thailand.",
        helperText: "*Bio can't be empty",
        hintStyle: TextStyle(color: Colors.grey[400]),
      ),
    );
  }

}