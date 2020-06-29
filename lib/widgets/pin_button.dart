import 'package:chat_app/bloc/pin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PinButton extends StatefulWidget {
  final String value;
  final Icon icon;
  PinButton({this.value, this.icon});

  @override
  _PinButtonState createState() => _PinButtonState();
}

class _PinButtonState extends State<PinButton> {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    var bloc = context.bloc<PinBloc>();

    return FlatButton(
      color: Colors.grey,
      child: widget.icon != null
          ? widget.icon
          : Text(
              widget.value,
              style: TextStyle(fontSize: 30),
            ),
      onPressed: () {
        if (widget.icon != null) {
          bloc.add(RemovePin(number: widget.value));
        } else {
          bloc.add(AddPin(number: widget.value));
        }
      },
    );
  }
}
