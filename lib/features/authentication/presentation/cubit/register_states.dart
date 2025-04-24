import 'package:equatable/equatable.dart';

abstract class RegisterStates extends Equatable {
  const RegisterStates();

  @override
  List<Object> get props => [];
}

class RegisterStateInitial extends RegisterStates {
  const RegisterStateInitial();
}

class RegisterStateLoading extends RegisterStates {
  const RegisterStateLoading();
}

class RegisterStateSuccess extends RegisterStates {
  const RegisterStateSuccess();
}

class RegisterStateError extends RegisterStates {
  final String error;

  const RegisterStateError({required this.error});

  @override
  List<Object> get props => [error];
}

