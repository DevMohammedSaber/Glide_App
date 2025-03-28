import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glide/features/schedule/presentation/cubit/map_states.dart';

class MapCubit extends Cubit<MapStates> {
  MapCubit() : super(InitialMapState());

  void counterIncrementDecrement(int value) {
    emit(CounterState(value + 1));
  }
}
