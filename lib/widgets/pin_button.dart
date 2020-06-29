import 'package:flutter/material.dart';

class PinButton extends StatelessWidget {
  final String value;
  PinButton({this.value});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.grey,
      child: Text(
        value,
        style: TextStyle(fontSize: 30),
      ),
      onPressed: () {},
    );
  }
}
