import 'package:equatable/equatable.dart';

abstract class BookingStates extends Equatable {}

class InitialBookingState extends BookingStates {
  @override
  List<Object?> get props => [];
}
class BookingLoadingState extends BookingStates {
  @override
  List<Object?> get props => [];
}
class BookingSuccessState extends BookingStates {
  BookingSuccessState();

  @override
  List<Object?> get props => [];
}

class BookingErrorState extends BookingStates {
  final String message;
  BookingErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
