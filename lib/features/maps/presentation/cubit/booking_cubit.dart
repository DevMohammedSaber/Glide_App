import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glide/features/maps/domain/entities/booking_request_entity.dart';
import 'package:glide/features/maps/domain/usecases/booking_usecase.dart';
import 'package:glide/features/maps/domain/usecases/ride_status_usecase.dart';
import 'package:glide/features/maps/presentation/cubit/booking_states.dart';
import 'package:glide/features/maps/presentation/widgets/services_list.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

class BookingCubit extends Cubit<BookingStates> {
  BookingCubit({required this.bookingUsecase, required this.rideStatusUsecase})
      : super(InitialBookingState());
  final BookingUsecase bookingUsecase;
  final RideStatusUsecase rideStatusUsecase;
  final btnController = RoundedLoadingButtonController();
  Future<void> booking(
      {required LatLng dropoffLocation, required LatLng pickupLocation, required int selectedIndex}) async {
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
      },
      (model) {
        emit(BookingSuccessState());
        btnController.success();
      },
    );
    Future.delayed(const Duration(seconds: 2), () {
      btnController.stop();
      btnController.reset();
    });
  }

  Future<void> getRideStatus({required String bookingId}) async {
    emit(BookingLoadingState());
    final response = await rideStatusUsecase.call(
      bookingId: bookingId,
    );
    response.fold(
      (failure) {
        emit(BookingErrorState(message: failure.message));
        btnController.error();
      },
      (model) {
        emit(BookingSuccessState());
        btnController.success();
      },
    );
    Future.delayed(const Duration(seconds: 2), () {
      btnController.stop();
      btnController.reset();
    });
  }
}
