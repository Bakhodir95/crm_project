import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  String token;
  AuthAuthenticated({required this.token});
}

class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});

  @override
  List<Object> get props => [message];
}

class AuthLoggedOut extends AuthState {}
