import 'package:glide/features/authentication/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<void> sendOtp(String phoneNumber);
  Future<AuthEntity> verifyOtp(String verificationId, String smsCode);
  Future<AuthEntity> signInWithGoogle();
  Future<void> logout();
  Future<AuthEntity?> getCurrentUser();
}
