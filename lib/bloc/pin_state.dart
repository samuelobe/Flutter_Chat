part of 'pin_bloc.dart';

abstract class PinState extends Equatable {
  const PinState();
}

class PinInitial extends PinState {
  @override
  List<Object> get props => [];
}

class PinAdded extends PinState {
  final String number;
  PinAdded({this.number});
  @override
  List<Object> get props => [];
}
