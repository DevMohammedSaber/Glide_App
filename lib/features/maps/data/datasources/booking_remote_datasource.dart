import 'package:dartz/dartz.dart';
import 'package:glide/core/networking/failure.dart';
import 'package:glide/features/maps/data/models/booking_request_model.dart';
import 'package:glide/features/maps/data/models/booking_response_model.dart';

abstract class BookingRemoteDataSource {
  Future<Either<Failure, BookingResponseModel>> booking({
    required BookingRequestModel bookingRequestModel,
  });
  Future<Either<Failure, BookingResponseModel>> rideStatus({required String bookingId});
}
