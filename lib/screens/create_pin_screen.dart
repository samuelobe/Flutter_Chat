import 'package:chat_app/widgets/pin_button.dart';
import 'package:flutter/material.dart';

class CreatePinScreen extends StatefulWidget {
  CreatePinScreen({Key key}) : super(key: key);

  @override
  _CreatePinScreenState createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen> {
  String pinValue = "";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Pin")),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 60,
            ),
            Card(
              child: Container(
                height: 100,
                color: Colors.black26,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                PinButton(
                  value: "1",
                ),
                PinButton(
                  value: "2",
                ),
                PinButton(
                  value: "3",
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                PinButton(
                  value: "4",
                ),
                PinButton(
                  value: "5",
                ),
                PinButton(
                  value: "6",
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                PinButton(
                  value: "7",
                ),
                PinButton(
                  value: "8",
                ),
                PinButton(
                  value: "9",
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                PinButton(
                  value: "0",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
