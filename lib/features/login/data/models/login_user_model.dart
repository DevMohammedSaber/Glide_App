class LoginResponseModel  {
  final Tokens tokens;
  final UserModel user;

  LoginResponseModel({
    required this.tokens,
    required this.user,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      tokens: Tokens.fromJson(json['tokens']),
      user: UserModel.fromJson(json['user']),
    );
  }
}

class Tokens {
  final String accessToken;
  final int expiresIn;
  final String refreshToken;
  final String tokenType;

  Tokens({
    required this.accessToken,
    required this.expiresIn,
    required this.refreshToken,
    required this.tokenType,
  });

  factory Tokens.fromJson(Map<String, dynamic> json) {
    return Tokens(
      accessToken: json['access_token'],
      expiresIn: json['expires_in'],
      refreshToken: json['refresh_token'],
      tokenType: json['token_type'],
    );
  }
}

class UserModel {
  final int id;
  final String email;
  final String username;
  final String role;
  final bool isVip;

  UserModel({
    required this.id,
    required this.email,
    required this.username,
    required this.role,
    required this.isVip,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      role: json['role'],
      isVip: json['is_vip'],
    );
  }
}
