import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignUpEvent extends AuthEvent {
  final String name;
  final String phone;
  final String password;
  final String passwordConfirmation;

  SignUpEvent({
    required this.name,
    required this.phone,
    required this.password,
    required this.passwordConfirmation,
  });

  @override
  List<Object> get props => [name, phone, password, passwordConfirmation];
}

class LoginEvent extends AuthEvent {
  final String phone;
  final String password;

  LoginEvent({
    required this.phone,
    required this.password,
  });

  @override
  List<Object> get props => [phone, password];
}

class LogoutEvent extends AuthEvent {}

class CheckUserTokenEvent extends AuthEvent {}
