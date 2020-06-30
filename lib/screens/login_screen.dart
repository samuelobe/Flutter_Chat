import 'package:chat_app/screens/auth_screen.dart';
import 'package:chat_app/screens/create_pin_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            child: ListView(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              children: <Widget>[
                Image.asset(
                  "assets/ehi_logo.png",
                  height: MediaQuery.of(context).size.height * 0.20,
                ),
                SizedBox(
                  height: 70,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Username",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(),
                    ),
                    //fillColor: Colors.green
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(),
                    ),
                    //fillColor: Colors.green
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(
                  height: 50,
                ),
                RaisedButton(
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 25),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreatePinScreen(),//PinPutTest(),
                        ));
                  },
                )
              ],
            ),
          ),
        ),
        backgroundColor: const Color(0xfffdfeff),
      ),
    );
  }
}
