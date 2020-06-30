import 'package:chat_app/model/user.dart';
import 'package:chat_app/services/auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  String email, password;
  Auth auth = Auth();

  Future<void> signIn() async {
    var formState = _formkey.currentState;

    if (formState.validate()) {
      formState.save();
      var user = User(email: email, password: password);
      auth.authSignIn(user: user, context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Center(
          child: Container(
            padding: EdgeInsets.all(25),
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
                  validator: (input) {
                    var output;
                    if (input.isEmpty) {
                      output = "Please type a username";
                    }
                    return output;
                  },
                  onSaved: (input) => email = input.trim(),
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
                  validator: (input) {
                    var output;
                    if (input.isEmpty) {
                      output = "Please type a password";
                    }
                    return output;
                  },
                  onSaved: (input) => password = input.trim(),
                ),
                SizedBox(
                  height: 30,
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text(
                      "Sign In",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  onPressed: signIn,
                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xfffdfeff),
    );
  }
}
