import 'package:glide/features/authentication/domain/repositories/auth_repo.dart';

class SendOtpUseCase {
  final AuthRepository repository;
  SendOtpUseCase(this.repository);
  Future<void> call(String phoneNumber) => repository.sendOtp(phoneNumber);
}
