part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class RegisterAuthEvent extends AuthEvent {
  RegisterAuthEvent({
    required this.userAccount,
    required this.isRegister,
  });

  final UserAccount userAccount;
  final bool isRegister;
}
