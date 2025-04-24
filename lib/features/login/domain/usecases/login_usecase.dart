import 'package:dartz/dartz.dart';
import 'package:glide/core/networking/failure.dart';
import 'package:glide/features/login/domain/entities/login_user_entity.dart';
import 'package:glide/features/login/domain/repositories/login_repo.dart';

class LoginUsecase {
  final LoginRepository repository;
  LoginUsecase(
    this.repository,
  );

  Future<Either<Failure, LoginResponseEntity>> call({
    required String email,
    required String password,
  }) =>
      repository.login(
        email: email,
        password: password,
      );
}
