part of 'sign_up_cubit.dart';

abstract class SignUpState {}

final class SignUpInitialState extends SignUpState {}

final class SignUpLoadingState extends SignUpState {}

final class SignUpSuccessState extends SignUpState {
  final SignUpModel signUpModel;
  SignUpSuccessState(this.signUpModel);
}

final class SignUpFialerState extends SignUpState {
  final String message;
  SignUpFialerState(this.message);
}

final class SignUpPasswordVisibilityState extends SignUpState {
  final bool obscureText;

  SignUpPasswordVisibilityState(this.obscureText);
}
