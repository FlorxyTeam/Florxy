import 'dart:io';
import 'package:Florxy/pages/scanpage.dart';
import 'package:Florxy/pages/navbar.dart';
import 'package:boxicons/boxicons.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';
import 'package:image_picker/image_picker.dart';

class SensePage extends StatefulWidget {
  final List<CameraDescription>? cameras;
  const SensePage({this.cameras,Key? key}) : super(key: key);

  @override
  _SensePageState createState() => _SensePageState();
}

class _SensePageState extends State<SensePage> {
  late CameraController controller;
  File? import;
  XFile? pictureFile;

  @override
  Future takePhoto(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.import = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }

  @override
  void initState() {
    super.initState();
    controller = CameraController(
      widget.cameras![0],
      ResolutionPreset.max,
    );
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    if (!controller.value.isInitialized) {
      return const SizedBox(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: c.blackMain.withOpacity(0),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 70),
            child: import == null ? Container(
              height: double.infinity,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),

                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: CameraPreview(controller),
                ),
              ),
            ) : Container(
              height: double.infinity,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),

                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Image.file(
                    import!,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ),
          Opacity(
            opacity: 0,
            child: Container(
              color: Colors.black,
            ),
          ),
          SizedBox(height: 250),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 200),
            child: Center(
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.remove_red_eye_outlined,
                            color: c.greyMain.withOpacity(0.8),
                          ),
                        ),
                        TextSpan(
                          text: ' Sense your product here',
                          style: TextStyle(
                            color: c.greyMain.withOpacity(0.8),
                            fontWeight: f.bold,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(55.0),
                border: Border.all(
                  color: Colors.white,
                  width: 3.0,
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0),
                      offset: Offset(0.0, 0.0),
                      blurRadius: 10.0
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(55.0),
                child: Align(
                  alignment: Alignment.center,
                  widthFactor: 0.70,
                  heightFactor: 0.70,
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),

                      ),
                      child: AspectRatio(
                        aspectRatio: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 250),
          Padding(
            padding: const EdgeInsets.only(right: 50, top: 590),
            child: Center(
              child: Align(
                  alignment: Alignment.topRight,
                  child: pictureFile == null ? Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.white,
                        width: 3.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0),
                            offset: Offset(0.0, 0.0),
                            blurRadius: 10.0
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Align(
                        alignment: Alignment.center,
                        widthFactor: 0.30,
                        heightFactor: 0.30,
                        child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                              bottomRight: Radius.circular(30.0),
                              bottomLeft: Radius.circular(30.0),

                            ),
                            child: AspectRatio(
                              aspectRatio: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ) : Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.white,
                        width: 3.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0),
                            offset: Offset(0.0, 0.0),
                            blurRadius: 10.0
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Align(
                        alignment: Alignment.center,
                        widthFactor: 0.30,
                        heightFactor: 0.30,
                        child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                              bottomRight: Radius.circular(30.0),
                              bottomLeft: Radius.circular(30.0),

                            ),
                            child: Image.file(
                              File(pictureFile!.path,),
                              height: 200,
                              width: 200,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
              ),
            ),
          ),
          SizedBox(height: 250),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 590),
            child: Center(
              child: Align(
                  alignment: Alignment.topCenter,
                  child: ElevatedButton(
                    onPressed: () {
                    },
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () async {
                        pictureFile = await controller.takePicture();
                        setState(() {});
                      },
                      icon: Icon(Icons.circle_rounded, color: Colors.white, size: 45,),
                    ),
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(width:3, color:Colors.white),
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(1),
                      primary: Colors.white.withOpacity(0),
                      onPrimary: Colors.black,
                    ),
                  )
              ),
            ),
          ),
          SafeArea(
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 10, top: 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GFButton(
                          onPressed:  () {
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute
                              (builder: (context)=>Navbar()), (route) => false);
                          },
                          text: 'on',
                          textStyle : TextStyle(color: Colors.yellow, fontSize: 15, fontWeight: FontWeight.bold),
                          icon: Icon(Icons.flash_on,size: 15,color: Colors.yellow,),
                          color: Colors.yellow,
                          type: GFButtonType.outline2x,
                          shape: GFButtonShape.pills,
                          size: GFSize.LARGE,
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute
                              (builder: (context)=>Navbar()), (route) => false);
                          },
                          icon: Icon(
                            Icons.close_rounded,
                            size: 36,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
          ),
          Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: size.width,
                height: Theme.of(context).platform==TargetPlatform.android?70:95,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                        children: [Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: c.greyMain.withOpacity(0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: Icon(Boxicons.bx_search),
                            iconSize: 30,
                            color: Colors.white,
                          ),
                        ),
                          Poppins(
                            text: "Sense",
                            size: 10,
                            color: Colors.white,
                            fontWeight: f.bold,
                          ),
                        ]
                    ),
                    Column(
                        children: [Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () async {
                              await availableCameras().then((value) => Navigator.push(context, MaterialPageRoute(builder: (context) => ScanPage(cameras: value))));
                            },
                            icon: Icon(Boxicons.bx_barcode_reader),
                            iconSize: 30,
                            color: c.greyMain,
                          ),
                        ),
                          Poppins(
                            text: "Scan",
                            size: 10,
                            color: c.greyMain,
                            fontWeight: f.bold,
                          ),
                        ]
                    ),
                    Column(
                        children: [Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(5.0))),
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
                                                    await takePhoto(ImageSource.gallery);
                                                  },
                                                  title: Inter(
                                                    text: "Choose Image Product",
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
                                                  text: "Choose Barcode",
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
                            icon: Icon(Boxicons.bx_import),
                            iconSize: 30,
                            color: c.greyMain,
                          ),
                        ),
                          Poppins(
                            text: "Import",
                            size: 10,
                            color: c.greyMain,
                            fontWeight: f.bold,
                          ),
                        ]
                    ),
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}