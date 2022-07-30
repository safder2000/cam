// import 'dart:io';

// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';

// class CameraPage extends StatefulWidget {
//   final List<CameraDescription>? cameras;
//   const CameraPage({this.cameras, Key? key}) : super(key: key);

//   @override
//   _CameraPageState createState() => _CameraPageState();
// }

// class _CameraPageState extends State<CameraPage> {
//   late CameraController controller;
//   XFile? pictureFile;

//   @override
//   void initState() {
//     super.initState();
//     controller = CameraController(
//       widget.cameras![0],
//       ResolutionPreset.max,
//     );
//     controller.initialize().then((_) {
//       if (!mounted) {
//         return;
//       }
//       setState(() {});
//     });
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     if (!controller.value.isInitialized) {
//       return const SizedBox(
//         child: Center(
//           child: CircularProgressIndicator(),
//         ),
//       );
//     }
//     return Column(
//       children: [
//         SafeArea(
//           child: Center(
//             child: SizedBox(
//               height: size.height / 1.2,
//               width: size.width,
//               child: CameraPreview(controller),
//             ),
//           ),
//         ),
//         Expanded(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Expanded(
//                 flex: 3,
//                 child: Row(
//                   children: [
//                     SizedBox(
//                       width: 60,
//                       height: 50,
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             primary: Colors.black54,
//                             side: BorderSide(
//                               width: 2.0,
//                               color: Colors.white38,
//                             ),
//                           ),
//                           onPressed: () async {
//                             pictureFile = await controller.takePicture();
//                             setState(() {});
//                           },
//                           child: Icon(Icons.perm_media)),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 flex: 5,
//                 child: Row(
//                   children: [
//                     SizedBox(
//                       width: 80,
//                       height: 70,
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             primary: Colors.black54,
//                             side: BorderSide(
//                               width: 2.0,
//                               color: Colors.white38,
//                             ),
//                           ),
//                           onPressed: () async {
//                             pictureFile = await controller.takePicture();
//                             setState(() {});
//                           },
//                           child: Icon(
//                             Icons.photo_camera,
//                             size: 40,
//                           )),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         if (pictureFile != null) Image.file(File(pictureFile!.path))
//         //Android/iOS
//         // Image.file(File(pictureFile!.path)))
//       ],
//     );
//   }
// }
