import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:blocstate/prefs/data.dart';
import './bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  @override
  CounterState get initialState => InitialCounterState();

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    if (event is SetCounter) {
      if (event.status) {
        counterData = state.init + 1;
      } else {
        counterData = state.init - 1;
      }

      yield SetStateData(counterData);
    }

    if (event is GetCounter) {
      yield GetStateData(counterData);
    }
  }
}
