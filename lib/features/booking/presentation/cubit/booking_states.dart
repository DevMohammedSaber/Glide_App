import 'package:equatable/equatable.dart';
import 'package:glide/features/booking/domain/entities/booking_response_entity.dart';

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

class RideStatusSuccessState extends BookingStates {
  final BookingResponseEntity rideStatus;
  RideStatusSuccessState({required this.rideStatus});

  @override
  List<Object?> get props => [rideStatus];
}

class CancelRideSuccessState extends BookingStates {
  CancelRideSuccessState();

  @override
  List<Object?> get props => [];
}

class CancelRideErrorState extends BookingStates {
  final String message;
  CancelRideErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

class BookingErrorState extends BookingStates {
  final String message;
  BookingErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
