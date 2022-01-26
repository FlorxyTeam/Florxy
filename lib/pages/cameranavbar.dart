import 'package:Florxy/pages/sensepage.dart';
import 'package:Florxy/pages/scanpage.dart';
import 'package:Florxy/pages/importpage.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:boxicons/boxicons.dart';
import 'package:camera/camera.dart';

class CameraNavbar extends StatefulWidget {
  final List<CameraDescription>? cameras;
  const CameraNavbar({this.cameras,Key? key}) : super(key: key);

  @override
  _CameraNavbarState createState() => _CameraNavbarState();
}

class _CameraNavbarState extends State<CameraNavbar> {
  late CameraController controller;
  XFile? pictureFile;

  List pages = [SensePage(), ScanPage(), ImportPage()];
  int _currentIndex = 0;

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

    return Scaffold(
      backgroundColor: c.blackMain,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 0, right: 0, top: 0),
            child: Container(
              height: 700,
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
            ),
          ),
          Opacity(
            opacity: 0.5,
            child: Container(
              color: Colors.black,
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
                      color: Colors.black,
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
                        child: CameraPreview(controller),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 250),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 570),
            child: Center(
              child: Align(
                  alignment: Alignment.topCenter,
                  child: ElevatedButton(
                    onPressed: () async {
                      pictureFile = await controller.takePicture();
                      setState(() {});
                    },
                    child: Icon(Icons.circle_rounded, color: Colors.white, size: 70,),
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
          if (pictureFile != null)
            Image.network(
              pictureFile!.path,
              height: 200,
            ),
          pages[_currentIndex],
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
                              color: _currentIndex == 0
                                  ? c.greyMain.withOpacity(0)
                                  : Colors.black,
                              borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                setState(() {
                                  _currentIndex = 0;
                                });
                              },
                              icon: Icon(Boxicons.bx_search),
                              iconSize: 30,
                              color:
                              _currentIndex == 0 ? Colors.white : c.greyMain,
                          ),
                      ),
                        Poppins(text: "Sense", size: 10, color: _currentIndex == 0 ? Colors.white : c.greyMain, fontWeight: f.bold,)
                    ]),
                    Column(
                      children: [Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              color: _currentIndex == 1
                                  ? c.greyMain.withOpacity(0)
                                  : Colors.black,
                              borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                setState(() {
                                  _currentIndex = 1;
                                });
                              },
                              icon: Icon(Boxicons.bx_barcode_reader),
                              iconSize: 30,
                              color:
                              _currentIndex == 1 ? Colors.white : c.greyMain,
                          ),
                      ),
                        Poppins(
                          text: "Scan",
                          size: 10,
                          color: _currentIndex == 1 ? Colors.white : c.greyMain,
                          fontWeight: f.bold,
                        ),
                    ]),
                    Column(
                      children: [Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              color: _currentIndex == 2
                                  ? c.greyMain.withOpacity(0)
                                  : Colors.black,
                              borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                setState(() {
                                  _currentIndex = 2;
                                });
                              },
                              icon: Icon(Boxicons.bx_import),
                              iconSize: 30,
                              color:
                              _currentIndex == 2 ? Colors.white : c.greyMain,
                          ),
                      ),
                        Poppins(
                          text: "Import",
                          size: 10,
                          color: _currentIndex == 2 ? Colors.white : c.greyMain,
                          fontWeight: f.bold,
                        ),
                    ]),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}