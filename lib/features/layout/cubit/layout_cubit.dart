import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutCubit extends Cubit<int> {
  LayoutCubit() : super(0);

  void changeLayout(int index) => emit(index);
}
