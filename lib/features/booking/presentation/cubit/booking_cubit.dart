import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glide/features/booking/domain/entities/booking_request_entity.dart';
import 'package:glide/features/booking/domain/entities/booking_response_entity.dart';
import 'package:glide/features/booking/domain/usecases/booking_usecase.dart';
import 'package:glide/features/booking/domain/usecases/cancel_ride_usecase.dart';
import 'package:glide/features/booking/domain/usecases/ride_status_usecase.dart';
import 'package:glide/features/booking/presentation/cubit/booking_states.dart';
import 'package:glide/features/booking/presentation/widgets/services_list.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

class BookingCubit extends Cubit<BookingStates> {
  BookingCubit({
    required this.bookingUsecase,
    required this.rideStatusUsecase,
    required this.cancelRideUsecase,
  }) : super(InitialBookingState());
  final BookingUsecase bookingUsecase;
  final RideStatusUsecase rideStatusUsecase;
  final CancelRideUsecase cancelRideUsecase;
  final btnController = RoundedLoadingButtonController();
  final cancelBtnController = RoundedLoadingButtonController();
  final rateBtnController = RoundedLoadingButtonController();
  Timer? _timer;
  int rideId = 0;

  Future<void> booking(
      {required LatLng dropoffLocation,
      required LatLng pickupLocation,
      required int selectedIndex}) async {
    emit(BookingLoadingState());
    final response = await bookingUsecase.call(
      bookingRequestEntity: BookingRequestEntity(
        dropoffLocation: DropoffLocationEntity(
            latitude: dropoffLocation.latitude,
            longitude: dropoffLocation.longitude),
        pickupLocation: PickupLocationEntity(
            latitude: pickupLocation.latitude,
            longitude: pickupLocation.longitude),
        vehicleType: services[selectedIndex].value,
        // dropoffAddressId: 0,
        // pickupAddressId: 0,
        // scheduledTime: '',
        // vehicleType: '',
        // isWheelchairNeeded: false,
        // paymentMethodId: 0,
        // notes: '',
      ),
    );
    response.fold(
      (failure) {
        emit(BookingErrorState(message: failure.message));
        btnController.error();
        Future.delayed(const Duration(seconds: 2), () {
          btnController.stop();
          btnController.reset();
        });
      },
      (model) {
        btnController.success();
        pollingData(bookingId: model.id);
      },
    );
  }

  Future<BookingResponseEntity?> getRideStatus({required int bookingId}) async {
    final response = await rideStatusUsecase.call(bookingId: bookingId);

    BookingResponseEntity? rideStatus;
    response.fold(
      (failure) {
        emit(BookingErrorState(message: failure.message));
      },
      (model) {
        // emit(BookingSuccessState());
        rideStatus = model;
      },
    );
    return rideStatus;
  }

  void pollingData({required int bookingId}) async {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      final response = await getRideStatus(bookingId: bookingId);
      if (response != null) {
        if (response.status == "cancelled" || response.status == "completed") {
          timer.cancel();
        }
        rideId = response.id;
        emit(RideStatusSuccessState(rideStatus: response));
      }
    });
  }

  Future<void> cancelRide({required int bookingId}) async {
    final response = await cancelRideUsecase.call(bookingId: bookingId);

    response.fold(
      (failure) {
        // emit(CancelRideErrorState(message: failure.message));
        cancelBtnController.error();
        Future.delayed(const Duration(seconds: 2), () {
          cancelBtnController.stop();
          cancelBtnController.reset();
        });
      },
      (model) {
        emit(CancelRideSuccessState());
        _timer?.cancel();
        cancelBtnController.success();
        Future.delayed(const Duration(seconds: 2), () {
          cancelBtnController.stop();
          cancelBtnController.reset();
        });
      },
    );
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
