import 'package:dartz/dartz.dart';
import 'package:glide/core/networking/failure.dart';
import 'package:glide/features/booking/domain/entities/booking_request_entity.dart';
import 'package:glide/features/booking/domain/entities/booking_response_entity.dart';

abstract class BookingRepository {
  Future<Either<Failure, BookingResponseEntity>> booking({
    required BookingRequestEntity bookingRequestEntity,
  });
  Future<Either<Failure, BookingResponseEntity>> rideStatus({
    required int bookingId,
  });
  Future<Either<Failure, dynamic>> cancelRide({
    required int bookingId,
  });
}
