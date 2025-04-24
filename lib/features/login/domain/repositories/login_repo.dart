import 'package:dartz/dartz.dart';
import 'package:glide/core/networking/failure.dart';
import 'package:glide/features/login/domain/entities/login_user_entity.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginResponseEntity>> login({
    required String email,
    required String password,
  });
}
