part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  AuthSuccess({
    required this.userAccount,
    required this.isRegister,
  });

  final UserAccount userAccount;
  final bool isRegister;
}
