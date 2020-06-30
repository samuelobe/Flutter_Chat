import 'package:flutter/material.dart';

class CreatePinScreen extends StatefulWidget {
  CreatePinScreen({Key key}) : super(key: key);

  @override
  _CreatePinScreenState createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen> {
  String pinValue = "";
  int maxLength = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
