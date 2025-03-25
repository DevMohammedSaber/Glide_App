import 'package:glide/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:glide/features/authentication/data/models/user_model.dart';
import 'package:glide/features/authentication/domain/entities/user_entity.dart';
import 'package:glide/features/authentication/domain/repositories/auth_repo.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource);
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
  Future<AuthEntity?> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }
  
  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
