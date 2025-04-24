import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:glide/core/networking/app_apis.dart';
import 'package:glide/core/networking/dio_consumer.dart';
import 'package:glide/core/networking/failure.dart';
import 'package:glide/features/maps/data/datasources/booking_remote_datasource.dart';
import 'package:glide/features/maps/data/models/booking_request_model.dart';
import 'package:glide/features/maps/data/models/booking_response_model.dart';

class BookingRemoteDataSourceImpl implements BookingRemoteDataSource {
  final DioConsumer _dioConsumer;

  BookingRemoteDataSourceImpl(this._dioConsumer);

  @override
  Future<Either<Failure, BookingResponseModel>> booking(
      {required BookingRequestModel bookingRequestModel}) async {
    try {
      final Response response = await _dioConsumer.post(
        path: AppApis.booking,
        body: bookingRequestModel.toJson(),
      );

      if (response.statusCode.toString().contains('20')) {
        return Right(BookingResponseModel.fromJson(response.data));
      } else {
        return Left(Failure(message: response.data['message']));
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
