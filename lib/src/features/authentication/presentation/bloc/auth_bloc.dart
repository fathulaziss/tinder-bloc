// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tinder/src/features/authentication/data/data_user_account_local.dart';
import 'package:tinder/src/features/authentication/domain/user_account.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<RegisterAuthEvent>((event, emit) async {
      emit(AuthLoading());
      await DataUserAccountLocal.setDataUserAccountToStorage(event.userAccount);
      await UserAccountRegister.setUserAccountRegister(
        isRegister: event.isRegister,
      );
      await Future.delayed(const Duration(seconds: 2));
      emit(
        AuthSuccess(
          userAccount: event.userAccount,
          isRegister: event.isRegister,
        ),
      );
    });
  }
}
