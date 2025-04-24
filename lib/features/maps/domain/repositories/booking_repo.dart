import 'package:dartz/dartz.dart';
import 'package:glide/core/networking/failure.dart';
import 'package:glide/features/maps/domain/entities/booking_request_entity.dart';
import 'package:glide/features/maps/domain/entities/booking_response_entity.dart';

abstract class BookingRepository {
  Future<Either<Failure, BookingResponseEntity>> booking({
    required BookingRequestEntity bookingRequestEntity,
  });
}
