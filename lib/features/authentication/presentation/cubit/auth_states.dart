import 'package:equatable/equatable.dart';

abstract class AuthStates extends Equatable {
  const AuthStates();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthStates {
  const AuthInitial();
}

class AuthLoading extends AuthStates {
  const AuthLoading();
}

class AuthWithGoogleSuccess extends AuthStates {
  const AuthWithGoogleSuccess();
}

class AuthWithGoogleError extends AuthStates {
  final String error;

  const AuthWithGoogleError({required this.error});

  @override
  List<Object> get props => [error];
}


class AuthWithPhoneNumberSendOtpSuccess extends AuthStates {
  const AuthWithPhoneNumberSendOtpSuccess();
}

class AuthWithPhoneNumberSendOtpError extends AuthStates {
  final String error;

  const AuthWithPhoneNumberSendOtpError({required this.error});

  @override
  List<Object> get props => [error];
}
class AuthWithPhoneNumberVerifyOtpSuccess extends AuthStates {
  const AuthWithPhoneNumberVerifyOtpSuccess();
}

class AuthWithPhoneNumberVerifyOtpError extends AuthStates {
  final String error;

  const AuthWithPhoneNumberVerifyOtpError({required this.error});

  @override
  List<Object> get props => [error];
}