import 'package:chat_app/model/user.dart';
import 'package:chat_app/screens/users_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> authSignIn(
      {User user, BuildContext context}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      await auth.signInWithEmailAndPassword(email: user.email, password: user.password);
      prefs.setStringList(user.email, [user.password, ""]);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UsersScreen(),
          ));
    } catch (e) {
      Flushbar(
        margin: EdgeInsets.only(bottom: 5),
        maxWidth: MediaQuery.of(context).size.width * 0.95,
        flushbarStyle: FlushbarStyle.FLOATING,
        borderRadius: 8,
        flushbarPosition: FlushbarPosition.BOTTOM,
        message: "Incorrect username or password",
        isDismissible: true,
        duration: Duration(seconds: 3),
        //animationDuration: Duration(milliseconds: 100),
      )..show(context);
      print(e.message);
    }
  }
}
