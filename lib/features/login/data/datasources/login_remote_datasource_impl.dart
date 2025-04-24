import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:glide/core/networking/app_apis.dart';
import 'package:glide/core/networking/dio_consumer.dart';
import 'package:glide/core/networking/failure.dart';
import 'package:glide/features/login/data/datasources/login_remote_datasource.dart';
import 'package:glide/features/login/data/models/login_user_model.dart';

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final DioConsumer _dioConsumer;

  LoginRemoteDataSourceImpl(this._dioConsumer);

  @override
  Future<Either<Failure, LoginResponseModel>> login(
      {required String email, required String password}) async {
    try {
      final Response response = await _dioConsumer.post(
        path: AppApis.login,
        body: {
          "email": email,
          "password": password,
        },
      );

      if (response.statusCode.toString().contains('20')) {
        return Right(LoginResponseModel.fromJson(response.data));
      } else {
        return Left(Failure(message: response.data['message']));
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
