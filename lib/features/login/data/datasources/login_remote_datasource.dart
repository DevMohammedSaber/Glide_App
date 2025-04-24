import 'package:dartz/dartz.dart';
import 'package:glide/core/networking/failure.dart';
import 'package:glide/features/login/data/models/login_user_model.dart';

abstract class LoginRemoteDataSource {
  Future<Either<Failure, LoginResponseModel>> login({
    required String email,
    required String password,
  });
}
