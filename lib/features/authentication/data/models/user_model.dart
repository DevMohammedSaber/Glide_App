import 'package:glide/features/authentication/domain/entities/user_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    required super.uid,
    required super.email,
    required super.displayName,
    required super.phoneNumber,
    required super.providerId,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      uid: json['uid'],
      email: json['email'],
      displayName: json['displayName'],
      phoneNumber: json['phoneNumber'],
      providerId: json['providerId'],
    );
  }
}
