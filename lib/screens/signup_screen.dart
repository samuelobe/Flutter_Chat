import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formkey = GlobalKey<FormState>();
  String fullName = "";
  String emailAddress = "";
  String password = "";

  void createAccount() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.account_circle,
                      size: 30,
                    ),
                    labelText: "First Name",
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
                      output = "Please type your first name";
                    }
                    return output;
                  },
                  //onSaved: (input) => password = input.trim(),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.account_circle,
                      size: 30,
                    ),
                    labelText: "Last Name",
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
                      output = "Please type your first name";
                    }
                    return output;
                  },
                  //onSaved: (input) => password = input.trim(),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.account_circle,
                      size: 30,
                    ),
                    labelText: "Phone Number",
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
                      output = "Please type your first name";
                    }
                    return output;
                  },
                  //onSaved: (input) => password = input.trim(),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.mail,
                      size: 30,
                    ),
                    labelText: "Email Address",
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
                      output = "Please type an email address";
                    }
                    return output;
                  },
                  //onSaved: (input) => password = input.trim(),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      size: 30,
                    ),
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
                  //onSaved: (input) => password = input.trim(),
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text(
                      "Create Account",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  onPressed: createAccount,
                ),
              ],
            ),
          )),
    );
  }
}
