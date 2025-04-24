import 'package:dartz/dartz.dart';
import 'package:glide/core/networking/failure.dart';
import 'package:glide/features/authentication/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<String> sendOtp(String phoneNumber);
  Future<AuthModel> verifyOtp(String verificationId, String smsCode);
  Future<AuthModel> signInWithGoogle();
  Future<Either<Failure, AuthModel>> register({required String email,
      required String password,
      required String userName,
      required String phoneNumber});
}
