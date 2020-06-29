part of 'pin_bloc.dart';

abstract class PinEvent extends Equatable {
  const PinEvent();
}

class AddPin extends PinEvent {
  final String number;
  AddPin({this.number});

  @override
  List<Object> get props => [number];
}

class RemovePin extends PinEvent {
final String number;
  RemovePin({this.number});
  @override
  List<Object> get props => [number];
}
