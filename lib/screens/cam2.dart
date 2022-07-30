import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';

class ScreenCam extends StatefulWidget {
  const ScreenCam({Key? key}) : super(key: key);

  @override
  State<ScreenCam> createState() => _ScreenCamState();
}

class _ScreenCamState extends State<ScreenCam> {
  File? image;
  bool isCam = false;
  Future pickImage(ImageSource _source, isCam) async {
    try {
      final image = await ImagePicker().pickImage(source: _source);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
      if (isCam) {
        await GallerySaver.saveImage(image.path);
        isCam = false;
      }
    } on PlatformException catch (e) {
      print('cant pick up image,,Exeption>$e');
    }
  }

  Future fromCamera(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
      await GallerySaver.saveImage(image.path);
    } on PlatformException catch (e) {
      print('cant pick up image,,Exeption>$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 98, 168, 163),
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/2.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height / 1.3,
                      child: image != null
                          ? Expanded(child: Image.file(image!))
                          : Container(
                              child: Stack(children: <Widget>[
                                Positioned.fill(
                                  child: Image(
                                    image: AssetImage('assets/images/2.jpg'),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Color.fromARGB(200, 172, 207, 190),
                                    size: 250,
                                  ),
                                )
                              ]),
                            ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: SizedBox(
                          height: 40,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(
                                255,
                                1,
                                160,
                                172,
                              )),
                              onPressed: () =>
                                  pickImage(ImageSource.gallery, isCam = false),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.image),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    'Gallary',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              )),
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: SizedBox(
                          height: 40,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(
                                255,
                                1,
                                160,
                                172,
                              )),
                              onPressed: () =>
                                  pickImage(ImageSource.camera, isCam = true),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.camera),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    'Camera',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
