import 'package:dartz/dartz.dart';
import 'package:glide/core/networking/failure.dart';
import 'package:glide/features/login/data/datasources/login_remote_datasource.dart';
import 'package:glide/features/login/data/mapper/login_mapper.dart';
import 'package:glide/features/login/domain/entities/login_user_entity.dart';
import 'package:glide/features/login/domain/repositories/login_repo.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource _loginRemoteDataSource;

  LoginRepositoryImpl(this._loginRemoteDataSource);
  @override
  Future<Either<Failure, LoginResponseEntity>> login(
      {required String email, required String password}) async {
    final response = await _loginRemoteDataSource.login(
      email: email,
      password: password,
    );
    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toEntity()),
    );
  }
}
