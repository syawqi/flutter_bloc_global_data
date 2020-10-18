import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:blocstate/prefs/data.dart';
import '../prefs/data.dart';
import './bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {

  CounterBloc(CounterState initialState) : super(initialState);

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    if (event is SetCounter) {
      if (event.status) {
        counterData.value = counterData.value + 1;
      } else {
        counterData.value = counterData.value - 1;
      }

      counterData.notifyListeners();

      yield SetStateData(counterData.value);
    }

    if (event is GetCounter) {
      yield GetStateData(counterData.value);
    }
  }
}
