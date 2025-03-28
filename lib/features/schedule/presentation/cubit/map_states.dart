import 'package:equatable/equatable.dart';

abstract class MapStates extends Equatable {}

class InitialMapState extends MapStates {
  @override
  List<Object?> get props => [];
}

class CounterState extends MapStates {
  final int count;
  CounterState(this.count);
  @override
  List<Object?> get props => [count];
}
