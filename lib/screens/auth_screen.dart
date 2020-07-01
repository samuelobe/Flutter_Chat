import 'package:chat_app/model/user.dart';
import 'package:chat_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:local_auth/local_auth.dart';

class AuthScreen extends StatefulWidget {
  final User user;
  AuthScreen({this.user});

  @override
  AuthScreenState createState() => AuthScreenState();
}

class AuthScreenState extends State<AuthScreen> {
  final TextEditingController _pinPutController1 = TextEditingController();
  final FocusNode _pinPutFocusNode1 = FocusNode();
  Auth auth = Auth();
  LocalAuthentication localAuth = LocalAuthentication();

  String submittedPin = "";

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.blue),
      borderRadius: BorderRadius.circular(15),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("PIN"),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Type in your pin"),
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(20),
                  child: PinPut(
                    fieldsCount: 6,
                    onSubmit: (String pin) {
                      submittedPin = pin;
                    },
                    focusNode: _pinPutFocusNode1,
                    controller: _pinPutController1,
                    submittedFieldDecoration: _pinPutDecoration.copyWith(
                        borderRadius: BorderRadius.circular(20)),
                    selectedFieldDecoration: _pinPutDecoration,
                    followingFieldDecoration: _pinPutDecoration.copyWith(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
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
                  onPressed: () {
                    auth.verifyPIN(
                        user: widget.user, pin: submittedPin, context: context);
                  },
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
                      "Sign In with Biometrics",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  onPressed: () async {
                    // bool biometricsAvailable =
                    //     await localAuth.canCheckBiometrics;

                    // if (biometricsAvailable) {
                    //   var auth = localAuth.authenticateWithBiometrics(
                    //       localizedReason: "Sign into your chat app account");
                    //   print(auth);
                    // }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
