import 'package:chat_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo Chat App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(
        loaderColor: const Color(0xfffdfeff),
        backgroundColor: const Color(0xfffdfeff),
        seconds: 6,
        photoSize: 200,
        navigateAfterSeconds: LoginScreen(),
        image: Image.asset('assets/ehiapps.gif'),),
    );
  }
}
