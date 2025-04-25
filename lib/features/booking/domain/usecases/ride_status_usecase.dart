import 'package:dartz/dartz.dart';
import 'package:glide/core/networking/failure.dart';
import 'package:glide/features/booking/domain/entities/booking_response_entity.dart';
import 'package:glide/features/booking/domain/repositories/booking_repo.dart';

class RideStatusUsecase {
  final BookingRepository repository;
  RideStatusUsecase(
    this.repository,
  );

  Future<Either<Failure, BookingResponseEntity>> call({
    required int bookingId,
  }) =>
      repository.rideStatus(
        bookingId: bookingId,
      );
}
