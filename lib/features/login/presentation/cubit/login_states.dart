import 'package:equatable/equatable.dart';

abstract class LoginStates extends Equatable {
  const LoginStates();

  @override
  List<Object> get props => [];
}

class LoginStateInitial extends LoginStates {
  const LoginStateInitial();
}

class LoginStateLoading extends LoginStates {
  const LoginStateLoading();
}

class LoginStateSuccess extends LoginStates {
  const LoginStateSuccess();
}

class LoginStateError extends LoginStates {
  final String error;

  const LoginStateError({required this.error});

  @override
  List<Object> get props => [error];
}

