
import 'package:glide/features/login/data/models/login_user_model.dart';
import 'package:glide/features/login/domain/entities/login_user_entity.dart';

extension LoginResponseModelMapper on LoginResponseModel {
  LoginResponseEntity toEntity() {
    return LoginResponseEntity(
      accessToken: tokens.accessToken,
      refreshToken: tokens.refreshToken,
      expiresIn: tokens.expiresIn,
      tokenType: tokens.tokenType,
      user: user.toEntity(),
    );
  }
}

extension UserModelMapper on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      email: email,
      username: username,
      role: role,
      isVip: isVip,
    );
  }
}
