import 'package:dartz/dartz.dart';
import 'package:glide/core/networking/failure.dart';
import 'package:glide/features/authentication/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<void> sendOtp(String phoneNumber);
  Future<UserEntity> verifyOtp(String verificationId, String smsCode);
  Future<UserEntity> signInWithGoogle();
  Future<void> logout();
  Future<UserEntity?> getCurrentUser();
  Future<Either<Failure, UserEntity>> register({
    required String email,
    required String password,
    required String userName,
    required String phoneNumber,
  });
}
