import 'package:flutter/material.dart';
import 'package:g_cam/screens/cam2.dart';
import 'package:g_cam/screens/screen_camera.dart';
import 'package:g_cam/screens/screen_gallary.dart';
import 'package:g_cam/screens/camara_app.dart';
// import 'package:camera/camera.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    gotoHome(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/ava1_loader.gif', fit: BoxFit.cover),
      ),
    );
  }
}

Future<void> gotoHome(context) async {
  await Future.delayed(Duration(seconds: 3));
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (ctx1) => ScreenCam()));
  // await availableCameras().then(
  //   (value) => Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => HomePage()
  //     ),
  //   ),
  // );
}
// CameraPage(
//           cameras: value,
//         ),