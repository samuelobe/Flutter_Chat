import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pin_event.dart';
part 'pin_state.dart';

class PinBloc extends Bloc<PinEvent, PinState> {
  @override
  PinState get initialState => PinInitial();

  @override
  Stream<PinState> mapEventToState(
    PinEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
