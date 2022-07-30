import 'package:flutter/material.dart';
import 'package:g_cam/screens/screen_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Color.fromARGB(
            255,
            1,
            160,
            172,
          ),
          fontFamily: 'Sen',
        ),
        home: SplashScreen());
  }
}
