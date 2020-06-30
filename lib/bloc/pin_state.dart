part of 'pin_bloc.dart';

abstract class PinState{
  const PinState();
}

class PinInitial extends PinState {

}

class PinAdded extends PinState {
  final String number;
  PinAdded({this.number});

}

class PinRemoved extends PinState {
  

}
