import 'package:chat_app/screens/auth_screen.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

import 'model/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Widget initialPage;
  try {
    var previousUser = prefs.get("previousUser");
    var previousUserInfo = prefs.get(previousUser);
    if (previousUserInfo[1] == "") {
      initialPage = LoginScreen();
    } else {
      initialPage = AuthScreen(
        user: User(email: previousUser, password: previousUserInfo[0]),
      );
    }
  } catch (e) {
    initialPage = LoginScreen();
  }

  runApp(MyApp(
    initialScreen: initialPage,
  ));
}

class MyApp extends StatelessWidget {
  final Widget initialScreen;
  MyApp({this.initialScreen});
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
        navigateAfterSeconds: initialScreen,
        image: Image.asset('assets/ehiapps.gif'),
      ),
    );
  }
}
