// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:path/path.dart';
// import 'package:gallery_saver/gallery_saver.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   File? _image;

//   Future getImgae(ImageSource source) async {
//     try {
//       final image = await ImagePicker().pickImage(source: source);
//       if (image == null) return;
//       // final imagePermanent = await saveFilePermenently(image.path);
//       await saveImage(image);

//       // setState(() {
//       //   this._image = imagePermanent;
//       // });
//     } on PlatformException catch (e) {
//       print('Failed to pickup the image,Exe       $e');
//     }
//   }

//   Future<String> saveImage(Unit8List byte) async {
//     await [Permission.storage].request();
//     final time = DateTime.now()
//         .toIso8601String()
//         .replaceAll('.', '-')
//         .replaceAll(':', '-');
//     final name = 'photos$time';
//     final result = await ImageGallerySaver.saveImage(byte, name: name);
//     return result['filepath'];
//   }

//   Future<File> saveFilePermenently(String imagePath) async {
//     final directory = await getApplicationDocumentsDirectory();
//     final name = basename(imagePath);
//     final image = File('${directory.path}/$name');

//     print(
//         'path is>>>${directory.path}/$name >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
//     print('naem >>>>>>>>>>$name>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
//     print('path >>>>>>>>>>${directory.path}>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');

//     return File(imagePath).copy(image.path);
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.blueAccent,
//       body: SafeArea(
//         child: ListView(children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               'Gallary',
//               style: TextStyle(color: Colors.white, fontSize: 30),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   width: 100,
//                   height: 130,
//                   color: Colors.amber,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   width: 100,
//                   height: 130,
//                   color: Colors.amber,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   width: 100,
//                   height: 130,
//                   color: Colors.amber,
//                 ),
//               ),
//             ],
//           ),
//           ElevatedButton(
//               onPressed: () {
//                 getImgae(ImageSource.camera);
//               },
//               child: Text('camera'))
//         ]),
//       ),
//     );
//   }
// }
