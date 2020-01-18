import 'package:meta/meta.dart';

@immutable
abstract class CounterState {
  final int init;

  CounterState(this.init);
}

class InitialCounterState extends CounterState {
  InitialCounterState() : super(0);
}

class SetStateData extends CounterState{
  final num data;

  SetStateData(this.data) : super(data);
}

class GetStateData extends CounterState{
  final num data;
  GetStateData(this.data) : super(data);
}