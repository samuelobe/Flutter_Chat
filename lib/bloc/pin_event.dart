part of 'pin_bloc.dart';

abstract class PinEvent{
  const PinEvent();
}

class AddPin extends PinEvent {
  final String number;
  AddPin({this.number});

}

class RemovePin extends PinEvent {
final String number;
  RemovePin({this.number});

}
