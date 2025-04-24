import 'package:dartz/dartz.dart';
import 'package:glide/core/networking/failure.dart';
import 'package:glide/features/maps/domain/entities/booking_request_entity.dart';
import 'package:glide/features/maps/domain/entities/booking_response_entity.dart';
import 'package:glide/features/maps/domain/repositories/booking_repo.dart';

class BookingUsecase {
  final BookingRepository repository;
  BookingUsecase(
    this.repository,
  );

  Future<Either<Failure, BookingResponseEntity>> call({
    required BookingRequestEntity bookingRequestEntity,
  }) =>
      repository.booking(
        bookingRequestEntity: bookingRequestEntity,
      );
}
