import 'package:glide/features/authentication/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<String> sendOtp(String phoneNumber);
  Future<AuthModel> verifyOtp(String verificationId, String smsCode);
  Future<AuthModel> signInWithGoogle();
}
