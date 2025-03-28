import 'package:flutter_bloc/flutter_bloc.dart';

class SingleSelectionCubit extends Cubit<int?> {
  SingleSelectionCubit() : super(null);

  void select(int index) {
    emit(state == index ? null : index);
  }
}