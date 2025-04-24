import 'package:dartz/dartz.dart';
import 'package:glide/core/networking/failure.dart';
import 'package:glide/features/authentication/domain/entities/user_entity.dart';
import 'package:glide/features/authentication/domain/repositories/auth_repo.dart';

class RegisterUsecase {
  final AuthRepository repository;
  RegisterUsecase(
    this.repository,
  );

  Future<Either<Failure, UserEntity>> call({
    required String email,
    required String password,
    required String userName,
    required String phoneNumber,
  }) =>
      repository.register(
        email: email,
        password: password,
        userName: userName,
        phoneNumber: phoneNumber,
      );
}
