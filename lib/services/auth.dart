import 'package:chat_app/model/user.dart';
import 'package:chat_app/screens/users_screen.dart';
import 'package:chat_app/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final Database firestore = Database();

  Future<void> authSignIn({User user, BuildContext context}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //var value;
    try {
      await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      print("Signed In to Firebase Auth");
      prefs.setString("previousUser", user.email);
      print("Previous user set to ${prefs.get("previousUser")}");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => UsersScreen(
                    currentUser: user,
                  )));

      // try {
      //   value = prefs.getStringList(user.email)[1] ?? "";
      // } catch (e) {
      //   value = "";
      // }

      // if (value == "") {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => CreatePinScreen(
      //                 user: user,
      //               )));
      // } else {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => AuthScreen(
      //                 user: user,
      //               )));
      // }
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
      //print(e.message);
    }
  }

  Future<void> authSignUp({User user, BuildContext context}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      await auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);
      firestore.setUserData(user);
      prefs.setString("previousUser", user.email);
      print("Previous user set to ${prefs.get("previousUser")}");
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UsersScreen(
              currentUser: user,
            ),
          ));
    } catch (e) {
      Flushbar(
        margin: EdgeInsets.only(bottom: 5),
        maxWidth: MediaQuery.of(context).size.width * 0.95,
        flushbarStyle: FlushbarStyle.FLOATING,
        borderRadius: 8,
        flushbarPosition: FlushbarPosition.BOTTOM,
        message: "Account already created. Use a different email",
        isDismissible: true,
        duration: Duration(seconds: 3),
        //animationDuration: Duration(milliseconds: 100),
      )..show(context);
      print(e.message);
    }
  }

  createPIN({User user, String pin}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(user.email, [user.password, pin]);
    print("Pin set to ${prefs.getStringList(user.email)[1]}");
  }

  verifyPIN({User user, String pin, BuildContext context}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList(user.email)[1] == pin) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => UsersScreen(
                    currentUser: user,
                  )));
  
    } else {
      Flushbar(
        margin: EdgeInsets.only(bottom: 5),
        maxWidth: MediaQuery.of(context).size.width * 0.95,
        flushbarStyle: FlushbarStyle.FLOATING,
        borderRadius: 8,
        flushbarPosition: FlushbarPosition.BOTTOM,
        message: "Incorrect PIN",
        isDismissible: true,
        duration: Duration(seconds: 3),
        //animationDuration: Duration(milliseconds: 100),
      )..show(context);
    }
  }
}
