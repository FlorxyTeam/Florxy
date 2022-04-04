import 'dart:io';
import 'package:Florxy/pages/scanpage.dart';
import 'package:Florxy/pages/navbar.dart';
import 'package:boxicons/boxicons.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

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
  bool flash = true;
  late List _result;
  String _confident = "";
  String _name = "";
  int state = 0;

  String number = "";

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
    loadModel();
  }

  loadModel() async{
    var resultant = await Tflite.loadModel(
      labels: 'assets/model/labels.txt',
      model: 'assets/model/model_unquant.tflite'
    );
    print("Result : $resultant");
  }

  applyModelOnImage(XFile file) async {
    var res = await Tflite.runModelOnImage(
      path: file.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5
    );
    setState(() {
      _result = res!;

      String str = _result[0]["label"];

      _name = str.substring(2);
      _confident = _result != null ? (_result[0]['confidence'] * 100.0).toString().substring(0,2) + "%" : "";
    });
    print(_name+" with "+_confident);

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

    return (state==0)?Scaffold(
      backgroundColor: c.blackMain.withOpacity(0),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 100),
            child: import == null ? Container(
              height: double.infinity,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(25.0),
                  bottomLeft: Radius.circular(25.0),

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
                  bottomLeft: Radius.circular(.0),

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
          // SizedBox(height: 250),
          // Padding(
          //   padding: EdgeInsets.only(left: 20, right: 20, top: 200),
          //   child: Center(
          //     child: Align(
          //         alignment: Alignment.topCenter,
          //         child: Text.rich(
          //           TextSpan(
          //             children: [
          //               WidgetSpan(
          //                 child: Icon(
          //                   Icons.remove_red_eye_outlined,
          //                   color: c.greyMain.withOpacity(0.8),
          //                 ),
          //               ),
          //               TextSpan(
          //                 text: ' Sense your product here',
          //                 style: TextStyle(
          //                   color: c.greyMain.withOpacity(0.8),
          //                   fontWeight: f.bold,
          //                   fontSize: 17,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         )
          //     ),
          //   ),
          // ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 140,
            child: ElevatedButton(
              onPressed: () async {
                pictureFile = await controller.takePicture();
              print("hereeeeeeeeeeee"+pictureFile!.path);
              applyModelOnImage(pictureFile!);
              setState(() {

              });
              },
              child: Icon(Icons.circle_rounded, color: Colors.white, size: 75,),
              style: ElevatedButton.styleFrom(
                side: BorderSide(width:3, color:Colors.white),
                shape: CircleBorder(),
                padding: EdgeInsets.all(1),
                primary: Colors.white.withOpacity(0),
                onPrimary: Colors.black,
              ),
            ),
          ),
          SafeArea(
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: (){
                            setState(() {
                              flash = !flash;
                            });
                            flash ? controller.setFlashMode(FlashMode.off)
                                : controller.setFlashMode(FlashMode.torch);
                          },
                          icon: Icon(
                            flash ? Icons.flash_off_sharp : Icons.flash_on_sharp,
                            color: flash ? c.yellowMain : Colors.white,
                          ),
                          label: Text(
                            flash ? "Off" : "On ",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: flash ? c.yellowMain: Colors.white,

                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: flash ? c.yellowMain.withOpacity(0) : c.yellowMain,
                            side: BorderSide(width:3, color: c.yellowMain),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute
                              (builder: (context)=>Navbar(currentState: 0)), (route) => false);
                          },
                          icon: Icon(
                            Icons.close_rounded,
                            size: 32,
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
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.only(top:12.0),
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
                              onPressed: () {
                                setState(() {
                                  state = 1;
                                });
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
                ),
              )
          ),
        ],
      ),
    )
        :Scaffold(
      backgroundColor: c.blackMain.withOpacity(0),
      body: Stack(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 100),
              child: import == null ? Container(
                height: double.infinity,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                    bottomRight: Radius.circular(25.0),
                    bottomLeft: Radius.circular(25.0),

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
                    bottomLeft: Radius.circular(.0),

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
          // SizedBox(height: 250),
          // Padding(
          //   padding: EdgeInsets.only(left: 20, right: 20, top: 200),
          //   child: Center(
          //     child: Align(
          //         alignment: Alignment.topCenter,
          //         child: Text.rich(
          //           TextSpan(
          //             children: [
          //               WidgetSpan(
          //                 child: Icon(
          //                   Icons.remove_red_eye_outlined,
          //                   color: c.greyMain.withOpacity(0.8),
          //                 ),
          //               ),
          //               TextSpan(
          //                 text: ' Sense your product here',
          //                 style: TextStyle(
          //                   color: c.greyMain.withOpacity(0.8),
          //                   fontWeight: f.bold,
          //                   fontSize: 17,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         )
          //     ),
          //   ),
          // ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 140,
            child: ElevatedButton(
              onPressed: () async {
                pictureFile = await controller.takePicture();
                print("hereeeeeeeeeeee"+pictureFile!.path);
                applyModelOnImage(pictureFile!);
                setState(() {

                });
              },
              child: Icon(Icons.circle_rounded, color: Colors.white, size: 75,),
              style: ElevatedButton.styleFrom(
                side: BorderSide(width:3, color:Colors.white),
                shape: CircleBorder(),
                padding: EdgeInsets.all(1),
                primary: Colors.white.withOpacity(0),
                onPrimary: Colors.black,
              ),
            ),
          ),
          SafeArea(
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: (){
                            setState(() {
                              flash = !flash;
                            });
                            flash ? controller.setFlashMode(FlashMode.off)
                                : controller.setFlashMode(FlashMode.torch);
                          },
                          icon: Icon(
                            flash ? Icons.flash_off_sharp : Icons.flash_on_sharp,
                            color: flash ? c.yellowMain : Colors.white,
                          ),
                          label: Text(
                            flash ? "Off" : "On ",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: flash ? c.yellowMain: Colors.white,

                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: flash ? c.yellowMain.withOpacity(0) : c.yellowMain,
                              side: BorderSide(width:3, color: c.yellowMain),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute
                              (builder: (context)=>Navbar(currentState: 0)), (route) => false);
                          },
                          icon: Icon(
                            Icons.close_rounded,
                            size: 32,
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
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.only(top:12.0),
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
                              onPressed: () {
                                setState(() {
                                  state = 0;
                                });
                              },
                              icon: Icon(Boxicons.bx_search),
                              iconSize: 30,
                              color: c.greyMain,
                            ),
                          ),
                            Poppins(
                              text: "Sense",
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

                              },
                              icon: Icon(Boxicons.bx_barcode_reader),
                              iconSize: 30,
                              color: Colors.white,
                            ),
                          ),
                            Poppins(
                              text: "Scan",
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
                ),
              )
          ),
        ],
      ),
    );
  }
}