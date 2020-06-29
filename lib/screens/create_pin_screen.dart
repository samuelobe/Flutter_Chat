import 'package:chat_app/bloc/pin_bloc.dart';
import 'package:chat_app/widgets/pin_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocProvider(
        create: (context) => PinBloc(),
        child: BlocBuilder<PinBloc, PinState>(
          builder: (context, state) {
            if (state is PinAdded && pinValue.length <= 5) {
              pinValue += state.number;
            } else if (state is PinRemoved && pinValue.length > 0) {
              print('removed');
              pinValue = pinValue.substring(0, pinValue.length - 1);
            }
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
                        child: Center(
                            child: Text(
                          pinValue,
                          style: TextStyle(fontSize: 40),
                        )),
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Opacity(
                          opacity: 0,
                          child: PinButton(
                            value: "0",
                          ),
                        ),
                        PinButton(
                          value: "0",
                        ),
                        PinButton(
                          icon: Icon(Icons.backspace),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
