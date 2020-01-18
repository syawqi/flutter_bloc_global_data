import 'package:meta/meta.dart';

@immutable
abstract class CounterEvent {}

class SetCounter extends CounterEvent{
  final status;
  SetCounter(this.status);
}

class GetCounter extends CounterEvent{

}
