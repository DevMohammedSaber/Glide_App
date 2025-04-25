import 'package:dartz/dartz.dart';
import 'package:glide/core/networking/failure.dart';
import 'package:glide/features/booking/domain/repositories/booking_repo.dart';

class CancelRideUsecase {
  final BookingRepository repository;
  CancelRideUsecase(
    this.repository,
  );

  Future<Either<Failure, dynamic>> call({
    required int bookingId,
  }) =>
      repository.cancelRide(
        bookingId: bookingId,
      );
}
