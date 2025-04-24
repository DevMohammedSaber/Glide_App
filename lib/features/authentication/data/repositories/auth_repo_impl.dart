import 'package:dartz/dartz.dart';
import 'package:glide/core/networking/failure.dart';
import 'package:glide/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:glide/features/authentication/data/models/user_model.dart';
import 'package:glide/features/authentication/domain/entities/user_entity.dart';
import 'package:glide/features/authentication/domain/repositories/auth_repo.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource);
  
  @override
  Future<Either<Failure, UserEntity>> register(
      {required String email,
      required String password,
      required String userName,
      required String phoneNumber}) async {
    final response = await _authRemoteDataSource.register(
      email: email,
      password: password,
      userName: userName,
      phoneNumber: phoneNumber,
    );
    return response;
  }

  @override
  Future<String> sendOtp(String phoneNumber) async {
    final response = await _authRemoteDataSource.sendOtp(phoneNumber);
    return response;
  }

  @override
  Future<AuthModel> verifyOtp(String verificationId, String smsCode) async {
    final response =
        await _authRemoteDataSource.verifyOtp(verificationId, smsCode);
    return response;
  }

  @override
  Future<AuthModel> signInWithGoogle() async {
    final response = await _authRemoteDataSource.signInWithGoogle();
    return response;
  }

  @override
  Future<UserEntity?> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
  
  
}
