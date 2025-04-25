import 'package:dartz/dartz.dart';
import 'package:glide/core/networking/failure.dart';
import 'package:glide/features/maps/data/datasources/booking_remote_datasource.dart';
import 'package:glide/features/maps/data/mapper/booking_request_mapper.dart';
import 'package:glide/features/maps/data/mapper/booking_response_mapper.dart';
import 'package:glide/features/maps/domain/entities/booking_request_entity.dart';
import 'package:glide/features/maps/domain/entities/booking_response_entity.dart';
import 'package:glide/features/maps/domain/repositories/booking_repo.dart';

class BookingRepositoryImpl implements BookingRepository {
  final BookingRemoteDataSource _bookingRemoteDataSource;

  BookingRepositoryImpl(this._bookingRemoteDataSource);
  @override
  Future<Either<Failure, BookingResponseEntity>> booking(
      {required BookingRequestEntity bookingRequestEntity}) async {
    final response = await _bookingRemoteDataSource.booking(
      bookingRequestModel: bookingRequestEntity.toModel(),
    );
    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toEntity()),
    );
  }

  @override
  Future<Either<Failure, BookingResponseEntity>> rideStatus(
      {required String bookingId}) async {
    final response = await _bookingRemoteDataSource.rideStatus(
      bookingId: bookingId,
    );
    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toEntity()),
    );
  }
}
