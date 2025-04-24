import 'package:equatable/equatable.dart';

class LoginResponseEntity extends Equatable {
  final String accessToken;
  final String refreshToken;
  final int expiresIn;
  final String tokenType;
  final UserEntity user;

  const LoginResponseEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
    required this.tokenType,
    required this.user,
  });

  @override
  List<Object?> get props =>
      [accessToken, refreshToken, expiresIn, tokenType, user];
}

class UserEntity extends Equatable {
  final int id;
  final String email;
  final String username;
  final String role;
  final bool isVip;

  const UserEntity({
    required this.id,
    required this.email,
    required this.username,
    required this.role,
    required this.isVip,
  });

  @override
  List<Object?> get props => [id, email, username, role, isVip];
}
