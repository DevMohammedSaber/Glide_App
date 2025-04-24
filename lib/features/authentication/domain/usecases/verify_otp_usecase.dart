import 'package:glide/features/authentication/domain/entities/user_entity.dart';
import 'package:glide/features/authentication/domain/repositories/auth_repo.dart';

class VerifyOtpUseCase {
  final AuthRepository repository;
  VerifyOtpUseCase(this.repository);
  Future<UserEntity> call(String verificationId, String smsCode) =>
      repository.verifyOtp(verificationId, smsCode);
}
