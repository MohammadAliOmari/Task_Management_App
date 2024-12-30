part of 'login_cubit.dart';

abstract class LoginState {}

final class LoginInitialState extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {
  final LoginModel loginModel;

  LoginSuccessState(this.loginModel);
}

final class LoginFialerState extends LoginState {
  final String error;

  LoginFialerState(this.error);
}

final class LoginPasswordVisibilityState extends LoginState {}
