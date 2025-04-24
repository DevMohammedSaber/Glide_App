import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String uid;
  final String? phoneNumber;
  final String? email;
  final String? displayName;
  final String? providerId;

  const UserEntity({
    required this.uid,
    this.phoneNumber,
    this.email,
    this.displayName,
    this.providerId,
  });

  @override
  List<Object?> get props => [uid, phoneNumber, email, displayName, providerId];
}
